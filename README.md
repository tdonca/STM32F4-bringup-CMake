### Build the STM32F4 project in a Docker container

Build the container:

```$ sudo docker build . -t project-build```

Run the container with docker-compose:

```$ sudo docker-compose run project-build```

Run the build script for the project inside the container:

```# ./docker-entrypoint.sh```
