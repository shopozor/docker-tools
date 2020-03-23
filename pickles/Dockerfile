
FROM mono:latest AS unpacker

ARG RELEASE_VERSION=2.20.1

ADD https://github.com/picklesdoc/pickles/releases/download/v${RELEASE_VERSION}/Pickles-exe-${RELEASE_VERSION}.zip /pickles.zip

RUN apt-get update \
  && apt-get install unzip \
  && mkdir /pickles \
  && unzip /pickles.zip -d /pickles

FROM mono:latest

COPY --from=unpacker /pickles /pickles

ENTRYPOINT [ "mono",  "/pickles/Pickles.exe" ]