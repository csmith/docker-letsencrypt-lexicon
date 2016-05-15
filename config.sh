#!/usr/bin/env bash

BASEDIR=/letsencrypt
CONTACT_EMAIL=$EMAIL

if [ -z ${STAGING+-} ]; then
  CA="https://acme-v01.api.letsencrypt.org/directory"
else
  CA="https://acme-staging.api.letsencrypt.org/directory"
fi

