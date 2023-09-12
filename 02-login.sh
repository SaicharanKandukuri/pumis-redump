#!/bin/bash

echo "02: sending login request.."
echo -e "\t after this cookie \"${COKKIE}\" will be able to login.."
curl -i -s --compressed -k -X $'POST' \
    -H $'Host: ums.paruluniversity.ac.in' \
    -H $'Cache-Control: max-age=0' \
    -H $'Sec-Ch-Ua: \"Chromium\";v=\"103\", \".Not/A)Brand\";v=\"99\"' \
    -H $'Sec-Ch-Ua-Mobile: ?0' \
    -H $'Sec-Ch-Ua-Platform: \"Windows\"' \
    -H $'Upgrade-Insecure-Requests: 1' \
    -H $'Origin: https://ums.paruluniversity.ac.in' \
    -H $'Content-Type: application/x-www-form-urlencoded' \
    -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.53 Safari/537.36' \
    -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
    -H $'Sec-Fetch-Site: same-origin' \
    -H $'Sec-Fetch-Mode: navigate' \
    -H $'Sec-Fetch-User: ?1' \
    -H $'Sec-Fetch-Dest: document' \
    -H $'Referer: https://ums.paruluniversity.ac.in/' \
    -H $'Accept-Encoding: gzip, deflate' \
    -H $'Accept-Language: en-US,en;q=0.9' \
    -H $'Connection: close' \
    -b $'ASP.NET_SessionId=$COOKIE' \
    --data-binary @${TMP_BIN} \
    $'https://ums.paruluniversity.ac.in/Login.aspx'
