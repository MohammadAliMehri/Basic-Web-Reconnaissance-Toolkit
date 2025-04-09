#!/bin/bash

echo "Enter your target domain: " 
read DOMAIN
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="scan_results_${DOMAIN}_$TIMESTAMP.txt"
{

echo "-----------------------------------"
echo "[+] Checking if host is up..."

ping -c 3 $DOMAIN
echo "-----------------------------------"

echo "[+] Getting IP Address..."

dig +short $DOMAIN | grep '^[.0-9]*$' > ips.txt

cat ips.txt
echo "-----------------------------------"

echo "[+] Nmap Scan (Top 1000 Ports)..."

nmap -iL ips.txt -p- --top-ports 1000 

echo "-----------------------------------"

echo "[+] HTTP Headers (HTTPS)..."
if ! curl -IkL --max-time 5 https://$DOMAIN; then
  echo "[!] HTTPS failed or timed out. Trying HTTP..."
  curl -IkL --max-time 5 http://$DOMAIN || echo "[!] HTTP also failed."
fi


rm -f ips.txt

} | tee "$OUTPUT_FILE"

echo "✅ Scan completed. Results saved to $OUTPUT_FILE"