# `maven-site-plugin`

仓库位置

运行工具

    Mask

运行文档

# 步骤

## 1-spring-init

> 1.创建空白项目

```bash
spring init --dependencies=web use-maven-site-plugin
```

## 2.修改 `.gitignore`

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
