# 🛠️ Basic Web Reconnaissance Toolkit

A collection of simple yet effective Bash scripts for performing foundational web reconnaissance tasks.  
Ideal for beginner penetration testers, CTF players, and anyone learning the basics of information gathering in cybersecurity.

---

## 📁 Included Scripts

### 1. `basic-web-recon.sh`
Performs a quick scan on a given domain including:

- ✅ Host availability check (`ping`)
- 🌐 IP resolution (`dig`)
- 🔍 Top 1000 TCP port scan (`nmap`)
- 📥 HTTP/S header retrieval (`curl`)

**📌 Usage:**
```bash
chmod +x basic-web-recon.sh
./basic-web-recon.sh
```
You'll be prompted to enter a domain (e.g., `example.com`).  
Results are saved to: `scan_results_example.com_<timestamp>.txt`

---

### 2. `simpleWhois-DNSRecon.sh`
Extracts rich WHOIS and DNS information about a target domain:

- 🗂 WHOIS data
- 📄 DNS Records:
  - A (IPv4)
  - AAAA (IPv6)
  - MX (Mail Servers)
  - NS (Name Servers)
  - TXT
  - CNAME
  - SOA

**📌 Usage:**
```bash
chmod +x simpleWhois-DNSRecon.sh
./simpleWhois-DNSRecon.sh
```
You'll be asked to input a domain.  
Results saved in: `domain_scan_example.com_<timestamp>.txt`

**Example Output**

```
./simpleWhois-DNSRecon.sh  
Enter your domain to extract DNS details: github.com

[+] Starting DNS reconnaissance for github.com at Wed Apr  9 02:36:24 PM EDT 2025

[+] WHOIS Information:
   Domain Name: GITHUB.COM
   Registry Domain ID: 1264983250_DOMAIN_COM-VRSN
   Registrar WHOIS Server: whois.markmonitor.com
   Registrar URL: http://www.markmonitor.com
   Updated Date: 2024-09-07T09:16:32Z
   Creation Date: 2007-10-09T18:20:50Z
   Registry Expiry Date: 2026-10-09T18:20:50Z
   Registrar: MarkMonitor Inc.
   Registrar IANA ID: 292
   Registrar Abuse Contact Email: abusecomplaints@markmonitor.com
   Registrar Abuse Contact Phone: +1.2086851750
   Domain Status: clientDeleteProhibited https://icann.org/epp#clientDeleteProhibited
   Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
   Domain Status: clientUpdateProhibited https://icann.org/epp#clientUpdateProhibited
   Name Server: DNS1.P08.NSONE.NET
   Name Server: DNS2.P08.NSONE.NET
   Name Server: DNS3.P08.NSONE.NET
   Name Server: DNS4.P08.NSONE.NET
   Name Server: NS-1283.AWSDNS-32.ORG
   Name Server: NS-1707.AWSDNS-21.CO.UK

[+] DNS Records:

A Records (IPv4):
  140.82.121.3

AAAA Records (IPv6):

MX Records (Mail Servers):
  1 aspmx.l.google.com.
  5 alt1.aspmx.l.google.com.
  5 alt2.aspmx.l.google.com.
  10 alt3.aspmx.l.google.com.
  10 alt4.aspmx.l.google.com.

NS Records (Name Servers):
  ns-520.awsdns-01.net.
  ns-1283.awsdns-32.org.
  ns-1707.awsdns-21.co.uk.
  dns1.p08.nsone.net.
  dns2.p08.nsone.net.
  dns3.p08.nsone.net.
  dns4.p08.nsone.net.
  ns-421.awsdns-52.com.

TXT Records:
  "atlassian-domain-verification=jjgw98AKv2aeoYFxiL/VFaoyPkn3undEssTRuMg6C/3Fp/iqhkV4HVV7WjYlVeF8"
  "v=spf1 ip4:192.30.252.0/22 include:_netblocks.google.com include:_netblocks2.google.com include:_netblocks3.google.com include:spf.protection.outlook.com include:mail.zendesk.com include:_spf.salesforce.com include:servers.mcsv.net include:mktomail.com ip" "4:166.78.69.169 ip4:166.78.69.170 ip4:166.78.71.131 ip4:167.89.101.2 ip4:167.89.101.192/28 ip4:192.254.112.60 ip4:192.254.112.98/31 ip4:192.254.113.10 ip4:192.254.113.101 ip4:192.254.114.176 ip4:62.253.227.114 ~all"
  "MS=ms44452932"
  "MS=ms58704441"
  "apple-domain-verification=RyQhdzTl6Z6x8ZP4"
  "MS=6BF03E6AF5CB689E315FB6199603BABF2C88D805"
  "docusign=087098e3-3d46-47b7-9b4e-8a23028154cd"
  "loom-site-verification=f3787154f1154b7880e720a511ea664d"
  "shopify-verification-code=t1YPwcmvnxZyBycaCpk1MPyWoFs72o"
  "krisp-domain-verification=ZlyiK7XLhnaoUQb2hpak1PLY7dFkl1WE"
  "miro-verification=d2e174fdb00c71e0bcf58f8e58c3da2dd80dcfa9"
  "facebook-domain-verification=39xu4jzl7roi7x0n93ldkxjiaarx50"
  "calendly-site-verification=at0DQARi7IZvJtXQAWhMqpmIzpvoBNF7aam5VKKxP"
  "google-site-verification=82Le34Flgtd15ojYhHlGF_6g72muSjamlMVThBOJpks"
  "google-site-verification=UTM-3akMgubp6tQtgEuAkYNYLyYAvpTnnSrDMWoDR3o"
  "stripe-verification=f88ef17321660a01bab1660454192e014defa29ba7b8de9633c69d6b4912217f"
  "adobe-idp-site-verification=b92c9e999aef825edc36e0a3d847d2dbad5b2fc0e05c79ddd7a16139b48ecf4b"

CNAME Records:

SOA Record:
  dns1.p08.nsone.net. hostmaster.nsone.net. 1656468023 43200 7200 1209600 3600

[+] Scan completed at Wed Apr  9 02:36:28 PM EDT 2025

--------------------------------------------------
✅ Recon completed. Results saved to domain_scan_github.com_20250409_143624.txt

```



---

### 3. `basic-subdomain-finder.sh`
Finds subdomains using certificate transparency logs from [crt.sh](https://crt.sh/).

- 🧾 Extracts subdomains using `curl` + `jq`
- ✅ Verifies active ones via DNS resolution

**📌 Usage:**
```bash
chmod +x basic-subdomain-finder.sh
./basic-subdomain-finder.sh
```
You'll be prompted for a domain (e.g., `example.com`).  
Live subdomains are printed and saved in: `subdomain_scan_example.com_<timestamp>.txt`

**Example Output**

```
./basic-subdomain-finder.sh
Enter your domain to find subdomains: github.com
[+] Finding subdomains for: github.com
api.security.github.com [UP] → 140.82.113.22
atom-installer.github.com [UP] → 185.199.108.133
185.199.109.133
185.199.110.133
185.199.111.133
brandguide.github.com [UP] → 185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
central.github.com [UP] → 140.82.114.21
classroom.github.com [UP] → 140.82.112.21
communication.github.com [UP] → 192.243.228.1
community.github.com [UP] → 140.82.114.17
docs.github.com [UP] → 185.199.109.154
185.199.110.154
185.199.111.154
185.199.108.154
education.github.com [UP] → 140.82.114.21
edu.github.com [UP] → 140.82.112.21
www.github.com [UP] → 140.82.121.4
[+] Results saved to: subdomain_scan_github.com_20250409_142330.txt 
```

---

## 🧰 Requirements

Make sure the following are installed on your system:

- `bash`
- `curl`
- `nmap`
- `dig` (from `dnsutils`)
- `whois`
- `jq`

**Debian/Ubuntu install:**
```bash
sudo apt update && sudo apt install curl nmap dnsutils whois jq -y
```

---

## ⚠️ Disclaimer

These tools are for **educational and ethical purposes only**.  
**Never scan a target without permission**. Unauthorized reconnaissance is illegal and unethical.

---

## 💡 Contributions

This is a minimalist project—easy to fork, modify, and expand.  
Ideas, suggestions, and pull requests are always welcome! 🙌

---

## ✨ Author

Made with ☕ and Bash by [Me](https://github.com/MohammadAliMehri)
