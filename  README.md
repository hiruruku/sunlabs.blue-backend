# sunlabs.blue

Sunlabs.blue is a project aimed at creating practical websites
based on what I've learned.
In the backend, I plan to build APIs using the Go language and
the Echo framework.
 As a preliminary step, we will start with net/http.

## Overview of the Dockerfile:

Build stage: Use the Go language image to build the application.
Runtime stage: Use a lightweight Alpine Linux image as the base and copy the executable file generated in the build stage.
With the Dockerfile, you can build and run the application.

## Usage

1. Build the Docker image:

``` bash
docker build -t backend .
```

2.コンテナを実行

``` bash
docker run -p 1323:1323 backend
```