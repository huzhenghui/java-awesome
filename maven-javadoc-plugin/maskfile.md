# `maven-javadoc-plugin`

仓库位置

    https://github.com/huzhenghui/java-awesome/tree/master/maven-javadoc-plugin

运行工具

    Mask

运行文档

    https://github.com/huzhenghui/java-awesome/blob/master/maven-javadoc-plugin/maskfile.md

环境变量

    https://github.com/huzhenghui/java-awesome/blob/master/maven-javadoc-plugin/.envrc

```bash
export LOCATION_NAME=use-maven-javadoc-plugin
```

# 步骤

## 1-spring-init

> 1.创建空白项目

```bash
spring init --java-version 1.8 --dependencies=web "${LOCATION_NAME}"
```

## 2.修改 `.gitignore`

https://github.com/huzhenghui/java-awesome/blob/master/maven-javadoc-plugin/use-maven-javadoc-plugin/.gitignore#L35-L40

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
cd ./"${LOCATION_NAME}"
mvn spring-boot:run
```

## 4-open

> 4.访问首页

```bash
open http://localhost:8080/
```

## 5.设置 `Maven` 编译器版本

https://github.com/huzhenghui/java-awesome/commit/747a508f929798967bf52940406173ff5429bfdf#diff-7ac6a4523c03b81273d5bdeeaf90ce122851b3d6cfae8e35d25c41296f24721dR18

```xml
		<maven.compiler.release>8</maven.compiler.release>
```

## 6.添加 `maven-site-plugin`

Available Plugins

    http://maven.apache.org/plugins/index.html

Apache Maven Site Plugin

    http://maven.apache.org/plugins/maven-site-plugin/

https://github.com/huzhenghui/java-awesome/commit/747a508f929798967bf52940406173ff5429bfdf#diff-7ac6a4523c03b81273d5bdeeaf90ce122851b3d6cfae8e35d25c41296f24721dR40-R44

```xml
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-site-plugin</artifactId>
				<version>3.9.1</version>
			</plugin>
```

## 7.添加 `maven-javadoc-plugin`

Available Plugins

    http://maven.apache.org/plugins/index.html

Apache Maven Javadoc Plugin

    https://maven.apache.org/plugins/maven-javadoc-plugin/

```xml
	<reporting>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-javadoc-plugin</artifactId>
				<version>3.2.0</version>
				<configuration>
					<show>private</show>
				</configuration>
			</plugin>
		</plugins>
	</reporting>
```

## 8-mvn-help-effective-pom-reporting-plugins

> 8.有效 POM 中的 reporting 插件列表

```bash
cd ./"${LOCATION_NAME}"
tempfile="$(/usr/bin/mktemp)"
mvn --quiet help:effective-pom -Doutput="${tempfile}"
xidel --silent --data="${tempfile}" --extract '/project/reporting/plugins/plugin/concat(if (groupId/text()) then (groupId/text()) else "org.apache.maven.plugins", ":", artifactId/text(), ":", version/text())'
```

### output

```plain
org.apache.maven.plugins:maven-javadoc-plugin:3.2.0
```

## 9-mvn-help-describe-maven-javadoc-plugin

> 9.maven-javadoc-plugin 描述

```bash
mask 8-mvn-help-effective-pom-reporting-plugins |
  grep 'maven-javadoc-plugin' |
  while read plugin
  do
    echo "Plugin : " "${plugin}"
    cd ./"${LOCATION_NAME}"
    mvn help:describe -Ddetail=false -Dplugin="${plugin}"
    cd ..
  done
```

### output

```plain
org.apache.maven.plugins:maven-javadoc-plugin:3.2.0

Name: Apache Maven Javadoc Plugin
Description: The Apache Maven Javadoc Plugin is a plugin that uses the
  javadoc tool for generating javadocs for the specified project.
Group Id: org.apache.maven.plugins
Artifact Id: maven-javadoc-plugin
Version: 3.2.0
Goal Prefix: javadoc

This plugin has 17 goals:

javadoc:aggregate
  Description: Generates documentation for the Java code in an aggregator
    project using the standard Javadoc Tool.

    Since version 3.1.0 an aggregated report is created for every module of a
    Maven multimodule project.
  Note: This goal should be used as a Maven report.

javadoc:aggregate-jar
  Description: Bundles the Javadoc documentation for main Java code in an
    aggregator project into a jar using the standard Javadoc Tool.

    Since version 3.1.0 an aggregated jar is created for every module of a
    Maven multimodule project.

javadoc:aggregate-no-fork
  Description: Generates documentation for the Java code in an aggregator
    project using the standard Javadoc Tool.
  Note: This goal should be used as a Maven report.

javadoc:fix
  Description: Fix Javadoc documentation and tags for the Java code for the
    project. See Where Tags Can Be Used.

javadoc:help
  Description: Display help information on maven-javadoc-plugin.
    Call mvn javadoc:help -Ddetail=true -Dgoal=<goal-name> to display parameter
    details.

javadoc:jar
  Description: Bundles the Javadoc documentation for main Java code in an NON
    aggregator project into a jar using the standard Javadoc Tool.

javadoc:javadoc
  Description: Generates documentation for the Java code in an NON aggregator
    project using the standard Javadoc Tool.
  Note: This goal should be used as a Maven report.

javadoc:javadoc-no-fork
  Description: Generates documentation for the Java code in an NON aggregator
    project using the standard Javadoc Tool. Note that this goal does require
    generation of sources before site generation, e.g. by invoking mvn clean
    deploy site.
  Note: This goal should be used as a Maven report.

javadoc:resource-bundle
  Description: Bundle AbstractJavadocMojo.javadocDirectory, along with
    javadoc configuration options such as taglet, doclet, and link information
    into a deployable artifact. This artifact can then be consumed by the
    javadoc plugin mojos when used by the includeDependencySources option, to
    generate javadocs that are somewhat consistent with those generated in the
    original project itself.

javadoc:test-aggregate
  Description: Generates documentation for the Java Test code in an
    aggregator project using the standard Javadoc Tool.

    Since version 3.1.0 an aggregated report is created for every module of a
    Maven multimodule project.
  Note: This goal should be used as a Maven report.

javadoc:test-aggregate-jar
  Description: Bundles the Javadoc documentation for Java Test code in an
    aggregator project into a jar using the standard Javadoc Tool.

    Since version 3.1.0 an aggregated jar is created for every module of a
    Maven multimodule project.

javadoc:test-aggregate-no-fork
  Description: Generates documentation for the Java Test code in an
    aggregator project using the standard Javadoc Tool.
  Note: This goal should be used as a Maven report.

javadoc:test-fix
  Description: Fix Javadoc documentation and tags for the Test Java code for
    the project. See Where Tags Can Be Used.

javadoc:test-jar
  Description: Bundles the Javadoc documentation for test Java code in an NON
    aggregator project into a jar using the standard Javadoc Tool.

javadoc:test-javadoc
  Description: Generates documentation for the Java Test code in an NON
    aggregator project using the standard Javadoc Tool.
  Note: This goal should be used as a Maven report.

javadoc:test-javadoc-no-fork
  Description: Generates documentation for the Java Test code in an NON
    aggregator project using the standard Javadoc Tool. Note that this goal
    does require generation of test sources before site generation, e.g. by
    invoking mvn clean deploy site.
  Note: This goal should be used as a Maven report.

javadoc:test-resource-bundle
  Description: Bundle TestJavadocJar.testJavadocDirectory, along with javadoc
    configuration options from AbstractJavadocMojo such as taglet, doclet, and
    link information into a deployable artifact. This artifact can then be
    consumed by the javadoc plugin mojos when used by the
    includeDependencySources option, to generate javadocs that are somewhat
    consistent with those generated in the original project itself.

For more information, run 'mvn help:describe [...] -Ddetail'
```

## mvn-site-run

> 启动站点

```bash
cd ./"${LOCATION_NAME}"
mvn site:run
```

## mvn-site-site

> 为单个项目生成站点

```bash
cd ./"${LOCATION_NAME}"
mvn site:site
```

## open-site

> 打开生成的站点

```bash
open ./"${LOCATION_NAME}"/target/site/index.html
```

## open-project-reports

> 打开生成的站点

```bash
open ./"${LOCATION_NAME}"/target/site/project-reports.html
```
