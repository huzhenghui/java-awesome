# Maven Aliyun

仓库位置

    https://github.com/huzhenghui/java-awesome/tree/master/maven-aliyun

运行工具

    Mask

运行文档

    https://github.com/huzhenghui/java-awesome/blob/master/maven-aliyun/maskfile.md

# 步骤

## 1-spring-init

> 1.创建空白项目

```bash
spring init --dependencies=web maven-aliyun
```

## 2.修改 `.gitignore`

https://github.com/huzhenghui/java-awesome/blob/master/maven-aliyun/maven-aliyun/.gitignore#L35-L40

### diff

```plain
### https://github.com/huzhenghui/java-awesome/ ###
.mvn/wrapper/maven-wrapper.jar
.mvn/wrapper/maven-wrapper.properties
.mvn/wrapper/MavenWrapperDownloader.java
mvnw
mvnw.cmd
```

## 3.添加阿里云仓库

https://maven.aliyun.com/mvn/guide

### pom.xml

https://github.com/huzhenghui/java-awesome/commit/156ba87ecea11adf9793f3228149d44c9447046c#diff-34696784bf09af3bab94e837c0652263252c4f659621e4cf0bd09b064adf693f

```xml
	<repositories>
		<repository>
			<id>central</id>
			<url>https://maven.aliyun.com/repository/central</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>jcenter</id>
			<url>https://maven.aliyun.com/repository/public</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>public</id>
			<url>https://maven.aliyun.com/repository/public</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>google</id>
			<url>https://maven.aliyun.com/repository/google</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>gradle-plugin</id>
			<url>https://maven.aliyun.com/repository/gradle-plugin</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>spring</id>
			<url>https://maven.aliyun.com/repository/spring</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>spring-plugin</id>
			<url>https://maven.aliyun.com/repository/spring-plugin</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>grails-core</id>
			<url>https://maven.aliyun.com/repository/grails-core</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>apache snapshots</id>
			<url>https://maven.aliyun.com/repository/apache-snapshots</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
	</repositories>
```

## 4-mvn-spring-boot-run

> 4.运行

```bash
cd ./maven-aliyun
mvn spring-boot:run
```

## 5-open

> 5.访问首页

```bash
open http://localhost:8080/
```

## maven-version

```bash
mvn --version
```

### output

```plain
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /usr/local/Cellar/maven/3.6.3_1/libexec
Java version: 15.0.1, vendor: N/A, runtime: /usr/local/Cellar/openjdk/15.0.1/libexec/openjdk.jdk/Contents/Home
Default locale: zh_CN_#Hans, platform encoding: UTF-8
OS name: "mac os x", version: "11.0.1", arch: "x86_64", family: "mac"
```

## code-maven-settings

```bash
code /usr/local/opt/maven/libexec/conf/settings.xml
```

### mirror

```xml
    <mirror>
      <id>central-aliyun</id>
      <mirrorOf>central</mirrorOf>
      <name>central-aliyun</name>
      <url>https://maven.aliyun.com/repository/central</url>
    </mirror>
```

## trash-maven-repository

```bash
trash ~/.m2/repository/
```
