///usr/bin/env jbang "$0" "$@" ; exit $?
//JAVA 17+
//DEPS info.picocli:picocli:4.5.0
//DEPS com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.13.2
//DEPS com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.13.2
//DEPS com.google.api-client:google-api-client:1.23.0
//DEPS com.google.oauth-client:google-oauth-client-jetty:1.23.0
//DEPS com.google.apis:google-api-services-youtube:v3-rev222-1.25.0

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.dataformat.yaml.YAMLGenerator;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ChannelListResponse;
import com.google.api.services.youtube.model.PlaylistItem;
import com.google.api.services.youtube.model.PlaylistItemListResponse;

import picocli.CommandLine;
import picocli.CommandLine.ArgGroup;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.PropertiesDefaultProvider;

@Command(name = "FetchFromYouTube", mixinStandardHelpOptions = true,
        description = "FetchFromYouTube made with jbang",
        defaultValueProvider = PropertiesDefaultProvider.class)
class FetchFromYouTube implements Callable<Integer> {

    @Option(names = "--apikey", descriptionKey = "GOOGLE_API_KEY")
    private String google_api_key;

    @ArgGroup(exclusive = true, multiplicity = "1")
    XORArgGroup xorGroup;
    static class XORArgGroup {
        @Option(names = "--channelId", required = true)
        private String channelId;
        @Option(names = "--playlistId", required = true)
        private String playlistId;
    }

    public static void main(String... args) {
        CommandLine cmd = new CommandLine(new FetchFromYouTube());
        File defaultsFile = new File(".env");
        cmd.setDefaultValueProvider(new PropertiesDefaultProvider(defaultsFile));
        int exitCode = cmd.execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() throws Exception {
        final ObjectMapper MAPPER = new ObjectMapper(new YAMLFactory().enable(YAMLGenerator.Feature.MINIMIZE_QUOTES).disable(YAMLGenerator.Feature.WRITE_DOC_START_MARKER));
        MAPPER.findAndRegisterModules();
        youtubeService = getService();
        determinePlaylistId();
        List<Video> videos = new ArrayList<>();
        String nextPageToken = null;
        do {
            PlaylistItemListResponse response = getPlayListItemList(nextPageToken);
            nextPageToken = response.getNextPageToken();
            for (PlaylistItem item : response.getItems()) {
                Video video = new Video(item.getContentDetails().getVideoId(),
                        null,
                        item.getSnippet().getTitle(),
                        ZonedDateTime.parse(item.getSnippet().getPublishedAt().toStringRfc3339()).toLocalDate(),
                        null);
                videos.add(video);
            }
        } while (nextPageToken != null);
        final String yaml = MAPPER.writeValueAsString(videos);
        System.out.println(yaml);
        return 0;
    }

    private PlaylistItemListResponse getPlayListItemList(String pageToken) throws IOException {
        YouTube.PlaylistItems.List request = youtubeService.playlistItems()
            .list("snippet,contentDetails");
        PlaylistItemListResponse response = request.setKey(google_api_key)
            .setMaxResults(50L)
            .setPageToken(pageToken)
            .setPlaylistId(xorGroup.playlistId)
            .execute();
        return response;
    }

    private void determinePlaylistId() throws IOException {
        if (xorGroup.channelId != null) {
            YouTube.Channels.List request = youtubeService.channels()
                .list("contentDetails");
            ChannelListResponse response = request.setKey(google_api_key)
                .setId(xorGroup.channelId)
                .execute();
            xorGroup.playlistId = response.getItems().get(0).getContentDetails().getRelatedPlaylists().getUploads();
        }
    }

    private static final String APPLICATION_NAME = "FetchFromYouTube made with jbang";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    private YouTube youtubeService;

    public static YouTube getService() throws GeneralSecurityException, IOException {
        final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
        return new YouTube.Builder(httpTransport, JSON_FACTORY, null)
            .setApplicationName(APPLICATION_NAME)
            .build();
    }
}

@JsonInclude(Include.NON_NULL)
record Video (String youtubeId,
    String title,
    String author,
    @JsonFormat(pattern="yyyy-MM-dd")
    LocalDate date,
    List<String> tags) { }