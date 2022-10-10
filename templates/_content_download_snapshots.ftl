<#-- Move into content after https://github.com/jbake-org/jbake/issues/693 -->
<#import "normalBase.ftl" as parent>
<#import "macros.ftl" as macros>

<@layout>${content.body}</@layout>

<#macro layout>
    <@parent.layout>
        <#assign pom = data.get('pom.yml')>
        <div class="sect1">
                <h1>Selected nightly Snapshots</h1>
                <div class="paragraph summaryParagraph">
                    <p>On this page you can download selected binaries of nightly builds.</p>
                </div>
                <table class="tableblock frame-all grid-all stretch">
                    <colgroup>
                        <col style="width: 50%;">
                        <col style="width: 50%;">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock">Name</p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock">Download</p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Drools distribution</strong></p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latestFinal.droolsSnapZip}">Drools-distribution
                            ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>7.x stream:</strong></p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"> </p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Jbpm distribution (7.x stream)</strong></p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.jbpmSnapZip}">Jbpm-distribution-bin
                            ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Business Central WAR (7.x stream)</strong>
                        </p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.businessCentralSnapWF}">Wildfly
                            19 WAR</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>kie server ee7 (7.x stream)</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.kieserverSnapEe7}">ee7
                            WAR</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>kie server ee8 (7.x stream)</strong></p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.kieserverSnapEe8}">ee8
                            WAR</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>kie server webc (7.x stream)</strong></p>
                        </td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.kieserverSnapWebc}">webc
                            WAR</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>kie server distribution (7.x stream)</strong>
                        </p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.kieserverSnapDistZip}">Distribution
                            ZIP</a></p></td>
                    </tr>
                    <tr>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><strong>kie tomcat integration (7.x stream)</strong>
                        </p></td>
                        <td class="tableblock halign-left valign-top"><p class="tableblock"><a
                                href="${pom.latest7Final.tomcatIntergrationSnap}">Tomcat
                            integration JAR</a></p></td>
                    </tr>
                    </tbody>
                </table>
        </div>
    </@parent.layout>
</#macro>