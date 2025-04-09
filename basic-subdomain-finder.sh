#!/bin/bash

read -p "Enter your domain to find subdomains: " DOMAIN
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="subdomain_scan_${DOMAIN}_$TIMESTAMP.txt"

echo "[+] Finding subdomains for: $DOMAIN"

curl -s "https://crt.sh/?q=$DOMAIN&output=json" | jq -r '.[].name_value' | sed 's/\\n/\n/g' | awk '!seen[$0]++' | sort -u | grep -v "^[*]" | while read subdomain; do
    if ip=$(dig +short "$subdomain" | grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}|:'); then
        echo "$subdomain [UP] → $ip"
    fi
done | tee $OUTPUT_FILE


echo "[+] Results saved to: $OUTPUT_FILE "