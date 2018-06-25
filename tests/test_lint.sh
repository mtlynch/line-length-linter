#!/bin/bash

# Echo commands to stdout.
set -x

ROOT_FOLDER=$(pwd -P)
TEST_FILE=$ROOT_FOLDER/tests/data/test_file_for_lint.py
ACTUAL_OUTPUT_FILE=$(mktemp)
GOLDEN_OUTPUT_FILE=$ROOT_FOLDER/tests/data/golden_test_output.txt

# Run line length linter on test file.
PYTHONPATH=$PYTHONPATH:$ROOT_FOLDER/line_length_linter \
  pylint --reports=n \
    --rcfile=$ROOT_FOLDER/line_length_linter/.pylintrc \
    "$TEST_FILE" > "$ACTUAL_OUTPUT_FILE"

diff --ignore-all-space \
  "$GOLDEN_OUTPUT_FILE" \
  "$ACTUAL_OUTPUT_FILE"

# Remove temporary output file.
rm $ACTUAL_OUTPUT_FILE
