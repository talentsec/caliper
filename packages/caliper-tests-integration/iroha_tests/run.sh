#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Print all commands.
# set -v

# Work out the absolute path to current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

cd "${DIR}"

# change default settings (add config paths too)
export CALIPER_PROJECTCONFIG=caliper.yaml

dispose () {
    ${CALL_METHOD} launch manager --caliper-flow-only-end
}

# running the test
${CALL_METHOD} launch manager
rc=$?
if [[ ${rc} != 0 ]]; then
    echo 'Failed CI test';
    dispose;
    exit ${rc};
fi
