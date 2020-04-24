#!/bin/sh -ex

export ACTION="$1"
export ACTION_SCRIPT="./scripts/${1}.sh"

[ -f "$ACTION_SCRIPT" ] || {
  echo "[-] Fatal: Script for action \"${ACTION}\" doesn't exist" >&2
  exit 1
}

exec "$ACTION_SCRIPT"
