<#assign pom = data.get('pom.yml')>
<#assign events = data.get('events.yml').data>
<#assign videos = data.get('videos.yml').data>
<#assign users = data.get('users.yml').data>

<#macro latestReleases>
    <div class="card border-0">
        <div class="card-body">
            <#if pom.latest.version == pom.latestFinal.version>
                <a class="btn btn-lg btn-success w-100"
                   href="${content.rootpath}download/download.html">
                    <img alt="Download" src="/download/download.png">
                    <div>
                        <span>Try ${config.title}</span><br>
                        <span class="small">${pom.latestFinal.version}</span>
                    </div>
                </a>
            </#if>
            <#if pom.latest.version != pom.latestFinal.version>
                <a class="btn btn-lg btn-success w-100"
                   href="${content.rootpath}download/download.html">
                    <img alt="Download" src="/download/download.png">
                    <div>
                        <span>Try ${config.title}</span><br>
                        <span class="small">${pom.latest.version}</span>
                    </div>
                    <div class="small">
                        ${pom.latest.releaseDate?string("EEE d MMMM yyyy")}
                    </div>
                </a>
            </#if>
        </div>
    </div>
</#macro>

<#macro servicesOffer>
    <div class="card border-0">
        <div class="card-body">
            <p>
                <b>Want to talk to the experts?</b>
                Red Hat offers certified binaries with enterprise consulting.
                See <a href="/product/services.html">services</a> for more information.
            </p>
        </div>
    </div>
</#macro>

<#macro latestEvents>
    <div class="card border-0">
        <h1 class="card-title">Events</h1>
        <div class="card-body">
            <ul class="list-unstyled">
                <#list events?reverse as event>
                    <#if .now?date <= event.date?date>
                        <li style="margin-bottom: 10px;">
                            <div class="title">
                                <#if event.url??>
                                    <a href="${event.url}">${event.eventOrganization}</a>
                                <#else>
                                    ${event.eventOrganization}
                                </#if>
                            </div>
                            <span>
                                ${event.location} - ${event.date?string("EEE d MMMM yyyy")}
                                <#if event.talks??>
                                    <ul class="list-unstyled">
                                        <#list event.talks as talk>
                                            <li class="ms-4">
                                                <#if talk.url??>
                                                    <a href="${talk.url}">${talk.title}</a>
                                                <#else>
                                                    ${talk.title}
                                                </#if>
                                                <#if talk.presenters??>
                                                    <span class="small">by ${talk.presenters}</span>
                                                </#if>
                                            </li>
                                        </#list>
                                    </ul>
                                <#elseif event.title?? && event.presenters??>
                                    <ul class="list-unstyled">
                                        <li class="ms-4">
                                                ${event.title}
                                                <span class="small">by ${event.presenters}</span>
                                        </li>
                                    </ul>
                                </#if>
                            </span>
                        </li>
                    </#if>
                </#list>
                <div class="small pull-right">
                    <a href="https://github.com/kiegroup/drools-website/blob/main/data/events.yml">Add event</a>
                    /
                    <a href="${content.rootpath}community/eventsArchive.html">Archive</a>
                </div>
            </ul>
        </div>
    </div>
</#macro>

<#macro latestBlogPosts>
    <div class="card border-0">
        <h1 class="card-title">Blog Posts</h1>
        <div class="card-body">
            <ul class="list-unstyled">
                <#list published_posts[0..2] as blog>
                    <li style="margin-bottom: 10px;">
                        <div class="title">
                            <a href="${content.rootpath}${blog.uri}">${blog.title}</a>
                        </div>
                        <div class="small">${blog.date?string("EEE d MMMM yyyy")}</div>
                        <@userBadgeInline userId=blog.author/>
                    </li>
                </#list>
                <div class="small pull-right">
                    <a href="${content.rootpath}blog/index.html">Blog archive</a>
                </div>
            </ul>
        </div>
    </div>
</#macro>

<#macro latestVideos>
    <div class="card border-0">
        <h1 class="card-title">Videos</h1>
        <div class="card-body">
            <ul class="list-unstyled">
                <#list videos[0..2] as video>
                    <li style="margin-bottom: 10px;">
                        <div class="title">
                            <a href="https://youtu.be/${video.youtubeId}">
                                <img src="${content.rootpath}headerFooter/youtubeLogo.png" alt="YT"
                                     style="height:16px; width:auto;"/>
                                ${video.title}
                            </a>
                        </div>
                        <div class="small">${video.date?string("EEE d MMMM yyyy")}</div>
                        <#if video.author??>
                            <@userBadgeInline userId=video.author/>
                        </#if>
                    </li>
                </#list>
                <div class="small pull-right">
                    <a href="https://www.youtube.com/channel/UCcpkOKpujFlM67D2h0RdaeQ">Video archive</a>
                </div>
            </ul>
        </div>
    </div>
</#macro>

<#macro userBadgeInline userId>
    <#assign user = users?filter(u -> u.userId == userId)?first >
    <div class="userBadge">
        <span>
            <img class="img-rounded pull-left" src="https://www.gravatar.com/avatar/${user.gravatarHashId}?s=20&d=mm"/>
            &nbsp;${user.fullName}
        </span>
    </div>
</#macro>

<#macro userBadge userId long>
    <#assign user = users?filter(u -> u.userId == userId)?first >
    <div class="userBadge card mb-3 border-0" style="max-width: ${long?then("600px", "320px")};">
        <div class="row g-0">
            <div class="col-md-2 align-self-center">
                <img class="rounded pull-left"
                     src="https://www.gravatar.com/avatar/${user.gravatarHashId}?s=50&d=mm"
                     alt="Avatar ${user.fullName}"/>
            </div>
            <div class="col-md-10">
                <div class="card-body p-1">
                    <span class="card-text">
                        <#if user.twitterUsername??>
                            <a href="https://twitter.com/${user.twitterUsername}"><img
                                        src="${content.rootpath}headerFooter/twitterLogo.png" alt="Twitter"/></a>
                        </#if>
                        <#if user.facebookUsername??>
                            <a href="https://www.facebook.com/${user.facebookUsername}"><img
                                        src="${content.rootpath}headerFooter/facebookLogo.png" alt="Facebook"/></a>
                        </#if>
                        <#if user.linkedInId??>
                            <a href="https://www.linkedin.com/in/${user.linkedInId}"><img
                                        src="${content.rootpath}headerFooter/linkedInLogo.png" alt="LinkedIn"/></a>
                        </#if>
                        <#if user.githubUsername??>
                            <a href="https://github.com/${user.githubUsername}"><img
                                        src="${content.rootpath}headerFooter/gitHubLogo.png" alt="GitHub"/></a>
                        </#if>
                    </span>
                    <h4 class="card-title m-0">${user.fullName}</h4>
                    <#-- <p class="small card-text">${user.role}</p> -->
                    <#if long>
                        <#if user.email??>
                            <p class="card-text">
                                <span class="emailSupportPopover">
                                    <strong>Email:</strong>
                                    ${user.email}
                                </span>
                            </p>
                        </#if>
                        <#if user.employedBy??>
                            <p class="card-text">
                                <strong>Employed by:</strong>
                                ${user.employedBy}
                            </p>
                        </#if>
                        <#if user.contributionsDescription??>
                            <p class="card-text">
                                <strong>Contributions:</strong>
                                ${user.contributionsDescription}
                            </p>
                        </#if>
                        <#if user.biography??>
                            <p class="card-text">
                                <strong>Bio:</strong>
                                ${user.biography}
                            </p>
                        </#if>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro relatedVideos>
    <#assign relatedVideos = videos?filter(video -> video.tags?? &amp;&amp; video.tags.contains(content.related_tag))>
    <#if relatedVideos?size &gt; 0>
        <h2>Related videos</h2>
        <#list relatedVideos as video>
            <div class="card border-0">
                <div class="card-body">
                    <a href="https://youtu.be/${video.youtubeId}">
                        <img src="https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg" width="320" height="180"
                             alt="Video screenshot">
                        <div class="title">
                            <img src="${content.rootpath}headerFooter/youtubeLogo.png" alt="YT"
                                 style="height:16px; width:auto;"/>
                            ${video.title}
                        </div>
                    </a>
                    <#if video.author??>
                        <@userBadgeInline userId=video.author/>
                    </#if>
                    <div class="small">${video.date?string("EEE d MMMM yyyy")}</div>
                </div>
            </div>
        </#list>
    </#if>
</#macro>

<#macro relatedBlogPosts>
    <#assign relatedTags = tags?filter(tag -> tag.name == content.related_tag)>
    <#if relatedTags?size &gt; 0>
        <#assign relatedTag = relatedTags?first>
        <h2>Related blog posts</h2>
        <ul>
            <#list relatedTag.tagged_posts as blog>
                <li style="margin-bottom: 10px;">
                    <div class="title">
                        <a href="${content.rootpath}${blog.uri}">${blog.title}</a>
                    </div>
                    <div class="small">${blog.date?string("EEE d MMMM yyyy")}</div>
                    <@userBadgeInline userId=blog.author/>
                </li>
            </#list>
        </ul>
    </#if>
</#macro>

<#macro downloadJumbotron>
    <div>
        <div>
            <a class="btn btn-lg btn-success w-100" href="${content.rootpath}download/download.html">
                <img alt="Download" src="${content.rootpath}download/download.png">
                <div>
                    <span>Try Drools</span><br/>
                    <span class="small">Download ${pom.latestFinal.version}</span>
                </div>
            </a>
        </div>
        <div class="card-body">
            <ol>
                <li>Download the zip and unzip it.</li>
                <li>
                    Run <code>examples/runExamples.sh</code> (Linux/macOS).<br/>
                    Or run <code>examples/runExamples.bat</code> (Windows).
                </li>
            </ol>
            <div class="text-center small">
                Requires <a href="https://adoptopenjdk.net">Java™</a> to run.
            </div>
        </div>
    </div>
</#macro>

<#macro documentationJumbotron>
    <div class="card border-0">
        <div class="card-body">
            <a class="btn btn-lg btn-light w-100"
               href="${pom.latestFinal.documentationHtmlSingle}#quickStart">
                <img alt="Documentation" src="${content.rootpath}learn/documentation.png">
                <div>
                    <span>Get started</span><br/>
                    <span class="small">User guide ${pom.latestFinal.version}</span>
                </div>
            </a>
        </div>
    </div>
    <div class="card border-0">
        <h3 class="card-title">Are you using <a href="https://www.docker.com/">Docker</a>?</h3>
        <div class="card-body">
            <span>Try our Docker images and run Drools in just seconds</span>
            <ul class="list-unstyled">
                <li>
                    <a href="https://quay.io/repository/kiegroup/business-central-workbench/">Business
                        Central Workbench</a>
                </li>
                <li>
                    <a href="https://quay.io/repository/kiegroup/business-central-workbench-showcase/">Business
                        Central Workbench Showcase</a>
                </li>
                <li>
                    <a href="https://quay.io/repository/kiegroup/kie-server/">KIE Execution Server</a>
                </li>
                <li>
                    <a href="https://quay.io/repository/kiegroup/kie-server-showcase/">KIE Execution
                        Server
                        Showcase</a>
                </li>
            </ul>
            <div class="small">
                More info at
                <a href="http://blog.athico.com/2015/06/drools-jbpm-get-dockerized.html">this post</a>
            </div>
        </div>
    </div>
</#macro>

<#macro whatIsOptaPlanner>
    <h2>What is OptaPlanner?</h2>
    <p>
        OptaPlanner is <b>an AI constraint solver</b>.
        It optimizes planning and scheduling problems, such as
        <a href="${content.rootpath}learn/useCases/vehicleRoutingProblem.html">the Vehicle Routing Problem</a>,
        <a href="${content.rootpath}learn/useCases/employeeRostering.html">Employee Rostering</a>,
        <a href="${content.rootpath}learn/useCases/maintenanceScheduling.html">Maintenance Scheduling</a>,
        <a href="${content.rootpath}learn/useCases/taskAssignmentOptimization.html">Task Assignment</a>,
        <a href="${content.rootpath}learn/useCases/schoolTimetabling.html">School Timetabling</a>,
        <a href="${content.rootpath}learn/useCases/cloudOptimization.html">Cloud Optimization</a>,
        <a href="${content.rootpath}learn/useCases/conferenceScheduling.html">Conference Scheduling</a>,
        Job Shop Scheduling, Bin Packing and
        <a href="${content.rootpath}learn/useCases/">many more</a>.
        Every organization faces such challenges:
        assign a limited set of <i>constrained</i> resources (employees, assets, time and/or money)
        to provide products or services.
        OptaPlanner delivers more efficient plans, which reduce costs and improve service quality.
    </p>
    <p>
        OptaPlanner is <b>a lightweight, embeddable planning solver</b>.
        It enables everyday <a href="${content.rootpath}compatibility/java.html">Java</a> programmers
        to solve optimization problems efficiently.
        It is also compatible with other JVM languages (such as
        <a href="${content.rootpath}compatibility/kotlin.html">Kotlin</a>
        and <a href="${content.rootpath}compatibility/scala.html">Scala</a>).
        Constraints apply on plain domain objects and can call existing code.
        There's no need to input constraints as mathematical equations.
        Under the hood, OptaPlanner combines sophisticated Artificial Intelligence optimization algorithms
        (such as Tabu Search, Simulated Annealing, Late Acceptance and other metaheuristics)
        with very efficient score calculation and other state-of-the-art constraint solving techniques.
    </p>
    <p>
        OptaPlanner is <b>open source software</b>, released under <a href="${content.rootpath}code/license.html">the
            Apache License</a>.
        It is written in 100% pure Java™, runs on any JVM and is available in
        <a href="${content.rootpath}download/download.html">the Maven Central repository</a> too.
        It works with <a href="${content.rootpath}compatibility/quarkus.html">Quarkus</a>
        and <a href="${content.rootpath}compatibility/springBoot.html">Spring Boot</a>.
    </p>
</#macro>

<#macro productToProjectVersionMapping>
    <div class="card border-0">
        <div class="card-heading">Note for Red Hat customers</div>
        <div class="card-body">
            <p>
                The BRMS and BPM Suite version does <strong>NOT</strong> match the Drools version:
            </p>
            <table class="tableblock frame-all grid-all spread">
                <colgroup>
                    <col style="width: 50%;">
                    <col style="width: 50%;">
                </colgroup>
                <thead>
                <tr>
                    <th>BRMS / BPM Suite version</th>
                    <th>Drools version</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>6.0</td>
                    <td>6.0</td>
                </tr>
                <tr>
                    <td>6.1</td>
                    <td>6.2</td>
                </tr>
                <tr>
                    <td>6.2</td>
                    <td>6.3</td>
                </tr>
                <tr>
                    <td>6.3</td>
                    <td>6.4</td>
                </tr>
                <tr>
                    <td>6.4</td>
                    <td>6.5</td>
                </tr>
                </tbody>
            </table>
            <p>
                Apply the recipe of the apprepriate Drools version.
            </p>
        </div>
    </div>
</#macro>

<#macro flags>
    <div style="text-align: right; padding-right: 10px; margin-bottom: 20px;">
        <a href="${content.rootpath}index.html" style="text-decoration: none;"><img
                    src="${content.rootpath}website/flags/us.png"><img src="${content.rootpath}website/flags/gb.png">
        </a>
        -
        <a href="${content.rootpath}localized/fr/index.html" style="text-decoration: none;">
            <img src="${content.rootpath}website/flags/fr.png">
        </a>
        -
        <a href="${content.rootpath}localized/de/index.html" style="text-decoration: none;">
            <img src="${content.rootpath}website/flags/de.png">
        </a>
        -
        <a href="${content.rootpath}localized/zh/index.html" style="text-decoration: none;">
            <img src="${content.rootpath}website/flags/cn.png">
        </a>
        -
        <a href="${content.rootpath}localized/ja/index.html" style="text-decoration: none;">
            <img src="${content.rootpath}website/flags/jp.png">
        </a>
    </div>
</#macro>

<#macro videoCard youtubeId long=true>
    <#assign video = videos?filter(v -> v.youtubeId == youtubeId)?first >
    <div class="card" style="cursor: pointer">
        <#if long>
            <img class="card-img-top ratio ratio-16x9" src="https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg" alt="Video thumbnail">
            <div class="card-img-overlay">
                <div class="text-center mt-5"><i class="fas fa-play-circle fa-3x text-white bg-dark bg-opacity-25 rounded-pill p-1"></i></div>
            </div>
            <div class="card-body p-2">
                <#-- As a stretched-link for the hover over effect -->
                <a class="stretched-link" data-bs-toggle="modal" data-bs-target="#videoModal" data-youtube-id="${video.youtubeId}" data-video-title="${video.title}">${video.title}</a>
                <br/>
                <#if video.author??>
                    <@userBadgeInline userId=video.author/>
                </#if>
                <span class="float-end align-bottom small">${video.date?string("d MMM yyyy")}</span>
            </div>
        <#else>
            <a data-bs-toggle="modal" data-bs-target="#videoModal" data-youtube-id="${video.youtubeId}" data-video-title="${video.title}">
                <img class="card-img-top ratio ratio-16x9" src="https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg" alt="Video thumbnail">
                <div class="card-img-overlay d-flex justify-content-center align-items-center">
                    <i class="fas fa-play-circle fa-3x text-white bg-dark bg-opacity-25 rounded-pill p-1"></i>
                </div>
            </a>
        </#if>
    </div>
</#macro>
