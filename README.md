# Docker - Hugo WebSite

Default theme : Stack (https://github.com/CaiJimmy/hugo-theme-stack)

## Install

### Build Image

```bash
git clone https://github.com/TheHackdes/docker-hugo
cd docker-hugo

docker build -f Dockerfile -t hugo .
```

### Run Container

```bash
docker run -dti \
    -e WEBSITE="mywebsite.com" \
    -e OPTIONS="--bind 0.0.0.0 --appendPort=false --baseURL=http://127.0.0.1:1313" \
    -p 1313:1313 \
    hugo:latest
```

### Docker Compose

```yaml
services:
  hugo_app:
    image: docker pull ghcr.io/thehackdes/docker-hugo:main
    container_name: hugo_app
    hostname: hugo_app
    restart: always
    ports:
      - 1313:1313
    volumes:
      - volume_hugo_app:/srv
    environment:
      WEBSITE: "mywebsite.com"
      OPTIONS: "--bind 0.0.0.0 --appendPort=false --baseURL=http://127.0.0.1:1313"

volumes:
  volume_hugo_app:
    name: volume_hugo_app
    external: false
```


## Create new page

```bash
docker exec -ti hugo_app hugo new -s /srv/mywebsite.com/ content/post/MyPost.md
```

Dont't forget to change daft: true to false to see this page.
