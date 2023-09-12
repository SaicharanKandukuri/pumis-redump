#!/bin/bash

# pumis is old and have issues with ssl
export OPENSSL_CONF=ssl.conf

# function to url encode (for password )
function urlEncode() {
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

username=$1
password="$(urlEncode $2)"

export VIEW_STATE=""
export COKKIE=""
TMP_BIN=$(mktemp puwifi-XXXX.tmp)

source ./00-view-state.sh || exit 1
source ./01-cokkie.sh || exit 1

# generate view state
BIN="__LASTFOCUS=&__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=${VIEW_STATE}&__VIEWSTATEGENERATOR=${VIEW_STATE_GENERATOR}&__VIEWSTATEENCRYPTED=${VIEW_STATE_ENCRYPTED}&hfWidth=945&hfHeight=948&hfLoginMethod=&txtUsername=${username}&txtPassword=${password}&btnLogin=Login"

echo $BIN > ${TMP_BIN}

source ./02-login.sh || exit 1

# Now the COKKIE can be used to access anything
