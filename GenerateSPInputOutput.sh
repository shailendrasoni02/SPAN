#!/bin/bash
#
# Copyright 2020 American Express Travel Related Services Company, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#


die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "./GenerateSPInputOutput.sh <SPANConfigFileName> <Stored Proc Id in SPANConfigFile> <packageName>"

mkdir -p output

java -cp target/span-fat.jar.jar com.americanexpress.span.codegenerator.SPANCodeGenerator -configFile "$1" -storedProcId "$2" -package "$3" -inputFileGenerationMode Y

