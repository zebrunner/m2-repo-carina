FROM maven:3.8-openjdk-11

RUN mkdir -p /root/.m2/repository/ \
	&& git clone -b "8.0.7" https://github.com/zebrunner/carina-demo.git \
	&& mvn -U -Dsuite=api test -f carina-demo/pom.xml \
	&& rm -rf carina-demo \
	&& git clone -b "carina/7.4.28" --single-branch https://github.com/zebrunner/carina-demo.git \
        && mvn -U -Dsuite=api test  -f carina-demo/pom.xml \
	&& ls -la /root/.m2/repository/

