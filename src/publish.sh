VERSION="$1"
DOCKER_COMPOSE="$2"
REPO_TOKEN="$3"
GITHUB_REPOSITORY=$(echo "$GITHUB_REPOSITORY" | awk '{print tolower($0)}')

echo "VERSION=$VERSION"
echo "DOCKER_COMPOSE=$DOCKER_COMPOSE"

docker login ghcr.io -u "${GITHUB_REF}" -p "${REPO_TOKEN}"

VERSION=$VERSION docker-compose -f "$DOCKER_COMPOSE" build
IMAGES=$(docker inspect --format='{{.Image}}' "$(docker ps -aq)")

echo "IMAGES: $IMAGES"
for IMAGE in $IMAGES; do
    echo "IMAGE: $IMAGE"
    
    NAME=$(basename "${GITHUB_REPOSITORY}").$(docker inspect --format '{{ index .Config.Labels "name" }}' "$IMAGE")
    TAG="ghcr.io/${GITHUB_REPOSITORY}/$NAME:$VERSION"

    docker tag "$IMAGE" "$TAG"
    docker push "$TAG"
done
