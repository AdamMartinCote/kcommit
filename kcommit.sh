#!/usr/bin/env bash

function kcommit() {
  date=$1
  time=$2
  message=$3

  printf -v seconds "%02d" $((RANDOM % 60))

  DATE="${date}T${time}:${seconds}"
  GIT_COMMITTER_DATE="${DATE}" git commit --date="${DATE}" -m"${message}"
}
