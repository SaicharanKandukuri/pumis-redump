#!/bin/bash
export OPENSSL_CONF=ssl.conf

echo "00: getting view state"
RES="$(curl -s 'https://ums.paruluniversity.ac.in/Login.aspx' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en-IN,en-US;q=0.9,en-GB;q=0.8,en;q=0.7' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: ASP.NET_SessionId=gsg1yfvgwn2vtvhgexjrenod' \
  -H 'DNT: 1' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: \"Chromium\";v=\"116\", \"Not)A;Brand\";v=\"24\", \"Google Chrome\";v=\"116\"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: \"Linux\"' \
  --compressed)"

VIEW_STATE=$(echo $RES | grep "<input type=\"hidden\" name=\"__VIEWSTATE\" id=\"__VIEWSTATE\"" | cut -d " " -f 5 | cut -d "=" -f 2)
VIEW_STATE_ENCRYPTED=$(echo $RES | grep "<input type=\"hidden\" name=\"__VIEWSTATEENCRYPTED\" id=\"__VIEWSTATEENCRYPTED\"" | cut -d " " -f 5 | cut -d "=" -f 2)
VIEW_STATE_GENERATOR=$(echo $RES | grep "<input type=\"hidden\" name=\"__VIEWSTATEGENERATOR\" id=\"__VIEWSTATEGENERATOR\"" | cut -d " " -f 5 | cut -d "=" -f 2)
