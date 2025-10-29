#!/bin/bash
set -e
echo "select any of the below options as mode"
echo "options : dockerfile"
echo "          dockerhub"
echo "          local"

# === INPUTS ===
MODE="$1"                  # Options: dockerfile | dockerhub | local
IMAGE_NAME="$2"            # Image name (e.g., my-app)
DOCKERFILE_PATH="./Dockerfile"  # Used only in dockerfile mode
DOCKERHUB_IMAGE="$3"       # Used only in dockerhub mode (e.g., nginx:latest)
GIT_REPO="$4"

# === CONFIG ===
REGION="ap-south-1"
ACCOUNT_ID="588082971984"
REPO_NAME="$IMAGE_NAME-repo"
#GIT_REPO="https://github.com/<your-username>/<your-repo>.git"

# === AUTH TO ECR ===
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 588082971984.dkr.ecr.ap-south-1.amazonaws.com

# === CLONE REPO (only for dockerfile mode) ===
if [ "$MODE" == "dockerfile" ]; then
  git clone "$GIT_REPO"
  cd "$(basename "$GIT_REPO" .git)"
  docker build -f "$DOCKERFILE_PATH" -t "$IMAGE_NAME" .
fi

# === PULL FROM DOCKER HUB (dockerhub mode) ===
if [ "$MODE" == "dockerhub" ]; then
  docker pull "$DOCKERHUB_IMAGE"
  docker tag "$DOCKERHUB_IMAGE" "$IMAGE_NAME:latest"
fi

# === VERIFY LOCAL IMAGE EXISTS (local mode) ===
if [ "$MODE" == "local" ]; then
  if ! docker image inspect "$IMAGE_NAME:latest" > /dev/null 2>&1; then
    echo "Local image '$IMAGE_NAME:latest' not found."
    exit 1
  fi
fi

# === TAG & PUSH TO ECR ===
docker build -t testing .

docker tag testing:latest 588082971984.dkr.ecr.ap-south-1.amazonaws.com/testing:latest
docker push 588082971984.dkr.ecr.ap-south-1.amazonaws.com/testing:latest


