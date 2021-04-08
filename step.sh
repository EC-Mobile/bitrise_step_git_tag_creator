#!/bin/bash
set -ex

# setup fields
marketingVersion=`eval $marketing_version_script`
buildNumber=`eval $build_number_script`
tag=${tag_format/MARKETING_VERSION/$marketingVersion}
tag=${tag/BUILD_NUMBER/$buildNumber}

git fetch --tags
if git rev-parse "${tag}" >/dev/null 2>&1; then
  echo "tag exists";
else
  echo "tag does not exist"
  git tag $tag
  git push $remote_name --tags
fi
