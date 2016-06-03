Deploy the site through wagon (scp,dav....)

## pom.xml

```

<!--site-deploy to an ECS Service-->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-site-plugin</artifactId>
    <dependencies>
        <dependency>
            <groupId>org.apache.maven.wagon</groupId>
            <artifactId>wagon-ssh</artifactId>
            <version>2.10</version>
        </dependency>
    </dependencies>
</plugin>

```

## settings.xml

```
<server>
    <id>site.ecs.dev</id>
    <username>username</username>
    <password>password!</password>
    <!--
    <privateKey>/Users/myuser/keyfile.key</privateKey>
    <passphrase>mypassword</passphrase>
    -->
</server>

```