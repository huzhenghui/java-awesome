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

```xml
		<maven.compiler.release>8</maven.compiler.release>
```

## 6.添加 `maven-site-plugin`

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
