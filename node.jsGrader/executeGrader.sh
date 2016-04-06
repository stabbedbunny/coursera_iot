#! /bin/bash

# Check if the compilation was successful
if [ ! $? -eq 0 ]; then
  echo "{ \"fractionalScore\":0.0, \"feedback\":\"Compile Error\" }"
  exit 0
fi

