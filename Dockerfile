FROM    maven:3.6.0-jdk-8
LABEL maintainer="Venkat"
ENV ORGNAME = ""
ENV GRIDURL=""
ENV PAT=""
RUN     mkdir /functional-test
WORKDIR /functional-test
COPY    . .
RUN     mvn dependency:resolve
CMD mvn test -Dcucumber.options="--tags @UITest" -Dpat=${PAT} -Dhub=${GRIDURL} -Dorganization=${ORGNAME}