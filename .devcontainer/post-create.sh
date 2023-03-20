#!/bin/bash
set -e

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
sudo install skaffold /usr/local/bin/
rm -rf skaffold

if ! command -v k9s &> /dev/null
then
    curl -sS https://webinstall.dev/k9s | bash
else
    echo "k9s has already been installed."
fi