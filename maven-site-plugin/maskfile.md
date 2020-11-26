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

```xml
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-site-plugin</artifactId>
				<version>3.9.1</version>
			</plugin>
```

## 6-mvn-help-effective-pom-plugins

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
