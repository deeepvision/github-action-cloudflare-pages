#!/bin/sh

set -e

function main() {
  BUILD_COMMAND=${INPUT_BUILD:-build}
  BUILD_DIRECTORY=${INPUT_DIRECTORY:-dist}

  echo "@deep:registry=https://us-npm.pkg.dev/deepops/deep/" >> .npmrc && \
  echo "//us-npm.pkg.dev/deepops/deep/:always-auth=true" >> .npmrc && \
  echo "//us-npm.pkg.dev/deepops/deep/:_authToken=${NPM_TOKEN}" >> .npmrc && \

  npm install
  npm run ${BUILD_COMMAND}
  wrangler pages deploy --project-name=${INPUT_PROJECT} --branch master ${BUILD_DIRECTORY}
}

main
