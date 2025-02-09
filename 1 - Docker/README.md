## Description

Building the **`kiada:1.0`** image:
- [Makefile](kiada-0.1/Makefile) - contains commands to build and push the image
- [Dockerfile](kiada-0.1/Dockerfile) - Docker instructions for building the image
- [app.js](kiada-0.1/app.js) - application code (JavaScript)

## Special Commands:

1. `docker history <image>:tag` - see size of each container layer.
2. `docker inspect <>` - JSON config of the container.
2. `echo $DOCKER_HOST` - to view container info (like IP)