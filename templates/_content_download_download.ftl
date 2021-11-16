<#-- Move into content after https://github.com/jbake-org/jbake/issues/693 -->
<#import "normalBase.ftl" as parent>
<#import "macros.ftl" as macros>

<@layout>${content.body}</@layout>

<#macro layout>
    <@parent.layout>
        <#assign pom = data.get('pom.yml')>
        <div class="sect1">
            <h2 id="_latest_final_version_pom_latestfinal_version">Latest final version: ${pom.latestFinal.version}</h2>
            <div class="sectionbody">
                <div class="ulist">
                    <ul>
                        <li>
                            <p>Release date: <code>${pom.latestFinal.releaseDate?date}</code></p>
                        </li>
                        <li>
                            <p><a href="${pom.latestFinal.droolsWhatsNew}">New and Noteworthy in
                                drools ${pom.latestFinal.version}</a></p>
                        </li>
                        <li>
                            <p><a href="${pom.latestFinal.droolsReleaseNotes}">Release Notes</a></p>
                        </li>
                        <li>
                            <p>License: <a href="../code/license.html">Apache License 2.0</a></p>
                        </li>
                    </ul>
                </div>
                <table class="tableblock frame-ends grid-all stretch">
                    <colgroup>
                        <col style="width: 21.4285%;">
                        <col style="width: 50%;">
                        <col style="width: 28.5715%;">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="tableblock halign-left valign-top">Name</th>
                        <th class="tableblock halign-left valign-top">Description</th>
                        <th class="tableblock halign-left valign-top">Download</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools
                                    Engine</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock">${pom.droolsDescription}</p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.droolsZip}">Distribution ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools and jBPM
                                    integration</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.droolsjbpmIntegrationDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.droolsjbpmIntegrationZip}">Distribution ZIP</a></p>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Business Central
                                    Workbench</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.businessCentralDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.businessCentralWildFlyWAR}">WildFly 23 WAR</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>KIE Execution
                                    Server</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.kieExecutionServerDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.kieExecutionServerZip}">Distribution ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>KIE Server
                                    WARS</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.kieWarsDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.kieWARS}">ee7, ee8, webc WAR</a></p></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="sect1">
            <h2 id="_latest_6_x_version_pom_latest6_version">Latest 6.x version: ${pom.latest6.version}</h2>
            <div class="sectionbody">
                <div class="ulist">
                    <ul>
                        <li>
                            <p>Release date: <code>${pom.latest6.releaseDateV6?date}</code></p>
                        </li>
                        <li>
                            <p><a href="${pom.latest6.droolsReleaseNotes}">Release Notes</a></p>
                        </li>
                        <li>
                            <p>License: <a href="../code/license.html">Apache License 2.0</a></p>
                        </li>
                    </ul>
                </div>
                <table class="tableblock frame-ends grid-all stretch">
                    <colgroup>
                        <col style="width: 21.4285%;">
                        <col style="width: 50%;">
                        <col style="width: 28.5715%;">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="tableblock halign-left valign-top">Name</th>
                        <th class="tableblock halign-left valign-top">Description</th>
                        <th class="tableblock halign-left valign-top">Download</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools
                                    Engine</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock">${pom.droolsDescription}</p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest6.droolsZip}">Distribution ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools and jBPM
                                    integration</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.droolsjbpmIntegrationDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest6.droolsjbpmIntegrationZip}">Distribution ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools
                                    Workbench</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.latest6.droolsWorkbench6Description}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest6.droolsWorkbenchEAP6WAR}">EAP 6_4 WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchEAP7WAR}">EAP 7 WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchWildFlyWAR}">WildFly 10
                                WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchTomcatWAR}">Tomcat 7 WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchWASWAR}">WebSphereAS 8
                                WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchWeblogicWAR}">Weblogic 12
                                WAR</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchJcr2vfsZip}">Guvnor 5.x
                                migration tool ZIP</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchCLIConfigZip}">KIE Config
                                CLI ZIP</a></p>
                            <p class="tableblock"> <a href="${pom.latest6.droolsWorkbenchExampleGitReposZip}">Example
                                GIT Repositories ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools and jBPM
                                    tools</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.droolsjbpmToolsDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest6.droolsjbpmToolsZip}">Distribution ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>KIE Execution
                                    Server</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p
                                    class="tableblock">${pom.kieExecutionServerDescription}</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest6.kieExecutionServerZip}">Distribution ZIP</a></p></td>
                    </tr>
                    </tbody>
                </table>
                <div class="sect2">
                    <h3 id="_other_downloads">Other downloads:</h3>
                    <div class="ulist">
                        <ul>
                            <li>
                                <p>Older community releases can be found in <a
                                            href="https://download.jboss.org/drools/release/">the release archive</a>.
                                </p>
                            </li>
                            <li>
                                <p>Red Hat customers can download the product platforms <a
                                            href="http://www.jboss.com/downloads/">from the product downloads site</a>.
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sect2">
                    <h3 id="_docker_images"><a href="http://www.docker.com/">Docker</a> images</h3>
                    <div class="ulist">
                        <ul>
                            <li>
                                <p>You can find the Docker images and how to use them for last final version at</p>
                                <div class="ulist">
                                    <ul>
                                        <li>
                                            <p>
                                                <a href="https://quay.io/repository/kiegroup/business-central-workbench/">Business
                                                    Central Workbench</a></p>
                                        </li>
                                        <li>
                                            <p>
                                                <a href="https://quay.io/repository/kiegroup/business-central-workbench-showcase/">Business
                                                    Central Workbench Showcase</a></p>
                                        </li>
                                        <li>
                                            <p><a href="https://quay.io/repository/kiegroup/kie-server/">KIE
                                                    Execution Server</a></p>
                                        </li>
                                        <li>
                                            <p><a href="https://quay.io/repository/kiegroup/kie-server-showcase/">KIE
                                                    Execution Server Showcase</a></p>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="paragraph">
                        <p>For more info about the Drools Docker images see this <a
                                    href="http://blog.athico.com/2015/06/drools-jbpm-get-dockerized.html">blog post</a>.
                        </p>
                    </div>
                </div>
                <div class="sect2">
                    <h3 id="_maven_repository">Maven Repository</h3>
                    <div class="ulist">
                        <ul>
                            <li>
                                <p>The latest releases, including ${pom.latestFinal.version} are available in the <a
                                            href="http://search.maven.org/#search|ga|1|org.drools">Maven Central
                                        Repository</a>.</p>
                            </li>
                            <li>
                                <p>The latest SNAPSHOTS deployed to Nexus are available <a
                                            href="https://repository.jboss.org/nexus/content/repositories/snapshots/org/drools/">here</a>
                                </p>
                                <div class="ulist">
                                    <ul>
                                        <li>
                                            <p>To use them, first <a
                                                        href="https://community.jboss.org/wiki/MavenGettingStarted-Users">configure
                                                    the JBoss Maven repository</a>.</p>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sect2">
                    <h3 id="_nightly_builds">Nightly Builds</h3>
                    <div class="ulist">
                        <ul>
                            <li>
                                <p>Selected nightly SNAPSHOTS are available for download <a
                                            href="snapshots.html">here</a>.</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sect2">
                    <h3 id="_eclipse_update_site">Eclipse update site</h3>
                    <div class="paragraph">
                        <p>We stopped to release Eclipse tools synchronously with Drools, thus the recent version of
                            Drools and of latest released Eclipse tools (updatesite) may differ.</p>
                    </div>
                    <div class="ulist">
                        <ul>
                            <li>
                                <p>
                                    <a href="https://download.jboss.org/drools/release/7.46.0.Final/org.drools.updatesite/">Click
                                        here</a> to go to the Drools and jBPM update site (latest released version
                                    <strong>7.46.0.Final</strong>).</p>
                            </li>
                            <li>
                                <p>The Drools and jBPM plugin for Eclipse can also be discovered from <a
                                            href="https://www.jboss.org/tools">JBoss Tools</a>.</p>
                            </li>
                            <li>
                                <p>Alternatively, you can download the latest released version of <a
                                    href="https://download.jboss.org/drools/release/7.46.0.Final/droolsjbpm-tools-distribution-7.46.0.Final.zip">Drools and jBPM tools zip</a>
                                    (<strong>7.46.0.Final</strong>), unzip it and configure the directory
                                    "binaries/org.drools.updatesite" as a local updatesite.</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </@parent.layout>
</#macro>