#!/bin/bash

# Script for Pypi release
# 0. Make sure you are on git tag
# 1. Run the script
# 2. Upload sdist

set -e

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd $script_dir

TAG=$(git describe --exact-match --tags HEAD)

VERSION=${TAG/v/}

NNMNKWII_BUILD_VERSION=$VERSION python setup.py develop sdist
echo "*** Ready to release! nnmnkwii $TAG ***"
echo "Please run the following command manually:"
echo NNMNKWII_BUILD_VERSION=$VERSION python setup.py sdist upload
