#!/bin/bash
set -euo pipefail

chmod +x ./ecspush.sh

./ecspush.sh \
  "${INPUT_MODE}" \
  "${INPUT_IMAGE_NAME}" \
  "${INPUT_IMAGE_TAG}" \
  "${INPUT_DOCKERHUB_IMAGE:-}" \
  "${INPUT_GIT_REPO:-}" \
  "${INPUT_ECR_REPO}"
