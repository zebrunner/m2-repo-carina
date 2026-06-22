FROM maven:3.9-eclipse-temurin-17

RUN mkdir -p /root/.m2/repository/ \
	&& git clone -b "esg-cache" --single-branch https://github.com/zebrunner/carina-demo.git \
	&& mvn -U -Dsuite=api test -f carina-demo/pom.xml \
	&& rm -rf carina-demo \
        && git clone -b "main" --single-branch https://github.com/zebrunner/cucumber-demo.git \
        && mvn -U -Dsuite=helloWorld test -f cucumber-demo/pom.xml \
        && rm -rf cucumber-demo \
	&& du -hsl /root/.m2/repository/

ENTRYPOINT ["bash", "-c", "exit", "0"]
