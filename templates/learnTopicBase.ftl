<#import "base.ftl" as parent>
<#import "macros.ftl" as macros>

<@layout>${content.body}</@layout>

<#macro layout>
    <@parent.layout>
        <#nested>
        <div class="row">
            <@macros.relatedVideos/>
        </div>
    </@parent.layout>
</#macro>
