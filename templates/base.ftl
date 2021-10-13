<#assign pom = data.get('pom.yml')>
<#macro layout title="" description="" uri="" googleWebmasterToolsVerification=false>
<#assign _title = content.title!title/>
<#-- Description is mandatory because it is very important for SEO. -->
<#assign _description = content.description!
    ((content.type == "post")?then(content.body?replace("<[\\w/][^>]*>", "", "r")?replace("\\s+", " ", "r")?truncate(200, "...")?trim,
    ((description == "")?then(config.errorDescriptionIsMandatory, description))))/>
<#assign _uri = content.uri!uri/>
<!DOCTYPE html>
<html lang="${(content.lang)!"en"}">
<head>
    <#-- Adobe Analytics for Red Hat - DPAL (DTM Property Auto-Loader) - part 1/2 -->
    <script id="dpal" src="https://www.redhat.com/dtm.js" type="text/javascript"></script>
    <#-- Google Analytics for kie team: Global site tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=${config.googleAnalyticsId}"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', '${config.googleAnalyticsId}');
    </script>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>${config.title + " - " + _title}</title>
    <meta content="${_description}" name="description">
    <meta content="${config.keywords}" name="keywords">
    <link href="${(content.canonical_url)!config.canonicalBaseUrl + "/" + _uri}" rel="canonical">
    <#if googleWebmasterToolsVerification>
    <meta content="${config.googleWebmasterToolsVerificationId}" name="google-site-verification">
    </#if>

    <#-- Social media: make it look good when shared -->
    <meta content="${_title}" property="og:title">
    <meta content="${_description}" property="og:description">
    <meta content="${config.canonicalBaseUrl}/${_uri}" property="og:url">
    <meta content="Drools" property="og:site_name">
    <meta content="${(content.type == "post")?then("article", "website")}" property="og:type">
    <meta content="${config.canonicalBaseUrl + "/" + ((content.social_media_share_image??)?then(_uri?replace("/[^/]*$", "/", "r") + content.social_media_share_image, "headerFooter/optaPlannerIcon.png"))}" property="og:image">
    <meta content="summary" name="twitter:card">
    <meta content="@DroolsRules" name="twitter:site">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="${content.rootpath}website/highlight/highlight.css" rel="stylesheet">
    <link href="${content.rootpath}website/DroolsWebsite.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="${content.rootpath}favicon.ico" rel="shortcut icon">
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
    <#include "shared/menu.ftl">
    <div class="body-without-header-footer">
        <div class="container">
        <#nested>
        </div>
    </div>
    <div class="container pb-2 mt-4">
        <div class="row">
            <div class="col-md-12 text-center">
                <img src="/website/images/drools_icon.svg" style="width: 120px">
            </div>
        </div>
    </div>
    <footer class="bg-dark pt-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-3">
                    <h4 class="text-white">Community</h4>
                    <ul>
                        <li><a href="https://blog.kie.org">Blog</a></li>
                        <li><a href="${content.rootpath}community/getHelp.html">Get Help</a></li>
                        <li><a href="${content.rootpath}community/team.html">Team</a></li>
                        <li><a href="${content.rootpath}community/governance.html">Governance</a></li>
                        <li><a href="${content.rootpath}community/research.html">Academic research</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h4 class="text-white">Code</h4>
                    <ul>
                        <li><a href="${content.rootpath}code/sourceCode.html">Build from source</a></li>
                        <li><a href="${config.issueTracker}">Submit a bug</a></li>
                        <li><a href="${content.rootpath}code/license.html">License (Apache-2.0)</a></li>
                        <li><a href="${pom.latest.droolsReleaseNotes}">Release notes</a></li>
                        <li><a href="${content.rootpath}download/upgradeRecipe/">Upgrade recipes</a></li>
                    </ul>
                </div>
            </div>
            <div class="row text-white">
                <div class="col-md-12 text-center">
                    © Copyright 2006-${published_date?string("yyyy")}, Red Hat, Inc. or third-party contributors
                    -
                    <a href="https://www.redhat.com/en/about/terms-use" target="_blank">Terms of use</a>
                    -
                    <a href="${content.rootpath}website/websiteInfo.html">Website info</a>
                </div>
            </div>
        </div>
    </footer>
    <#include "shared/footer.ftl">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="${content.rootpath}website/highlight/highlight.js"></script>
    <script src="${content.rootpath}website/DroolsWebsite.js"></script>
    <script type="text/javascript">hljs.initHighlightingOnLoad();</script>
    <#-- GitHub star script -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <#-- Adobe Analytics for Red Hat - DPAL (DTM Property Auto-Loader) - part 2/2 -->
    <script type="text/javascript">
      if (("undefined" !== typeof _satellite) && ("function" === typeof _satellite.pageBottom)) {
        _satellite.pageBottom();
      }
    </script>
</body>
</html>
</#macro>
