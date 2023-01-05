VERSION="$1"
DOCKER_COMPOSE="$2"
REPO_TOKEN="$3"
GITHUB_REPOSITORY=$(echo "$GITHUB_REPOSITORY" | awk '{print tolower($0)}')

echo "VERSION=$VERSION"
echo "DOCKER_COMPOSE=$DOCKER_COMPOSE"

docker login ghcr.io -u "${GITHUB_REF}" -p "${REPO_TOKEN}"

VERSION=$VERSION docker-compose -f "$DOCKER_COMPOSE" build

VERSION=$VERSION docker-compose -f "$DOCKER_COMPOSE" push