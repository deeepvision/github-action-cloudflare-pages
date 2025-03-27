#!/bin/sh

set -e

function main() {
  BUILD_COMMAND=${INPUT_BUILD:-build}
  BUILD_DIRECTORY=${INPUT_DIRECTORY:-dist}

  # Debugging: Print if NPM_TOKEN is set
  if [ -z "$NPM_TOKEN" ]; then
    echo "Error: NPM_TOKEN is not set."
    exit 1
  else
    echo "NPM_TOKEN is set."
  fi

  echo "@deep:registry=https://us-npm.pkg.dev/deepops/deep/" >> .npmrc && \
  echo "//us-npm.pkg.dev/deepops/deep/:always-auth=true" >> .npmrc && \
  echo "//us-npm.pkg.dev/deepops/deep/:_authToken=${NPM_TOKEN}" >> .npmrc

  # Debugging: Print the contents of .npmrc
  echo "Contents of .npmrc:"
  cat .npmrc

  npm install
  npm run ${BUILD_COMMAND}
  wrangler pages deploy --project-name=${INPUT_PROJECT} --branch master ${BUILD_DIRECTORY}
}

main
