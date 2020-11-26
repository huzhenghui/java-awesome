# `maven-site-plugin`

仓库位置

    https://github.com/huzhenghui/java-awesome/tree/master/maven-site-plugin

运行工具

    Mask

运行文档

    https://github.com/huzhenghui/java-awesome/blob/master/maven-site-plugin/maskfile.md

# 步骤

## 1-spring-init

> 1.创建空白项目

```bash
spring init --dependencies=web use-maven-site-plugin
```

## 2.修改 `.gitignore`

https://github.com/huzhenghui/java-awesome/blob/master/maven-site-plugin/use-maven-site-plugin/.gitignore#L35-L40

### `diff`

```plain
### https://github.com/huzhenghui/java-awesome/ ###
.mvn/wrapper/maven-wrapper.jar
.mvn/wrapper/maven-wrapper.properties
.mvn/wrapper/MavenWrapperDownloader.java
mvnw
mvnw.cmd
```

## 3-mvn-spring-boot-run

> 3.运行

```bash
cd ./use-maven-site-plugin
mvn spring-boot:run
```

## 4-open

> 4.访问首页

```bash
open http://localhost:8080/
```

## 5.添加 `maven-site-plugin`

Available Plugins

    http://maven.apache.org/plugins/index.html

Apache Maven Site Plugin

    http://maven.apache.org/plugins/maven-site-plugin/

https://github.com/huzhenghui/java-awesome/commit/b78af729b135ece3adcb5860a2d8583350bbecbd#diff-01a3f56f65951f6170efc4a3e87a4c80144290d48cdc40a35238a550b05e1767R39-R43

```xml
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-site-plugin</artifactId>
				<version>3.9.1</version>
			</plugin>
```

## 6-mvn-help-effective-pom-plugins

> 6.有效 POM 中的插件列表

```bash
cd ./use-maven-site-plugin
tempfile="$(/usr/bin/mktemp)"
mvn --quiet help:effective-pom -Doutput="${tempfile}"
xidel --silent --data="${tempfile}" --extract '/project/build/plugins/plugin/concat(if (groupId/text()) then (groupId/text()) else "org.apache.maven.plugins", ":", artifactId/text(), ":", version/text())'
```

### output

```plain
org.springframework.boot:spring-boot-maven-plugin:2.4.0
org.apache.maven.plugins:maven-site-plugin:3.9.1
org.apache.maven.plugins:maven-clean-plugin:3.1.0
org.apache.maven.plugins:maven-resources-plugin:3.2.0
org.apache.maven.plugins:maven-jar-plugin:3.2.0
org.apache.maven.plugins:maven-compiler-plugin:3.8.1
org.apache.maven.plugins:maven-surefire-plugin:2.22.2
org.apache.maven.plugins:maven-install-plugin:2.5.2
org.apache.maven.plugins:maven-deploy-plugin:2.8.2
```

## 7-mvn-help-describe-maven-site-plugin

> 7.maven-site-plugin 描述

```bash
mask 6-mvn-help-effective-pom-plugins |
  grep 'maven-site-plugin' |
  while read plugin
  do
    echo "Plugin : " "${plugin}"
    cd ./use-maven-site-plugin
    mvn help:describe -Ddetail=false -Dplugin="${plugin}"
    cd ..
  done
```

### output

```plain
org.apache.maven.plugins:maven-site-plugin:3.9.1

Name: Apache Maven Site Plugin
Description: The Maven Site Plugin is a plugin that generates a site for the
  current project.
Group Id: org.apache.maven.plugins
Artifact Id: maven-site-plugin
Version: 3.9.1
Goal Prefix: site

This plugin has 9 goals:

site:attach-descriptor
  Description: Adds the site descriptor (site.xml) to the list of files to be
    installed/deployed.
    For Maven-2.x this is enabled by default only when the project has pom
    packaging since it will be used by modules inheriting, but this can be
    enabled for other projects packaging if needed.

    This default execution has been removed from the built-in lifecycle of
    Maven 3.x for pom-projects. Users that actually use those projects to
    provide a common site descriptor for sub modules will need to explicitly
    define this goal execution to restore the intended behavior.

site:deploy
  Description: Deploys the generated site using wagon supported protocols to
    the site URL specified in the <distributionManagement> section of the POM.
    For scp protocol, the website files are packaged by wagon into zip archive,
    then the archive is transfered to the remote host, next it is un-archived
    which is much faster than making a file by file copy.

site:effective-site
  Description: Displays the effective site descriptor as an XML for this
    build, after inheritance and interpolation of site.xml, for the first
    locale.

site:help
  Description: Display help information on maven-site-plugin.
    Call mvn site:help -Ddetail=true -Dgoal=<goal-name> to display parameter
    details.

site:jar
  Description: Bundles the site output into a JAR so that it can be deployed
    to a repository.

site:run
  Description: Starts the site up, rendering documents as requested for
    faster editing. It uses Jetty as the web server.

site:site
  Description: Generates the site for a single project.
    Note that links between module sites in a multi module build will not work,
    since local build directory structure doesn't match deployed site.

site:stage
  Description: Deploys the generated site to a local staging or mock
    directory based on the site URL specified in the <distributionManagement>
    section of the POM.
    It can be used to test that links between module sites in a multi-module
    build work.

    This goal requires the site to already have been generated using the site
    goal, such as by calling mvn site.

site:stage-deploy
  Description: Deploys the generated site to a staging or mock URL to the
    site URL specified in the <distributionManagement> section of the POM,
    using wagon supported protocols

For more information, run 'mvn help:describe [...] -Ddetail'
```

## mvn-site-help

> maven-site-plugin 帮助

```bash
cd ./use-maven-site-plugin
mvn site:help
```

### `mvn site:help -Ddetail=true -Dgoal=help`

```plain
Apache Maven Site Plugin 3.9.1
  The Maven Site Plugin is a plugin that generates a site for the current
  project.

site:help
  Display help information on maven-site-plugin.
  Call mvn site:help -Ddetail=true -Dgoal=<goal-name> to display parameter
  details.

  Available parameters:

    detail (Default: false)
      If true, display all settable properties for each goal.
      User property: detail

    goal
      The name of the goal for which to show help. If unspecified, all goals
      will be displayed.
      User property: goal

    indentSize (Default: 2)
      The number of spaces per indentation level, should be positive.
      User property: indentSize

    lineLength (Default: 80)
      The maximum length of a display line, should be positive.
      User property: lineLength
```

### `mvn help:describe -Ddetail=true -Dcmd=site:help`

```plain
'site:help' is a plugin goal (aka mojo).
Mojo: 'site:help'
site:help
  Description: Display help information on maven-site-plugin.
    Call mvn site:help -Ddetail=true -Dgoal=<goal-name> to display parameter
    details.
  Implementation: org.apache.maven.plugins.site.deploy.HelpMojo
  Language: java

  Available parameters:

    detail (Default: false)
      User property: detail
      If true, display all settable properties for each goal.

    goal
      User property: goal
      The name of the goal for which to show help. If unspecified, all goals
      will be displayed.

    indentSize (Default: 2)
      User property: indentSize
      The number of spaces per indentation level, should be positive.

    lineLength (Default: 80)
      User property: lineLength
      The maximum length of a display line, should be positive.
```

## mvn-site-effective-site

> 有效站点信息

```bash
cd ./use-maven-site-plugin
mvn site:effective-site
```

### `mvn site:help -Ddetail=true -Dgoal=effective-site`

```plain
Apache Maven Site Plugin 3.9.1
  The Maven Site Plugin is a plugin that generates a site for the current
  project.

site:effective-site
  Displays the effective site descriptor as an XML for this build, after
  inheritance and interpolation of site.xml, for the first locale.

  Available parameters:

    locales (Default: en)
      A comma separated list of locales to render. The first valid token will be
      the default Locale for this site.
      User property: locales

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output

    relativizeDecorationLinks (Default: true)
      Make links in the site descriptor relative to the project URL. By default,
      any absolute links that appear in the site descriptor, e.g. banner hrefs,
      breadcrumbs, menu links, etc., will be made relative to project.url. Links
      will not be changed if this is set to false, or if the project has no URL
      defined.
      User property: relativizeDecorationLinks

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      Set this to 'true' to skip site generation and staging.
      User property: maven.site.skip
```

### `mvn help:describe -Ddetail=true -Dcmd=site:effective-site`

```plain
'site:effective-site' is a plugin goal (aka mojo).
Mojo: 'site:effective-site'
site:effective-site
  Description: Displays the effective site descriptor as an XML for this
    build, after inheritance and interpolation of site.xml, for the first
    locale.
  Implementation: org.apache.maven.plugins.site.descriptor.EffectiveSiteMojo
  Language: java

  Available parameters:

    locales (Default: en)
      User property: locales
      A comma separated list of locales to render. The first valid token will
      be the default Locale for this site.

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.

    relativizeDecorationLinks (Default: true)
      User property: relativizeDecorationLinks
      Make links in the site descriptor relative to the project URL. By
      default, any absolute links that appear in the site descriptor, e.g.
      banner hrefs, breadcrumbs, menu links, etc., will be made relative to
      project.url. Links will not be changed if this is set to false, or if the
      project has no URL defined.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      User property: maven.site.skip
      Set this to 'true' to skip site generation and staging.
```

### output

```xml
Effective site descriptor, after inheritance and interpolation:

<!-- ====================================================================== -->
<!--                                                                        -->
<!-- Generated by Maven Site Plugin on 2020-11-25T20:40:32                  -->
<!-- See: http://maven.apache.org/plugins/maven-site-plugin/                -->
<!--                                                                        -->
<!-- ====================================================================== -->

<!-- ====================================================================== -->
<!--                                                                        -->
<!-- Effective site descriptor for project                                  -->
<!-- 'com.example:use-maven-site-plugin:jar:0.0.1-SNAPSHOT'                 -->
<!--                                                                        -->
<!-- ====================================================================== -->

<project xsi:schemaLocation="http://maven.apache.org/DECORATION/1.8.0 http://maven.apache.org/xsd/decoration-1.8.0.xsd" name="demo" xmlns="http://maven.apache.org/DECORATION/1.8.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <bannerLeft>
    <name>demo</name>
  </bannerLeft>
  <publishDate />
  <version />
  <body>
    <links>
      <item name="demo" href="./" />
    </links>
    <menu ref="parent" />
    <menu ref="reports" />
  </body>
</project>
```

## mvn-site-jar

> 站点输出为 JAR

```bash
cd ./use-maven-site-plugin
mvn site:jar
```

### `mvn site:help -Ddetail=true -Dgoal=jar`

```plain
Apache Maven Site Plugin 3.9.1
  The Maven Site Plugin is a plugin that generates a site for the current
  project.

site:jar
  Bundles the site output into a JAR so that it can be deployed to a repository.

  Available parameters:

    archive
      The archive configuration to use. See Maven Archiver Reference.

    archiveExcludes
      List of files to exclude. Specified as file set patterns which are
      relative to the input directory whose contents is being packaged into the
      JAR.

    archiveIncludes
      List of files to include. Specified as file set patterns which are
      relative to the input directory whose contents is being packaged into the
      JAR.

    attach (Default: true)
      Specifies whether to attach the generated artifact to the project.
      User property: site.attach

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    finalName
      Specifies the filename that will be used for the generated jar file.
      Please note that '-site' will be appended to the file name.
      Required: Yes
      User property: project.build.finalName

    generatedSiteDirectory (Default: ${project.build.directory}/generated-site)
      Directory containing generated documentation in source format (Doxia
      supported markup). This is used to pick up other source docs that might
      have been generated at build time (by reports or any other build time
      mean). This directory is expected to have the same structure as
      siteDirectory (ie. one directory per Doxia-source-supported markup types).
      todo should we deprecate in favour of reports directly using Doxia Sink
      API, without this Doxia source intermediate step?

    generateProjectInfo (Default: true)
      Whether to generate the summary page for project reports:
      project-info.html.
      User property: generateProjectInfo

    generateReports (Default: true)
      Convenience parameter that allows you to disable report generation.
      User property: generateReports

    generateSitemap (Default: false)
      Generate a sitemap. The result will be a 'sitemap.html' file at the site
      root.
      User property: generateSitemap

    inputEncoding (Default: ${project.build.sourceEncoding})
      Specifies the input encoding.
      User property: encoding

    jarOutputDirectory
      Specifies the directory where the generated jar file will be put.
      Required: Yes
      User property: project.build.directory

    locales (Default: en)
      A comma separated list of locales to render. The first valid token will be
      the default Locale for this site.
      User property: locales

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputDirectory (Default: ${project.reporting.outputDirectory})
      Directory where the project sites and report distributions will be
      generated (as html/css/...).
      User property: siteOutputDirectory

    outputEncoding (Default: ${project.reporting.outputEncoding})
      Specifies the output encoding.
      User property: outputEncoding

    outputTimestamp (Default: ${project.build.outputTimestamp})
      Timestamp for reproducible output archive entries, either formatted as ISO
      8601 yyyy-MM-dd'T'HH:mm:ssXXX or as an int representing seconds since the
      epoch (like SOURCE_DATE_EPOCH).

    relativizeDecorationLinks (Default: true)
      Make links in the site descriptor relative to the project URL. By default,
      any absolute links that appear in the site descriptor, e.g. banner hrefs,
      breadcrumbs, menu links, etc., will be made relative to project.url. Links
      will not be changed if this is set to false, or if the project has no URL
      defined.
      User property: relativizeDecorationLinks

    saveProcessedContent
      Whether to save Velocity processed Doxia content (*.<ext>.vm) to
      ${generatedSiteDirectory}/processed.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      Set this to 'true' to skip site generation and staging.
      User property: maven.site.skip

    templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.
      User property: templateFile

    validate (Default: false)
      Whether to validate xml input documents. If set to true, all input
      documents in xml format (in particular xdoc and fml) will be validated and
      any error will lead to a build failure.
      User property: validate

    xdocDirectory (Default: ${basedir}/xdocs)
      Deprecated. use the standard m2 directory layout

      Alternative directory for xdoc source, useful for m1 to m2 migration
```

### `mvn help:describe -Ddetail=true -Dcmd=site:jar`

```plain
'site:jar' is a plugin goal (aka mojo).
Mojo: 'site:jar'
site:jar
  Description: Bundles the site output into a JAR so that it can be deployed
    to a repository.
  Implementation: org.apache.maven.plugins.site.render.SiteJarMojo
  Language: java
  Bound to phase: package

  Available parameters:

    archive
      The archive configuration to use. See Maven Archiver Reference.

    archiveExcludes
      List of files to exclude. Specified as file set patterns which are
      relative to the input directory whose contents is being packaged into the
      JAR.

    archiveIncludes
      List of files to include. Specified as file set patterns which are
      relative to the input directory whose contents is being packaged into the
      JAR.

    attach (Default: true)
      User property: site.attach
      Specifies whether to attach the generated artifact to the project.

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    finalName
      Required: true
      User property: project.build.finalName
      Specifies the filename that will be used for the generated jar file.
      Please note that '-site' will be appended to the file name.

    generatedSiteDirectory (Default:
    ${project.build.directory}/generated-site)
      Alias: workingDirectory
      Directory containing generated documentation in source format (Doxia
      supported markup). This is used to pick up other source docs that might
      have been generated at build time (by reports or any other build time
      mean). This directory is expected to have the same structure as
      siteDirectory (ie. one directory per Doxia-source-supported markup
      types). todo should we deprecate in favour of reports directly using
      Doxia Sink API, without this Doxia source intermediate step?

    generateProjectInfo (Default: true)
      User property: generateProjectInfo
      Whether to generate the summary page for project reports:
      project-info.html.

    generateReports (Default: true)
      User property: generateReports
      Convenience parameter that allows you to disable report generation.

    generateSitemap (Default: false)
      User property: generateSitemap
      Generate a sitemap. The result will be a 'sitemap.html' file at the site
      root.

    inputEncoding (Default: ${project.build.sourceEncoding})
      User property: encoding
      Specifies the input encoding.

    jarOutputDirectory
      Required: true
      User property: project.build.directory
      Specifies the directory where the generated jar file will be put.

    locales (Default: en)
      User property: locales
      A comma separated list of locales to render. The first valid token will
      be the default Locale for this site.

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputDirectory (Default:
    ${project.reporting.outputDirectory})
      User property: siteOutputDirectory
      Directory where the project sites and report distributions will be
      generated (as html/css/...).

    outputEncoding (Default: ${project.reporting.outputEncoding})
      User property: outputEncoding
      Specifies the output encoding.

    outputTimestamp (Default: ${project.build.outputTimestamp})
      Timestamp for reproducible output archive entries, either formatted as
      ISO 8601 yyyy-MM-dd'T'HH:mm:ssXXX or as an int representing seconds since
      the epoch (like SOURCE_DATE_EPOCH).

    relativizeDecorationLinks (Default: true)
      User property: relativizeDecorationLinks
      Make links in the site descriptor relative to the project URL. By
      default, any absolute links that appear in the site descriptor, e.g.
      banner hrefs, breadcrumbs, menu links, etc., will be made relative to
      project.url. Links will not be changed if this is set to false, or if the
      project has no URL defined.

    saveProcessedContent
      Whether to save Velocity processed Doxia content (*.<ext>.vm) to
      ${generatedSiteDirectory}/processed.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      User property: maven.site.skip
      Set this to 'true' to skip site generation and staging.

    templateFile
      User property: templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.

    validate (Default: false)
      User property: validate
      Whether to validate xml input documents. If set to true, all input
      documents in xml format (in particular xdoc and fml) will be validated
      and any error will lead to a build failure.

    xdocDirectory (Default: ${basedir}/xdocs)
      Alternative directory for xdoc source, useful for m1 to m2 migration
      Deprecated. use the standard m2 directory layout
```

## mvn-site-run

> 启动站点

```bash
cd ./use-maven-site-plugin
mvn site:run
```

### `mvn site:help -Ddetail=true -Dgoal=run`

```plain
Apache Maven Site Plugin 3.9.1
  The Maven Site Plugin is a plugin that generates a site for the current
  project.

site:run
  Starts the site up, rendering documents as requested for faster editing. It
  uses Jetty as the web server.

  Available parameters:

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    generatedSiteDirectory (Default: ${project.build.directory}/generated-site)
      Directory containing generated documentation in source format (Doxia
      supported markup). This is used to pick up other source docs that might
      have been generated at build time (by reports or any other build time
      mean). This directory is expected to have the same structure as
      siteDirectory (ie. one directory per Doxia-source-supported markup types).
      todo should we deprecate in favour of reports directly using Doxia Sink
      API, without this Doxia source intermediate step?

    generateProjectInfo (Default: true)
      Whether to generate the summary page for project reports:
      project-info.html.
      User property: generateProjectInfo

    inputEncoding (Default: ${project.build.sourceEncoding})
      Specifies the input encoding.
      User property: encoding

    locales (Default: en)
      A comma separated list of locales to render. The first valid token will be
      the default Locale for this site.
      User property: locales

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputEncoding (Default: ${project.reporting.outputEncoding})
      Specifies the output encoding.
      User property: outputEncoding

    port (Default: 8080)
      The port to execute the HTTP server on.
      User property: port

    relativizeDecorationLinks (Default: true)
      Make links in the site descriptor relative to the project URL. By default,
      any absolute links that appear in the site descriptor, e.g. banner hrefs,
      breadcrumbs, menu links, etc., will be made relative to project.url. Links
      will not be changed if this is set to false, or if the project has no URL
      defined.
      User property: relativizeDecorationLinks

    saveProcessedContent
      Whether to save Velocity processed Doxia content (*.<ext>.vm) to
      ${generatedSiteDirectory}/processed.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      Set this to 'true' to skip site generation and staging.
      User property: maven.site.skip

    templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.
      User property: templateFile

    tempWebappDirectory (Default: ${project.build.directory}/site-webapp)
      Where to create the dummy web application.

    xdocDirectory (Default: ${basedir}/xdocs)
      Deprecated. use the standard m2 directory layout

      Alternative directory for xdoc source, useful for m1 to m2 migration
```

### `mvn help:describe -Ddetail=true -Dcmd=site:run`

```plain
'site:run' is a plugin goal (aka mojo).
Mojo: 'site:run'
site:run
  Description: Starts the site up, rendering documents as requested for
    faster editing. It uses Jetty as the web server.
  Implementation: org.apache.maven.plugins.site.run.SiteRunMojo
  Language: java

  Available parameters:

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    generatedSiteDirectory (Default:
    ${project.build.directory}/generated-site)
      Alias: workingDirectory
      Directory containing generated documentation in source format (Doxia
      supported markup). This is used to pick up other source docs that might
      have been generated at build time (by reports or any other build time
      mean). This directory is expected to have the same structure as
      siteDirectory (ie. one directory per Doxia-source-supported markup
      types). todo should we deprecate in favour of reports directly using
      Doxia Sink API, without this Doxia source intermediate step?

    generateProjectInfo (Default: true)
      User property: generateProjectInfo
      Whether to generate the summary page for project reports:
      project-info.html.

    inputEncoding (Default: ${project.build.sourceEncoding})
      User property: encoding
      Specifies the input encoding.

    locales (Default: en)
      User property: locales
      A comma separated list of locales to render. The first valid token will
      be the default Locale for this site.

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputEncoding (Default: ${project.reporting.outputEncoding})
      User property: outputEncoding
      Specifies the output encoding.

    port (Default: 8080)
      User property: port
      The port to execute the HTTP server on.

    relativizeDecorationLinks (Default: true)
      User property: relativizeDecorationLinks
      Make links in the site descriptor relative to the project URL. By
      default, any absolute links that appear in the site descriptor, e.g.
      banner hrefs, breadcrumbs, menu links, etc., will be made relative to
      project.url. Links will not be changed if this is set to false, or if the
      project has no URL defined.

    saveProcessedContent
      Whether to save Velocity processed Doxia content (*.<ext>.vm) to
      ${generatedSiteDirectory}/processed.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for hand written
      docs (one directory per Doxia-source-supported markup types): see Doxia
      Markup Languages References).

    skip (Default: false)
      User property: maven.site.skip
      Set this to 'true' to skip site generation and staging.

    templateFile
      User property: templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.

    tempWebappDirectory (Default:
    ${project.build.directory}/site-webapp)
      Where to create the dummy web application.

    xdocDirectory (Default: ${basedir}/xdocs)
      Alternative directory for xdoc source, useful for m1 to m2 migration
      Deprecated. use the standard m2 directory layout
```

## mvn-site-site

> 为单个项目生成站点

```bash
cd ./use-maven-site-plugin
mvn site:site
```

### `mvn site:help -Ddetail=true -Dgoal=site`

```plain
Maven Site Plugin 3 3.3
  The Maven Site Plugin is a plugin that generates a site for the current
  project.

site:site
  Generates the site for a single project.
  Note that links between module sites in a multi module build will not work,
  since local build directory structure doesn't match deployed site.

  Available parameters:

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    generatedSiteDirectory
      Directory containing generated documentation. This is used to pick up
      other source docs that might have been generated at build time.

    generateProjectInfo
      Whether to generate the summary page for project reports:
      project-info.html.

    generateReports
      Convenience parameter that allows you to disable report generation.

    generateSitemap
      Generate a sitemap. The result will be a 'sitemap.html' file at the site
      root.

    inputEncoding
      Specifies the input encoding.

    locales
      A comma separated list of locales supported by Maven. The first valid
      token will be the default Locale for this instance of the Java Virtual
      Machine.

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputDirectory
      Directory where the project sites and report distributions will be
      generated.

    outputEncoding
      Specifies the output encoding.

    relativizeDecorationLinks
      Make links in the site descriptor relative to the project URL. By default,
      any absolute links that appear in the site descriptor, e.g. banner hrefs,
      breadcrumbs, menu links, etc., will be made relative to project.url. Links
      will not be changed if this is set to false, or if the project has no URL
      defined.

    siteDirectory
      Directory containing the site.xml file and the source for apt, fml and
      xdoc docs.

    skip
      Set this to 'true' to skip site generation and staging.

    template
      Default template page.

    templateDirectory
      Directory containing the template page.

    templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.

    validate
      Whether to validate xml input documents. If set to true, all input
      documents in xml format (in particular xdoc and fml) will be validated and
      any error will lead to a build failure.

    xdocDirectory
      Alternative directory for xdoc source, useful for m1 to m2 migration
```

### `mvn help:describe -Ddetail=true -Dcmd=site:site`

```plain
'site:site' is a plugin goal (aka mojo).
Mojo: 'site:site'
site:site
  Description: Generates the site for a single project.
    Note that links between module sites in a multi module build will not work,
    since local build directory structure doesn't match deployed site.
  Implementation: org.apache.maven.plugins.site.SiteMojo
  Language: java

  Available parameters:

    attributes
      Additional template properties for rendering the site. See Doxia Site
      Renderer.

    generatedSiteDirectory (Default:
    ${project.build.directory}/generated-site)
      Alias: workingDirectory
      Directory containing generated documentation. This is used to pick up
      other source docs that might have been generated at build time.

    generateProjectInfo (Default: true)
      User property: generateProjectInfo
      Whether to generate the summary page for project reports:
      project-info.html.

    generateReports (Default: true)
      User property: generateReports
      Convenience parameter that allows you to disable report generation.

    generateSitemap (Default: false)
      User property: generateSitemap
      Generate a sitemap. The result will be a 'sitemap.html' file at the site
      root.

    inputEncoding (Default: ${project.build.sourceEncoding})
      User property: encoding
      Specifies the input encoding.

    locales
      User property: locales
      A comma separated list of locales supported by Maven. The first valid
      token will be the default Locale for this instance of the Java Virtual
      Machine.

    moduleExcludes
      Module type exclusion mappings ex: fml -> **/*-m1.fml (excludes fml files
      ending in '-m1.fml' recursively) The configuration looks like this:
       <moduleExcludes>
       <moduleType>filename1.ext,**/*sample.ext</moduleType>
       <!-- moduleType can be one of 'apt', 'fml' or 'xdoc'. -->
       <!-- The value is a comma separated list of -->
       <!-- filenames or fileset patterns. -->
       <!-- Here's an example: -->
       <xdoc>changes.xml,navigation.xml</xdoc>
       </moduleExcludes>

    outputDirectory (Default:
    ${project.reporting.outputDirectory})
      User property: siteOutputDirectory
      Directory where the project sites and report distributions will be
      generated.

    outputEncoding (Default: ${project.reporting.outputEncoding})
      User property: outputEncoding
      Specifies the output encoding.

    relativizeDecorationLinks (Default: true)
      User property: relativizeDecorationLinks
      Make links in the site descriptor relative to the project URL. By
      default, any absolute links that appear in the site descriptor, e.g.
      banner hrefs, breadcrumbs, menu links, etc., will be made relative to
      project.url. Links will not be changed if this is set to false, or if the
      project has no URL defined.

    siteDirectory (Default: ${basedir}/src/site)
      Directory containing the site.xml file and the source for apt, fml and
      xdoc docs.

    skip (Default: false)
      User property: maven.site.skip
      Set this to 'true' to skip site generation and staging.

    template
      User property: template
      Default template page.
      Deprecated. use templateFile or skinning instead

    templateDirectory (Default: src/site)
      User property: templateDirectory
      Directory containing the template page.
      Deprecated. use templateFile or skinning instead

    templateFile
      User property: templateFile
      The location of a Velocity template file to use. When used, skins and the
      default templates, CSS and images are disabled. It is highly recommended
      that you package this as a skin instead.

    validate (Default: false)
      User property: validate
      Whether to validate xml input documents. If set to true, all input
      documents in xml format (in particular xdoc and fml) will be validated
      and any error will lead to a build failure.

    xdocDirectory (Default: ${basedir}/xdocs)
      Alternative directory for xdoc source, useful for m1 to m2 migration
      Deprecated. use the standard m2 directory layout
```

## open-site

> 打开生成的站点

```bash
open ./use-maven-site-plugin/target/site/index.html
```
