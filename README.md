# Docker Compose Publish to GitHub Packages

A GitHub Action that builds and publishes containers from docker-compose file to the current github packages

## Fork notice

This repository is fork from [pennsignals/publish_docker-compose](https://github.com/pennsignals/publish_docker-compose)

## Features

No need to manually build and publish each dockerfile. Simply publish the files that you are using.

Automatically publishes images to github repository

Each service in `docker-compose.yml` must have set `image` property like `ghcr.io/USERNAME/YOUR_IMAGE_NAME`.

If version is blank (recommended), the release tag version is used.

## Example Usage
```
    - name: publish
      uses: soltys/publish-docker-compose@v1.0.0
      with:
        version: 'latest'
        docker_compose: 'docker-compose.build.yml'
        repo_token: "${{ secrets.GITHUB_TOKEN }}"
```

## Input

Below is a breakdown of the expected action inputs.

### `version`

Tag to be published

### `docker_compose`

docker-compose file to use

### `repo_token`

repository token: ${{ secrets.GITHUB_TOKEN }}


