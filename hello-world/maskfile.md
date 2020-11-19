# Spring Boot Hello World

仓库位置

    https://github.com/huzhenghui/java-awesome/tree/master/hello-world

运行工具

    Mask

运行文档

    https://github.com/huzhenghui/java-awesome/blob/master/hello-world/maskfile.md

# 步骤

## 1-spring-init

> 1.创建空白项目

```bash
spring init --dependencies=web hello-world
```

## 2.修改 `.gitignore`

https://github.com/huzhenghui/java-awesome/blob/master/hello-world/hello-world/.gitignore#L35-L40


## 3-mvn-spring-boot-run

> 3.运行

```bash
cd ./hello-world
mvn spring-boot:run
```

## 4-open

> 4.访问首页

```bash
open http://localhost:8080/
```

## 5.添加hello world代码

https://github.com/huzhenghui/java-awesome/blob/b95f920a210b85ebb0d48b9a7a5514634990cce7/hello-world/hello-world/src/main/java/com/example/helloworld/DemoApplication.java

修改范围

    https://github.com/huzhenghui/java-awesome/commit/b95f920a210b85ebb0d48b9a7a5514634990cce7#diff-1ed9f48ba09329166cc685ef748fe7f24c761c4e968aad8582ca693f0c4e41e5

## 6-mvn-spring-boot-run

> 6.运行

```bash
cd ./hello-world
mvn spring-boot:run
```

## 7-open

> 7.访问hello world

```bash
open http://localhost:8080/hello/world
```

