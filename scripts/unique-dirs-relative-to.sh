#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Base path (first argument) required"
    exit 1
fi
base=$(cd "$1" && pwd)
shift

for path in "$@"; do
  if [ -d "$path" ]; then
    realpath --relative-to="$base" "$path"
  elif [ -f "$path" ]; then
    realpath --relative-to="$base" $(dirname "$path")
  fi
done | sort -u
