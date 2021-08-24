<style>
    :root {
        --secondary-color: #adadad;
        --cta-primary-color: white;
        --cta-secondary-color: black;
        --cta-primary-background-color: #f78e00;
        --cta-secondary-background-color: #96d4e9;
        --primary-nav-color: #f8f8f8;
    }

    header.header nav.navigation,
    header.header nav.navigation a {
        font-size: 12pt;
    }

    header.header nav.navigation h1,
    header.header nav.navigation h1 a {
        font-size: 18pt;
    }

    .navigation--primary,
    footer nav .row {
        padding: 0;
    }

    /* Wrapper ends */ /* NAV Starts */
    header {
        background-color: var(--primary-nav-color);
        box-shadow: 0 1px 5px 5px var(--secondary-color);
    }

    .navigation {
        grid-template-columns: 0 2fr auto 0;
        display: grid;
    }

    .navigation a.navigation-item--active {
        text-decoration: underline;
    }

    .navigation h1 {
        display: inline-block;
        margin: 0 -0.5rem 0 0;
        color: #475058;
        font-weight: 800;
        font-family: "Overpass", sans-serif;
        letter-spacing: -0.1rem;
    }

    .navigation a,
    .navigation button,
    .navigation .logo {
        display: inline-block;
    }

    .navigation a,
    .navigation button {
        font-weight: 800;
        color: #475058;
        text-transform: uppercase;
        text-decoration: none;
        padding: 0.2rem .54rem;
    }

    .navigation ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: grid;
    }

    .navigation ul li {
        padding: 0;
        margin: 0 0.5rem;
    }

    .navigation--primary > ul {
        grid-auto-flow: column;
    }

    .navigation--primary > ul > li {
        margin: 0 0.5rem;
    }

    .navigation--primary-right .dropdown--title:after {
        position: relative;
        top: .75rem;
    }

    .navigation--primary > ul > li > a,
    .navigation--primary > ul > li .dropdown--title {
        padding: 1rem 0.5rem
    }

    .navigation .logo {
        width: 60px;
        height: 60px;
        background-size: cover;
        box-shadow: 0 0 0 7px #f8f8f8;
        border-radius: 100%;
        border-bottom: 2px solid #ddd;
        vertical-align: bottom;
        justify-self: right;
        top: 1rem;
        z-index: 2;
    }

    .logo.optaplanner {
        background-image: url("../../static/images/optaplanner_icon.svg");
    }
    .logo.kie {
        background-image: url("../../static/images/kie_logo.png");
    }
    .logo.kogito {
        background-image: url("../../static/images/kogito_icon.svg");
    }
    .logo.jbpm {
        background-image: url("../../static/images/jbpm_icon.svg");
    }
    .navigation .responsive-menu-button {

    }

    .navigation--logo {
        align-self: center;
        display: inline;
    }

    .navigation--primary {
        align-self: center;
        display: inline-block;
    }

    .navigation--primary-right {
        grid-column: 3;
        display: flex;
        align-items: flex-end;
        justify-content: center;
        flex-direction: column;
    }

    .navigation--primary-right-top {
        align-self: center;
    }

    .navigation--primary-right-bottom {
        align-self: center;
        border-top: black solid thin;
    }

    .navigation--primary-left {
        grid-column-start: 2;
    }

    .navigation--secondary, .navigation--secondary-spacer {
        background-color: lightgray;
        border-top: 3px solid var(--secondary-color);
        align-items: center;
    }

    .navigation--secondary-spacer {
        grid-column: 1/3;
    }

    .navigation--secondary {
        grid-column: start/end;
    }

    .navigation--secondary a {
        text-decoration: none;
        padding: 0 1rem;
        font-weight: unset;
        color: unset;
        text-transform: unset;
        line-height: unset;
        height: unset;
        display: inline;
    }

    .navigation-item--active {
        text-decoration: underline;
    }

    /* NAV Ends */ /* Responsive Menu Starts */
    @media screen and (min-width: 576px) {
        .navigation h1 {
            border: none;
        }
    }

    @media screen and (min-width: 992px) {
        .navigation {
            grid-template-columns: 2% 2fr auto 2%;
        }

        .responsive-menu-button {
            visibility: hidden;
            opacity: 0.3;
            display: none !important;
        }

        .dropdown {
            position: relative;
        }

        .dropdown:hover .dropdown--menu,
        .dropdown:focus-within .dropdown--menu {
            opacity: 1;
            transform: rotateX(0) translateX(-50%);
            visibility: visible;
        }

        .dropdown--menu {
            background-color: var(--primary-nav-color);
            border-radius: 4px;
            box-shadow: 0 0.15em 0.25em rgba(0, 0, 0, 0.25);
            padding: 0.5em 0;
            min-width: 15ch;
            position: absolute;
            top: calc(100% - 0.25rem);
            left: 35%;
            z-index: 100;
            transform: rotateX(-90deg) translateX(-50%);
            transform-origin: top center;
            opacity: 0.3;
            transition: 280ms all 120ms ease-out;
            visibility: hidden;
        }

        .dropdown .dropdown--menu a {
            display: block;
            padding: 0.5em;
        }

        .dropdown--title {
            background-color: transparent;
            border: none;
            font-weight: 800;
            color: #475058;
            text-transform: uppercase;
            display: inline-flex;
            align-items: center;
        }

        .dropdown--title:after {
            content: "";
            border: 0.5rem solid transparent;
            margin-left: 0.25em;
            transform: translateY(0.15em);
            border-top-color: rgba(71, 80, 88, 0.45)
        }
    }

    @media screen and (min-width: 1200px) {
        .navigation h1 {
            border-right: 1px solid #dedede;
        }
    }

    @media screen and (max-width: 990px) {
        .navigation--primary, .navigation--primary-right {
            visibility: hidden;
            transform: rotateX(-90deg) translateX(-50%);
            opacity: 0.3;
            display: none;
        }

        .responsive-menu-button {
            visibility: visible;
            opacity: 1;
            position: absolute;
            right: 0;
            border: none;
        }
    }

    .navigation--responsive {
        width: 300px;
        height: 100vh;
        background: rgba(255, 255, 255, 0.9);
        position: fixed;
        z-index: 100;
        top: 0;
        right: -320px;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
        border-left: 2px solid #5f5f5f;
        transition: right 0.5s;
        transform: rotate3d(0, 0, 0, 0deg);
        padding: 10px 20px 0;
    }

    .navigation--responsive .close-button {
        display: block;
        text-align: right;
        right: 0;
        position: relative;
        text-decoration: none;
    }

    .navigation--responsive .close-button + h4 {
        margin-top: 10px;
        outline: none;
    }

    .navigation--responsive ul {
        list-style: none;
        margin: 0;
        padding: 0;
        color: #475058;
    }

    .navigation--responsive ul ul {
        padding-left: 2.5rem;
    }

    .navigation--responsive ul li {
        margin: 0;
        padding: 5px 0;
    }

    .navigation--responsive h4,
    .navigation--responsive li a {
        color: #475058;
        font-family: "Overpass", sans-serif;
    }

    .navigation--responsive li a {
        font-size: 16px;
        font-weight: 700;
    }

    .navigation--responsive h4 {
        font-size: 1.8rem;
        font-weight: 800;
        border-bottom: 1px solid #d1d7dc;
        padding-bottom: 15px;
        margin: 20px 0 7px;
        text-transform: uppercase;
    }

    .responsive-menu-opened {
        overflow: hidden;
    }

    .responsive-menu-opened #overlay {
        opacity: 1;
    }

    .responsive-menu-opened .navigation--responsive {
        right: 0;
        overflow-y: scroll;
    }
</style>
<header class="header">
    <nav class="navigation container" aria-label="Main Navigation">
        <div class="navigation--primary-left">
            <div class="navigation--logo">
                <div class="logo ${(content.active_menu!config.active_menu!"kie")}" aria-label="logo"></div>
                <h1><a href="/"
                       <#if ((content.active_menu!config.active_menu!"kie") == "kie")>class="navigation-item--active"</#if>
                       aria-label="Home">${(content.active_menu!config.active_menu!"kie")}</a></h1>
            </div>
            <div class="navigation--primary">
                <#include (((content.active_menu)!config.active_menu!"kie") + "-submenu.ftl")>
            </div>
        </div>
        <div class="navigation--primary-right">
            <ul>
                <li class="dropdown">
                    <button type="button" class="dropdown--title" aria-expanded="false" aria-controls="kie-dropdown">
                        KIE
                    </button>
                    <ul class="dropdown--menu" id="kie-dropdown">
                        <li><a aria-label="KIE Home" href="https://kie.org">KIE Home</a></li>
                        <li><a aria-label="Blog" href="https://blog.kie.org">Blog</a></li>
                        <li><a aria-label="Kogito" href="https://kogito.kie.org/">Kogito</a></li>
                        <li><a aria-label="Drools" href="https://drools.org/">Drools</a></li>
                        <li><a aria-label="jBPM" href="https://jbpm.org/">jBPM</a></li>
                        <li><a aria-label="Optaplanner" href="https://www.optaplanner.org/">OptaPlanner</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="navigation--secondary">
            <#-- Secondary nav depending on what is being viewed will go here -->
        </div>
        <button type="button" class="responsive-menu-button open-button" aria-expanded="false">&#9776;</button>
    </nav>
</header>
<div class="navigation--responsive">
    <ul>
        <li>
            <a href="#" class="responsive-menu-button close-button">✕</a>
            <#include (((content.active_menu)!config.active_menu!"kie") + "-submenu.ftl")>
            <h4>
                KIE websites
            </h4>
            <ul>
                <li><a aria-label="KIE Home" href="https://kie.org">KIE Home</a></li>
                <li><a aria-label="Blog" href="https://blog.kie.org">Blog</a></li>
                <li><a aria-label="Kogito" href="https://kogito.kie.org/">Kogito</a></li>
                <li><a aria-label="Drools" href="https://drools.org/">Drools</a></li>
                <li><a aria-label="jBPM" href="https://jbpm.org/">jBPM</a></li>
                <li><a aria-label="Optaplanner" href="https://www.optaplanner.org/">OptaPlanner</a></li>
            </ul>
        </li>
    </ul>
</div>
