#!/bin/bash

if [ -d /srv/${WEBSITE} ]
then
  echo "${WEBSITE} already existe"
  hugo server --logLevel debug -s /srv/${WEBSITE} --bind 0.0.0.0 --appendPort=false --baseURL="http://127.0.0.1:1313"
else
  echo "${WEBSITE} not found"
  hugo new site /srv/${WEBSITE}
  git clone https://github.com/CaiJimmy/hugo-theme-stack /srv/${WEBSITE}/themes/hugo-theme-stack
  rm -rf /srv/${WEBSITE}/hugo.toml
  cp /root/hugo.yaml /srv/${WEBSITE}/hugo.yaml
  hugo server --logLevel debug -s /srv/${WEBSITE} --bind 0.0.0.0 --appendPort=false --baseURL="http://127.0.0.1:1313"
fi

