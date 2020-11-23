# Tasks

## 1-spring-init

> 1.创建空白项目

```bash
spring init --java-version 1.8 --dependencies=web use-maven-help-plugin
```

## 2-mvn-spring-boot-run

> 2.运行

```bash
cd ./use-maven-help-plugin
mvn spring-boot:run
```

## 3-open

> 3.访问首页

```bash
open http://localhost:8080/
```

## mvn-help-help-help

```bash
cd ./use-maven-help-plugin
mvn help:help -Ddetail=true -Dgoal=help
```

### output

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

help:help
  Display help information on maven-help-plugin.
  Call mvn help:help -Ddetail=true -Dgoal=<goal-name> to display parameter
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

## mvn-help-help

```bash
cd ./use-maven-help-plugin
mvn help:help
```

### describe

```plain
'help:help' is a plugin goal (aka mojo).
Mojo: 'help:help'
help:help
  Description: Display help information on maven-help-plugin.
    Call mvn help:help -Ddetail=true -Dgoal=<goal-name> to display parameter
    details.
  Implementation: org.apache.maven.plugins.help.HelpMojo
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

### output

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

This plugin has 8 goals:

help:active-profiles
  Displays a list of the profiles which are currently active for this build.

help:all-profiles
  Displays a list of available profiles under the current project.
  Note: it will list all profiles for a project. If a profile comes up with a
  status inactive then there might be a need to set profile activation
  switches/property.

help:describe
  Displays a list of the attributes for a Maven Plugin and/or goals (aka Mojo -
  Maven plain Old Java Object).

help:effective-pom
  Displays the effective POM as an XML for this build, with the active profiles
  factored in, or a specified artifact. If verbose, a comment is added to each
  XML element describing the origin of the line.

help:effective-settings
  Displays the calculated settings as XML for this project, given any profile
  enhancement and the inheritance of the global settings into the user-level
  settings.

help:evaluate
  Evaluates Maven expressions given by the user in an interactive mode.

help:help
  Display help information on maven-help-plugin.
  Call mvn help:help -Ddetail=true -Dgoal=<goal-name> to display parameter
  details.

help:system
  Displays a list of the platform details like system properties and environment
  variables.
```

## mvn-help-active-profiles

```bash
cd ./use-maven-help-plugin
mvn help:active-profiles
```

### help

```plain
help:active-profiles
  Displays a list of the profiles which are currently active for this build.

  Available parameters:

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output
```

### describe

```plain
'help:active-profiles' is a plugin goal (aka mojo).
Mojo: 'help:active-profiles'
help:active-profiles
  Description: Displays a list of the profiles which are currently active for
    this build.
  Implementation: org.apache.maven.plugins.help.ActiveProfilesMojo
  Language: java

  Available parameters:

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
```

### output

```plain
Active Profiles for Project 'com.example:use-maven-help-plugin:jar:0.0.1-SNAPSHOT':

The following profiles are active:
```

## mvn-help-all-profiles

```bash
cd ./use-maven-help-plugin
mvn help:all-profiles
```

### help

```plain
help:all-profiles
  Displays a list of available profiles under the current project.
  Note: it will list all profiles for a project. If a profile comes up with a
  status inactive then there might be a need to set profile activation
  switches/property.

  Available parameters:

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output
```

### describe

```plain
'help:all-profiles' is a plugin goal (aka mojo).
Mojo: 'help:all-profiles'
help:all-profiles
  Description: Displays a list of available profiles under the current
    project.
    Note: it will list all profiles for a project. If a profile comes up with a
    status inactive then there might be a need to set profile activation
    switches/property.
  Implementation: org.apache.maven.plugins.help.AllProfilesMojo
  Language: java

  Available parameters:

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
```

### output

```plain
Listing Profiles for Project: com.example:use-maven-help-plugin:jar:0.0.1-SNAPSHOT
```

## mvn-help-describe

```bash
cd ./use-maven-help-plugin
mvn help:describe -Ddetail=true -Dcmd=help:describe
```

### help

```plain
help:describe
  Displays a list of the attributes for a Maven Plugin and/or goals (aka Mojo -
  Maven plain Old Java Object).

  Available parameters:

    artifactId
      The Maven Plugin artifactId to describe.
      Note: Should be used with groupId parameter.
      User property: artifactId

    cmd
      A Maven command like a single goal or a single phase following the Maven
      command line:
      mvn [options] [<goal(s)>] [<phase(s)>]
      User property: cmd

    detail (Default: false)
      This flag specifies that a detailed (verbose) list of goal (Mojo)
      information should be given.
      User property: detail

    goal
      The goal name of a Mojo to describe within the specified Maven Plugin. If
      this parameter is specified, only the corresponding goal (Mojo) will be
      described, rather than the whole Plugin.
      User property: goal

    groupId
      The Maven Plugin groupId to describe.
      Note: Should be used with artifactId parameter.
      User property: groupId

    minimal (Default: false)
      This flag specifies that a minimal list of goal (Mojo) information should
      be given.
      User property: minimal

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output

    plugin
      The Maven Plugin to describe. This must be specified in one of three ways:

      1.  plugin-prefix, i.e. 'help'
      2.  groupId:artifactId, i.e. 'org.apache.maven.plugins:maven-help-plugin'
      3.  groupId:artifactId:version, i.e.
        'org.apache.maven.plugins:maven-help-plugin:2.0'
      User property: plugin

    version
      The Maven Plugin version to describe.
      Note: Should be used with groupId/artifactId parameters.
      User property: version
```

### describe

```plain
'help:describe' is a plugin goal (aka mojo).
Mojo: 'help:describe'
help:describe
  Description: Displays a list of the attributes for a Maven Plugin and/or
    goals (aka Mojo - Maven plain Old Java Object).
  Implementation: org.apache.maven.plugins.help.DescribeMojo
  Language: java

  Available parameters:

    artifactId
      User property: artifactId
      The Maven Plugin artifactId to describe.
      Note: Should be used with groupId parameter.

    cmd
      User property: cmd
      A Maven command like a single goal or a single phase following the Maven
      command line:
      mvn [options] [<goal(s)>] [<phase(s)>]

    detail (Default: false)
      User property: detail
      This flag specifies that a detailed (verbose) list of goal (Mojo)
      information should be given.

    goal
      User property: goal
      The goal name of a Mojo to describe within the specified Maven Plugin. If
      this parameter is specified, only the corresponding goal (Mojo) will be
      described, rather than the whole Plugin.

    groupId
      User property: groupId
      The Maven Plugin groupId to describe.
      Note: Should be used with artifactId parameter.

    minimal (Default: false)
      User property: minimal
      This flag specifies that a minimal list of goal (Mojo) information should
      be given.

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.

    plugin
      Alias: prefix
      User property: plugin
      The Maven Plugin to describe. This must be specified in one of three
      ways:

      1.  plugin-prefix, i.e. 'help'
      2.  groupId:artifactId, i.e. 'org.apache.maven.plugins:maven-help-plugin'
      3.  groupId:artifactId:version, i.e.
        'org.apache.maven.plugins:maven-help-plugin:2.0'

    version
      User property: version
      The Maven Plugin version to describe.
      Note: Should be used with groupId/artifactId parameters.
```

## mvn-help-describe-plugins

```bash
mask mvn-help-effective-pom-plugins |
while read plugin
do
  echo "Plugin : " "${plugin}"
  cd ./use-maven-help-plugin
  mvn help:describe -Ddetail=false -Dplugin="${plugin}"
  cd ..
done
```

## mvn-help-effective-pom

```bash
cd ./use-maven-help-plugin
mvn help:effective-pom
```

### help

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

help:effective-pom
  Displays the effective POM as an XML for this build, with the active profiles
  factored in, or a specified artifact. If verbose, a comment is added to each
  XML element describing the origin of the line.

  Available parameters:

    artifact
      The artifact for which to display the effective POM.
      Note: Should respect the Maven format, i.e. groupId:artifactId[:version].
      The latest version of the artifact will be used when no version is
      specified.
      User property: artifact

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output

    verbose (Default: false)
      Output POM input location as comments.
      User property: verbose
```

### describe

```plain
'help:effective-pom' is a plugin goal (aka mojo).
Mojo: 'help:effective-pom'
help:effective-pom
  Description: Displays the effective POM as an XML for this build, with the
    active profiles factored in, or a specified artifact. If verbose, a comment
    is added to each XML element describing the origin of the line.
  Implementation: org.apache.maven.plugins.help.EffectivePomMojo
  Language: java

  Available parameters:

    artifact
      User property: artifact
      The artifact for which to display the effective POM.
      Note: Should respect the Maven format, i.e. groupId:artifactId[:version].
      The latest version of the artifact will be used when no version is
      specified.

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.

    verbose (Default: false)
      User property: verbose
      Output POM input location as comments.
```

## mvn-help-effective-pom-plugins

```bash
cd ./use-maven-help-plugin
tempfile="$(/usr/bin/mktemp)"
mvn --quiet help:effective-pom -Doutput="${tempfile}"
xidel --silent --data="${tempfile}" --extract '/project/build/plugins/plugin/concat(if (groupId/text()) then (groupId/text()) else "org.apache.maven.plugins", ":", artifactId/text(), ":", version/text())'
```

### output

```plain
org.springframework.boot:spring-boot-maven-plugin:2.4.0
org.apache.maven.plugins:maven-clean-plugin:3.1.0
org.apache.maven.plugins:maven-resources-plugin:3.2.0
org.apache.maven.plugins:maven-jar-plugin:3.2.0
org.apache.maven.plugins:maven-compiler-plugin:3.8.1
org.apache.maven.plugins:maven-surefire-plugin:2.22.2
org.apache.maven.plugins:maven-install-plugin:2.5.2
org.apache.maven.plugins:maven-deploy-plugin:2.8.2
org.apache.maven.plugins:maven-site-plugin:3.3
```

## mvn-help-effective-settings

```bash
cd ./use-maven-help-plugin
mvn help:effective-settings
```

### help

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

help:effective-settings
  Displays the calculated settings as XML for this project, given any profile
  enhancement and the inheritance of the global settings into the user-level
  settings.

  Available parameters:

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output

    showPasswords (Default: false)
      For security reasons, all passwords are hidden by default. Set this to
      true to show all passwords.
      User property: showPasswords
```

### describe

```plain
'help:effective-settings' is a plugin goal (aka mojo).
Mojo: 'help:effective-settings'
help:effective-settings
  Description: Displays the calculated settings as XML for this project,
    given any profile enhancement and the inheritance of the global settings
    into the user-level settings.
  Implementation: org.apache.maven.plugins.help.EffectiveSettingsMojo
  Language: java

  Available parameters:

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.

    showPasswords (Default: false)
      User property: showPasswords
      For security reasons, all passwords are hidden by default. Set this to
      true to show all passwords.
```

### output

```plain
Effective user-specific configuration settings:

<?xml version="1.0" encoding="UTF-8"?>
<!-- ====================================================================== -->
<!--                                                                        -->
<!-- Generated by Maven Help Plugin on 2020-11-23T17:17:07+08:00            -->
<!-- See: http://maven.apache.org/plugins/maven-help-plugin/                -->
<!--                                                                        -->
<!-- ====================================================================== -->
<!-- ====================================================================== -->
<!--                                                                        -->
<!-- Effective Settings for 'huzhenghui' on 'huzhenghuideMacBook-Pro.local' -->
<!--                                                                        -->
<!-- ====================================================================== -->
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
  <localRepository>/Users/huzhenghui/.m2/repository</localRepository>
  <pluginGroups>
    <pluginGroup>org.apache.maven.plugins</pluginGroup>
    <pluginGroup>org.codehaus.mojo</pluginGroup>
  </pluginGroups>
</settings>
```

## mvn-help-evaluate

```bash
cd ./use-maven-help-plugin
mvn help:evaluate -Dexpression=project.version
```

### help

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

help:evaluate
  Evaluates Maven expressions given by the user in an interactive mode.

  Available parameters:

    artifact
      An artifact for evaluating Maven expressions.
      Note: Should respect the Maven format, i.e. groupId:artifactId[:version].
      The latest version of the artifact will be used when no version is
      specified.
      User property: artifact

    expression
      An expression to evaluate instead of prompting. Note that this must not
      include the surrounding ${...}.
      User property: expression

    forceStdout (Default: false)
      This options gives the option to output information in cases where the
      output has been suppressed by using -q (quiet option) in Maven. This is
      useful if you like to use maven-help-plugin:evaluate in a script call (for
      example in bash) like this:
      RESULT=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
      echo $RESULT
      This will only printout the information which has been requested by
      expression to stdout.
      User property: forceStdout

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console. This parameter will be ignored if no
      expression is specified.
      Note: Could be a relative path.
      User property: output
```

### describe

```plain
'help:evaluate' is a plugin goal (aka mojo).
Mojo: 'help:evaluate'
help:evaluate
  Description: Evaluates Maven expressions given by the user in an
    interactive mode.
  Implementation: org.apache.maven.plugins.help.EvaluateMojo
  Language: java

  Available parameters:

    artifact
      User property: artifact
      An artifact for evaluating Maven expressions.
      Note: Should respect the Maven format, i.e. groupId:artifactId[:version].
      The latest version of the artifact will be used when no version is
      specified.

    expression
      User property: expression
      An expression to evaluate instead of prompting. Note that this must not
      include the surrounding ${...}.

    forceStdout (Default: false)
      User property: forceStdout
      This options gives the option to output information in cases where the
      output has been suppressed by using -q (quiet option) in Maven. This is
      useful if you like to use maven-help-plugin:evaluate in a script call
      (for example in bash) like this:
      RESULT=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
      echo $RESULT
      This will only printout the information which has been requested by
      expression to stdout.

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console. This parameter will be ignored if no
      expression is specified.
      Note: Could be a relative path.
```

### output

```plain
0.0.1-SNAPSHOT
```

## mvn-help-system

```bash
cd ./use-maven-help-plugin
mvn help:system
```

### help

```plain
Apache Maven Help Plugin 3.2.0
  The Maven Help plugin provides goals aimed at helping to make sense out of the
  build environment. It includes the ability to view the effective POM and
  settings files, after inheritance and active profiles have been applied, as
  well as a describe a particular plugin goal to give usage information.

help:system
  Displays a list of the platform details like system properties and environment
  variables.

  Available parameters:

    output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
      User property: output
```

### describe

```plain
'help:system' is a plugin goal (aka mojo).
Mojo: 'help:system'
help:system
  Description: Displays a list of the platform details like system properties
    and environment variables.
  Implementation: org.apache.maven.plugins.help.SystemMojo
  Language: java

  Available parameters:

    output
      User property: output
      Optional parameter to write the output of this help in a given file,
      instead of writing to the console.
      Note: Could be a relative path.
```
