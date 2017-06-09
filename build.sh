#!/bin/bash

set -eo pipefail

# Install merge plugin.
sudo docker run --rm \
    -v "$HOME/.composer":/composer \
    -v "$PWD":/app \
    composer/composer:alpine update -n

# Install all requirements.
sudo docker run --rm \
    -v "$HOME/.composer":/composer \
    -v "$PWD":/app \
    composer/composer:alpine update -n
