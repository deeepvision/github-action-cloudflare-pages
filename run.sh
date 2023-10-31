#!/bin/sh

set -e

function main() {
  BUILD_COMMAND=${INPUT_BUILD:-build}
  BUILD_DIRECTORY=${INPUT_DIRECTORY:-dist}

  echo "@deeepvision:registry=https://npm.pkg.github.com" >> .npmrc && \
  echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc && \

  npm install
  npm run ${BUILD_COMMAND}
  wrangler pages deploy --project-name=${INPUT_PROJECT} --branch master ${BUILD_DIRECTORY}
}

main
