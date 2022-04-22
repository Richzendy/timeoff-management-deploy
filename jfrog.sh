#!/bin/bash
DOCKER_ID=$(docker ps -qf name=timeoff-management-app)
DOCKER_TAG=$(cd /root/timeoff-management-deploy/timeoff-management-application && git rev-parse HEAD)

docker commit $DOCKER_ID timeoff-management-application:$DOCKER_TAG
docker login richzendy.jfrog.io

docker tag timeoff-management-application:$DOCKER_TAG richzendy.jfrog.io/timeoff-management-docker-local/$DOCKER_ID:$DOCKER_TAG
docker push richzendy.jfrog.io/timeoff-management-docker-local/$DOCKER_ID:$DOCKER_TAG
