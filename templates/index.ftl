<#import "base.ftl" as parent>
<#import "macros.ftl" as macros>
<#assign pom = data.get('pom.yml')>

<@layout></@layout>

<#macro layout>
    <@parent.layout
    title="Constraint satisfaction solver (Java™, Open Source)"
    description="OptaPlanner optimizes business resource usage. It is a lightweight, embeddable, open source planning engine, written in 100% Java."
    uri=""
    googleWebmasterToolsVerification=true>
        <div class="alert alert-info alert-dismissible" role="alert" id="release-version-alert">
            <i class="fas fa-info-circle"></i>
            <!-- 2021-08-05: -->
            <!-- %a.alert-link(href="https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12313021&version=12359307")Drools 7.58.0.Final has been released. -->
            2021-08-05:
            <a class="alert-link"
            href="${pom.latest.droolsReleaseNotes}">Drools ${pom.latestFinal.version} has been released.</a>
            <button class="btn-close" data-bs-dismiss="alert" type="button" aria-label="Close"></button>
        </div>
        <div class="row">
            <div class="col-md-8" style="margin-top: -17px;margin-bottom: 20px">
                <p>
                    Drools is a Business Rules Management System (BRMS) solution. It provides a core Business Rules
                    Engine (BRE), a web authoring and rules management application (Drools Workbench), full runtime
                    support for <a href="learn/dmn.html">Decision Model and Notation (DMN)</a> models at Conformance
                    level 3 and an Eclipse IDE plugin for core development.
                </p>
                <p>
                    Drools is open source software, released under the Apache License 2.0. It is written in 100% pure
                    Java™, runs on any JVM and is available in the Maven Central repository too.
                </p>
                <div class="carousel slide carousel-dark" data-bs-ride="carousel" id="whatIsCarouselButtons">
                    <div class="carousel-indicators">
                        <button type="button" aria-label="DMN" data-bs-slide-to="0" data-bs-target="#whatIsCarouselButtons"
                                class="active"></button>
                        <button type="button" aria-label="Data Modeller" data-bs-slide-to="1" data-bs-target="#whatIsCarouselButtons"></button>
                        <button type="button" aria-label="Conditions" data-bs-slide-to="2" data-bs-target="#whatIsCarouselButtons"></button>
                        <button type="button" aria-label="Actions" data-bs-slide-to="3" data-bs-target="#whatIsCarouselButtons"></button>
                        <button type="button" aria-label="Rules" data-bs-slide-to="4" data-bs-target="#whatIsCarouselButtons"></button>
                        <button type="button" aria-label="Visualization" data-bs-slide-to="5" data-bs-target="#whatIsCarouselButtons"></button>
                    </div>
                    <div class="carousel-inner">
                            <div class="carousel-item active">
                                <a href="learn/dmn.html">
                                    <img alt="DMN" src="landingPage/DMN.png" width="800" height="600">
                                </a>
                            </div>
                            <div class="carousel-item">
                                <img alt="Data Modeller" src="landingPage/Data_Modeller.png" width="800"
                                     height="600">
                            </div>
                            <div class="carousel-item">
                                <img alt="Conditions" src="landingPage/Conditions.png" width="800" height="600">
                            </div>
                            <div class="carousel-item">
                                <img alt="Actions" src="landingPage/Actions.png" width="800" height="600">
                            </div>
                            <div class="carousel-item">
                                <img alt="Rules" src="landingPage/Rules.png" width="800" height="600">
                            </div>
                            <div class="carousel-item">
                                <img alt="Visualization" src="landingPage/Visualization.png" width="800"
                                     height="600">
                            </div>
                        </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#whatIsCarouselButtons" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#whatIsCarouselButtons" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <p>More information can be found on the following links:</p>
                <ul class="list-unstyled">
                    <li>
                        <img src="headerFooter/guvnor_icon_32x.png">
                        Drools Workbench (web UI for authoring and management)
                    </li>
                    <li>
                        <img src="headerFooter/expert_icon_32x.png">
                        Drools Expert (business rules engine)
                    </li>
                    <li>
                        <img src="headerFooter/fusion_icon_32x.png">
                        Drools Fusion (complex event processing features)
                    </li>
                    <li>
                        <img src="headerFooter/flow_icon_32x.png">
                        <a href="https://www.jbpm.org">jBPM (process/workflow integration for rule
                            orchestration/flow)</a>
                    </li>
                    <li>
                        <img src="headerFooter/planner_icon_32px.png">
                        <a href="https://www.optaplanner.org/">OptaPlanner (automated planning)</a>
                    </li>
                </ul>
                <p>
                    These projects have community releases from JBoss.org that come without support. Community releases
                    focus on fast paced innovation to give you the latest and greatest, with releases every few months that
                    include both features and fixes. Red Hat JBoss BRMS is our enterprise product for mission critical
                    releases, with a multi year commitment for backport of fixes, based off a sanitised community release of
                    Drools. A range of support packages are available including up to mission critical 24/7, as well as
                    training and consultancy via our Global Professional Services unit.
                    Check
                    <a href="https://www.redhat.com/en/technologies/jboss-middleware/process-automation-manager">Red Hat
                        Process Automation Manager</a>
                    for more details.
                </p>
                <div class="row">
                    <div class="col-md-8">
                        <h2 id="special-thanks-to">Special thanks to:</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="padding: 10px; margin-top: 20px">
                        <div class="text-center"><a href="http://www.oxygenxml.com"><img src="headerFooter/oxygen.png"></a>
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 10px; margin-top: 20px">
                        <div class="text-center"><a
                                    href="http://www.ej-technologies.com/products/jprofiler/overview.html"><img
                                        src="headerFooter/jprofiler-logo.png"></a></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <@macros.downloadJumbotron/>
                <@macros.documentationJumbotron/>
                <@macros.latestEvents/>
            </div>
        </div>
    </@parent.layout>
</#macro>
