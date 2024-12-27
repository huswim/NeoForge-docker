FROM amazoncorretto:22-alpine-jdk

# Set Timezone
ENV TZ=Asia/Seoul
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk del tzdata

# Download NeoForge
ARG NEOFORGE_VERSION=21.3.58
ARG NEOFORGE_URL=https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}/neoforge-${NEOFORGE_VERSION}-installer.jar

ENV NEOFORGE_HOME=/neoforge

RUN mkdir -p ${NEOFORGE_HOME}
WORKDIR ${NEOFORGE_HOME}

ADD  ${NEOFORGE_URL} .

# Install neoforge server
RUN java -jar neoforge-${NEOFORGE_VERSION}-installer.jar --installServer
RUN rm neoforge-${NEOFORGE_VERSION}-installer*

RUN echo "eula=true" > eula.txt

# Add mods
# RUN mkdir ./mods
# WORKDIR ${NEOFORGE_HOME}/mods
# ADD https://mediafilez.forgecdn.net/files/5553/805/cloth-config-15.0.128-neoforge.jar .
# ADD https://mediafilez.forgecdn.net/files/5439/910/BetterF3-11.0.1-NeoForge-1.21.jar .

# Run
WORKDIR ${NEOFORGE_HOME}
ENTRYPOINT [ "./run.sh" ]