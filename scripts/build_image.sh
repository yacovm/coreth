#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Avalanche root directory
AVALANCHE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )"; cd .. && pwd )

# Load the versions
source "$AVALANCHE_PATH"/scripts/versions.sh

# Load the constants
source "$AVALANCHE_PATH"/scripts/constants.sh

echo "Building Docker Image: $dockerhub_repo:$build_image_id based of $avalanche_version"
docker build -t "$dockerhub_repo:$build_image_id" "$AVALANCHE_PATH" -f "$AVALANCHE_PATH/Dockerfile" \
  --build-arg AVALANCHE_VERSION="$avalanche_version" \
  --build-arg CORETH_COMMIT="$coreth_commit" \
  --build-arg CURRENT_BRANCH="$current_branch"
