#!/usr/bin/env bash

date=$1
time=$2
message=$3

if [[ -z $date || -z $time || -z $message ]]; then
  echo "Usage:"
  echo "    kcommit <date YYYY-MM-DD> <time HH:MM> <commit-message 'Lorem Ipsum...'>"
  echo ""
  echo "example:"
  echo "    kcommit 2012-01-01 15:01 'Initial commit'"

  exit 1
fi

if [[ ${#time} != 5 ]]; then
  echo "Error: wrong time format"
  echo ""
  echo "    use: HH:MM, with HH [00-23] and MM [00-59]"
  exit 2
fi

if [[ ${#date} != 10 ]]; then
  echo "Error: wrong date format"
  echo ""
  echo "    use: YYYY-MM-DD"
  exit 3
fi

if [[ ${#@} != 3 ]]; then
  echo "Error: wrong number of arguments, is <commit-message> quoted?"
  exit 4
fi

# set $seconds to [00-59]
printf -v seconds "%02d" $((RANDOM % 60))

DATE="${date}T${time}:${seconds}"
GIT_COMMITTER_DATE="${DATE}" git commit --date="${DATE}" -m"${message}"
