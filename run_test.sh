#!/bin/bash
BASEDIR=$(dirname $0)

# Running the test
cd ${BASEDIR}/src/test/
ruby test_signup.rb