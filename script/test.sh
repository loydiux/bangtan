#!/bin/bash

mix deps.get
mix test

exit_code=$?

echo "Test exiting with code: ${exit_code}"

exit $exit_code
