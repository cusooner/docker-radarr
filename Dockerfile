FROM alpine:3.15 
ARG RADARR_BRANCH=master
ARG RADARR_VER=3.2.2.5080

RUN apk add --no-cache bash libstdc++ libgcc icu-libs libintl sqlite-libs libmediainfo
#  xmlstarlet

WORKDIR /radarr

#RUN wget -O- https://github.com/Radarr/Radarr/releases/download/v${RADARR_VER}/Radarr.master.${RADARR_VER}.linux-musl-core-x64.tar.gz \
RUN wget -O- https://github.com/Radarr/Radarr/releases/download/v${RADARR_VER}/Radarr.${RADARR_BRANCH}.${RADARR_VER}.linux-musl-core-x64.tar.gz \
        | tar --strip-components=1 -xzf - 
    # find . -name '*.mdb' -delete && \
    # find ./UI -name '*.map' -delete && \
    # rm -r Radarr.Update

VOLUME ["/config"]
EXPOSE 7878/TCP

#ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
CMD ["/radarr/Radarr", "--no-browser", "--data=/config"]

