Experimental image for my personal learning project.

[![Actions Status](https://github.com/thebungler/docker-overseerr/workflows/Docker%20Build/badge.svg)](https://github.com/thebungler/overseerr/actions)

## Usage

shell
```shell
docker run -d \
    -p 7878:7878 \
    -v /blahblah/config:/config \
    thebungler/radarr
```

docker-compose
```docker-compose
  overseerr:
    image: thebungler/radarr:latest
    container_name: radarr
    environment:
      - PUID=1001
      - PGID=100
      - TZ=Europe/Berlin
    volumes:
      - /mydockervol/radarr:/config
    ports:
      - 7878:7878
    restart: unless-stopped
```

## Environment

- `$TZ`           - Timezone

## Volume

- `/config`       - where config is stored

## Network

- `7878/tcp`      - web interface
