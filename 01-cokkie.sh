#!/bin/bash

echo "01: getting cookie"
COKKIE="$(curl -i -s -L -k --compressed -X $'GET' \
    -H $'Host: ums.paruluniversity.ac.in' \
    -H $'Cache-Control: max-age=0' \
    -H $'Sec-Ch-Ua: \"Chromium\";v=\"103\", \".Not/A)Brand\";v=\"99\"' \
    -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' \
    -H $'Upgrade-Insecure-Requests: 1' \
    -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.53 Safari/537.36' \
    -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
    -H $'Sec-Fetch-Site: none' \
    -H $'Sec-Fetch-Mode: navigate' \
    -H $'Sec-Fetch-User: ?1' \
    -H $'Sec-Fetch-Dest: document' \
    -H $'Accept-Encoding: gzip, deflate' \
    -H $'Accept-Language: en-US,en;q=0.9' \
    -H $'Connection: close' \
    $'https://ums.paruluniversity.ac.in/' | grep Cookie | head -n1 | grep "ASP.NET_SessionId" | cut -d ';' -f -1 | cut -d '=' -f 2)"

