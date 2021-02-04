time cat url.txt| parallel --eta  -j500 --joblog job.log curl --silent -o {}.$(date +%Y-%m-%d).log  --retry 5 --max-time 20 --connect-timeout 5 --write-out site:{}\'\\\nhttp_code:\\\t%{http_code}\\\nremote_ip:\\\t%{remote_ip}\\\nsize_request:\\\t%{size_request}\\\nsize_header:\\\t%{size_header}\\\nsize_download:\\\t%{size_download}\\\nspeed_download:\\\t%{speed_download}\\\ntime_namelookup:\\\t%{time_namelookup}\\\ntime_connect:\\\t%{time_connect}\\\ntime_total:\\\t%{time_total}\\\n\\\n\' --location --max-redirs 5 --user-agent \"`shuf -n 1 ua.txt`\" {} >> net_quality.log
