///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.13.2
//DEPS com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.13.2

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.dataformat.yaml.YAMLGenerator;

public class SortVideos {

    private static final File VIDEOS_FILE = new File("../data/videos.yml");

    public static void main(String... args) throws Exception {
        final ObjectMapper MAPPER = new ObjectMapper(new YAMLFactory().enable(YAMLGenerator.Feature.MINIMIZE_QUOTES).disable(YAMLGenerator.Feature.WRITE_DOC_START_MARKER));
        MAPPER.findAndRegisterModules();
        List<Video> unmarshalledVideos = MAPPER.readValue(VIDEOS_FILE, new TypeReference<List<Video>>() { });
        Map<String, List<Video>> collect = unmarshalledVideos.stream().collect(Collectors.groupingBy(Video::getYoutubeId));
        List<Video> videos = new ArrayList<>();
        for (Entry<String, List<Video>> entry : collect.entrySet()) {
            Set<Video> folding = new HashSet<>(entry.getValue());
            if (folding.size() != 1) {
                throw new IllegalStateException("Duplicates detected with differing definition, for the same youtubeId: " + entry.getKey());
            }
            videos.add(folding.iterator().next());
        }     
        Collections.sort(videos, Comparator.comparing(Video::getDate).reversed());

        List<String> headerLines = Files.readAllLines(VIDEOS_FILE.toPath()).stream().filter(line -> line.startsWith("#")).collect(Collectors.toList());
        BufferedWriter writer = new BufferedWriter(new FileWriter(VIDEOS_FILE));
        for (String h : headerLines) {
            writer.append(h).append("\n");
        }
        writer.append("\n");
        for (Video v : videos) {
            writer.append(MAPPER.writeValueAsString(Arrays.asList(v)));
            writer.append("\n");
        }
        writer.close();
    }
}

@JsonInclude(Include.NON_NULL)
class Video {
    public String youtubeId;
    public String title;
    public String author;
    @JsonFormat(pattern="yyyy-MM-dd")
    public LocalDate date;
    public List<String> tags;

    public String getYoutubeId() {
        return youtubeId;
    }
    public LocalDate getDate() { 
        return date;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((author == null) ? 0 : author.hashCode());
        result = prime * result + ((date == null) ? 0 : date.hashCode());
        result = prime * result + ((tags == null) ? 0 : tags.hashCode());
        result = prime * result + ((title == null) ? 0 : title.hashCode());
        result = prime * result + ((youtubeId == null) ? 0 : youtubeId.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Video other = (Video) obj;
        if (author == null) {
            if (other.author != null)
                return false;
        } else if (!author.equals(other.author))
            return false;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        if (tags == null) {
            if (other.tags != null)
                return false;
        } else if (!tags.equals(other.tags))
            return false;
        if (title == null) {
            if (other.title != null)
                return false;
        } else if (!title.equals(other.title))
            return false;
        if (youtubeId == null) {
            if (other.youtubeId != null)
                return false;
        } else if (!youtubeId.equals(other.youtubeId))
            return false;
        return true;
    }
}