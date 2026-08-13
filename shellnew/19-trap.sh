#!/bin/bash

set -e
trap 'echo "There is error in $LINENO, Command: $BASH_COMMAND"' ERR
echo "Hello World"
echo "This is a test script"
echooo "Printing error here"
echo "No error here"