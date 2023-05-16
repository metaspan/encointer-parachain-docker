#!/bin/bash

get_latest_release() {
  curl --silent --insecure "https://api.github.com/repos/encointer/encointer-parachain/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

RELEASE=$(get_latest_release)
echo "Latest release: ${RELEASE}"
wget --no-check-certificate "https://github.com/encointer/encointer-parachain/releases/download/${RELEASE}/encointer-collator"
