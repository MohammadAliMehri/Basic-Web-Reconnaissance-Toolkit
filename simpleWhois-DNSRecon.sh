#!/bin/bash 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

read -p "Enter your domain to extract DNS details: " DOMAIN

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="domain_scan_${DOMAIN}_$TIMESTAMP.txt"

{
    echo -e "${GREEN}\n[+] Starting DNS reconnaissance for $DOMAIN at $(date)${NC}\n"
    
    echo -e "${YELLOW}[+] WHOIS Information:${NC}"
    whois $DOMAIN | grep -vE "^>>>|^%" | head -n 20
    
    echo -e "\n${YELLOW}[+] DNS Records:${NC}"
    
    echo -e "\nA Records (IPv4):"
    dig $DOMAIN A +short | sed 's/^/  /'
    
    echo -e "\nAAAA Records (IPv6):"
    dig $DOMAIN AAAA +short | sed 's/^/  /'
    
    echo -e "\nMX Records (Mail Servers):"
    dig $DOMAIN MX +short | sort -n | sed 's/^/  /'
    
    echo -e "\nNS Records (Name Servers):"
    dig $DOMAIN NS +short | sed 's/^/  /'
    
    echo -e "\nTXT Records:"
    dig $DOMAIN TXT +short | sed 's/^/  /'
    
    echo -e "\nCNAME Records:"
    dig $DOMAIN CNAME +short | sed 's/^/  /'
    
    echo -e "\nSOA Record:"
    dig $DOMAIN SOA +short | sed 's/^/  /'
    
    echo -e "\n${GREEN}[+] Scan completed at $(date)${NC}"
} | tee $OUTPUT_FILE

echo -e "\n--------------------------------------------------"
echo -e "✅ ${GREEN}Recon completed. Results saved to ${YELLOW}$OUTPUT_FILE${NC}"
echo -e "--------------------------------------------------"
