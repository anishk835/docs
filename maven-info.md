## Maven build tool useful commands

#### Diagnosis: version plugin
```
mvn version:display-plugin-updates
```
Plugins allow to enforce many settings such as Java version, Maven version

#### Dependency: analysis
```
mvn org.apache.maven.plugins:meven-dependency-plugin:{provide the version number}:analyze
```
```
mvn dependency:tree
```

#### Security: analysis
```
mvn org.owasp:dependency-check-maven:check
```
* Note: Register with the vulnerability database and use the API key in the pom file otherwise it will take a very long time.

#### Maven: extension and build plan
* Use maven extension, to create an extension XML file in the project root folder.
```
mvn buildplan:list-phase
```

#### Maven: report for dependency and license
```
mvn project-info-reports::dependencies
mvn license:third-party-report
```

#### Maven: demon command
* Use `mvnd` command instead of `mvn` it will be quite faster.

#### Note:
* In the maven test phase: Junits will be executed
* In the verify phase: The integration test will be executed.
