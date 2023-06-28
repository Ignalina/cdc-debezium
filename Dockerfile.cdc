FROM debezium/server:2.3

LABEL maintainer="Ignalina"

USER root

COPY docker-maven-download.sh /usr/local/bin/docker-maven-download

#
# Set up the plugins directory ...
#
ENV MAVEN_DEP_DESTINATION=/debezium/lib \
    CONFLUENT_VERSION=7.4.0 \
    AVRO_VERSION=1.11.1 \
    GUAVA_VERSION=31.0.1-jre


RUN docker-maven-download confluent kafka-connect-avro-converter "$CONFLUENT_VERSION" 7cb7864467453b0bff4b10bc84e75f19 && \
    docker-maven-download confluent kafka-connect-avro-data "$CONFLUENT_VERSION" 32e530a42c841ae4c830b2ef627a8b5d && \
    docker-maven-download confluent kafka-avro-serializer "$CONFLUENT_VERSION" 6f7334fe1d7e4c0af62bf0ad3137d3a7 && \
    docker-maven-download confluent kafka-schema-serializer "$CONFLUENT_VERSION" ccec0e9caf81307b32ce4fb9281bb59b && \
    docker-maven-download confluent kafka-schema-registry-client "$CONFLUENT_VERSION" 1b4b35aaa99854396692d765b4705f64 && \
    docker-maven-download confluent common-config "$CONFLUENT_VERSION" 0fe5d1767ff573685a3195b3c4f460d5 && \
    docker-maven-download confluent common-utils "$CONFLUENT_VERSION" 46f7b6098d48c38520381d97a58ed865 && \
    docker-maven-download central org/apache/avro avro "$AVRO_VERSION" 9fad4fb0e34810ae5f3d7cb5223a7e1c && \
    docker-maven-download central com/google/guava guava "$GUAVA_VERSION" bb811ca86cba6506cca5d415cd5559a7
