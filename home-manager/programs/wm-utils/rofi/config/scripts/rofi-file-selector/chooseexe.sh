#!/usr/bin/env bash 
set -e
set -o pipefail

SCRIPTPATH=$(realpath "$(dirname "$0")")

# To enable mocking in test
: "${_ROFI:=rofi}"

# Expect two args :  file and  ROFI_RETV code
echo "$@"

if [[ "$#" -ge 2 ]]
then
   ROFI_RETV="$2"
   if [[ $ROFI_RETV -eq 10 ]]
   then
      "$_ROFI" -show mimeopen -kb-custom-1 "Ctrl+plus" -modi "mimeopen:$SCRIPTPATH/mimeapps.sh \"$(dirname "$1")\" " 
   elif [[ $ROFI_RETV -eq 11 ]]
   then
      # echo "$1" | xsel -i -b; xsel -b | xsel -p -i; xsel -k
      # echo "$1" | wl-copy && wl-paste --no-newline | wl-copy --primary && wl-copy --clear
      echo "$1" | wl-copy && wl-paste --no-newline | wl-copy --primary
   else
      "$_ROFI" -show mimeopen -kb-custom-1 "Ctrl+plus" -modi "mimeopen:$SCRIPTPATH/mimeapps.sh \"$1\" " 
   fi
fi
