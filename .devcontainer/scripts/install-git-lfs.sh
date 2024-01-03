#! /usr/bin/env bash
# This script is intended to install git lfs
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
apt-get install git-lfs
git lfs install