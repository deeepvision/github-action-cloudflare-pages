#!/bin/sh

set -e

function main() {
  BUILD_COMMAND=${INPUT_BUILD:-build}

  npm install
  npm run ${BUILD_COMMAND}
  wrangler pages publish --project-name=${INPUT_PROJECT} --branch master ${INPUT_DIRECTORY}
}

main
