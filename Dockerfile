FROM openjdk:21
EXPOSE 7070
ADD /build/libs/server-0.0.1-SNAPSHOT.jar server-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java", "-jar", "/server-0.0.1-SNAPSHOT.jar" ]
