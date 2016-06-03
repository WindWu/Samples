Deploy the site through tomcat7 (scp,dav....)

## pom.xml

```

<!--Deploy to Tomcat 7 running in ECS-->
<plugin>
  <groupId>org.apache.tomcat.maven</groupId>
  <artifactId>tomcat7-maven-plugin</artifactId>
  <version>2.2</version>
  <configuration>
      <url>http://10.148.165.241:8080/manager/text</url>
      <server>TomcatServer_ECS</server>
      <path>/${project.artifactId}</path>
  </configuration>
</plugin>

```

## settings.xml

```
<server>
    <server>
        <id>TomcatServer_ECS</id>
        <username>admin</username>
        <password>adminadmin</password>
	</server>
</server>

```