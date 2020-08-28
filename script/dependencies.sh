#!/bin/bash

mix local.rebar --force
mix local.hex --force
mix deps.get

apt-get update
apt-get install -y wget libc-bin python3-pip git openssh-client
pip3 install gigalixir


