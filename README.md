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

**Example Output**

```
-----------------------------------
[+] Checking if host is up...
PING example.com (93.184.216.34) 56(84) bytes of data.
64 bytes from 93.184.216.34: icmp_seq=1 ttl=56 time=11.3 ms
64 bytes from 93.184.216.34: icmp_seq=2 ttl=56 time=10.8 ms
64 bytes from 93.184.216.34: icmp_seq=3 ttl=56 time=11.1 ms

--- example.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 10.800/11.066/11.300/0.200 ms
-----------------------------------
[+] Getting IP Address...
93.184.216.34
-----------------------------------
[+] Nmap Scan (Top 1000 Ports)...
Starting Nmap 7.92 ( https://nmap.org ) at 2025-04-10 16:00 UTC
Nmap scan report for example.com (93.184.216.34)
Host is up (0.011s latency).
Not shown: 998 filtered tcp ports (no-response)
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 4.56 seconds
-----------------------------------
[+] HTTP Headers (HTTPS)...
HTTP/2 200 
accept-ranges: bytes
age: 597574
cache-control: max-age=604800
content-type: text/html; charset=UTF-8
date: Thu, 10 Apr 2025 16:00:45 GMT
etag: "3147526947"
expires: Thu, 17 Apr 2025 16:00:45 GMT
last-modified: Thu, 17 Oct 2024 07:00:00 GMT
server: ECS (nyb/1D2E)
x-cache: HIT
content-length: 1256

✅ Scan completed. Results saved to scan_results_example.com_20250410_160045.txt
```

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
Enter your domain to extract DNS details: example.com

[+] Starting DNS reconnaissance for example.com at Thu Apr 10 15:30:45 UTC 2025

[+] WHOIS Information:
Domain Name: EXAMPLE.COM
Registry Domain ID: 2336799_DOMAIN_COM-VRSN
Registrar WHOIS Server: whois.iana.org
Registrar URL: http://res-dom.iana.org
Updated Date: 2022-08-14T07:01:31Z
Creation Date: 1995-08-14T04:00:00Z
Registry Expiry Date: 2023-08-13T04:00:00Z
Registrar: IANA
Name Server: A.IANA-SERVERS.NET
Name Server: B.IANA-SERVERS.NET

[+] DNS Records:

A Records (IPv4):
  93.184.216.34

AAAA Records (IPv6):
  2606:2800:220:1:248:1893:25c8:1946

MX Records (Mail Servers):
  0 .
  10 mail.example.com

NS Records (Name Servers):
  a.iana-servers.net
  b.iana-servers.net

TXT Records:
  "v=spf1 -all"
  "google-site-verification=1234567890"

CNAME Records:

SOA Record:
  a.iana-servers.net. hostmaster.example.com. 2023040101 7200 3600 1209600 3600

[+] Scan completed at Thu Apr 10 15:30:47 UTC 2025

--------------------------------------------------
✅ Recon completed. Results saved to domain_scan_example.com_20250410_153045.txt
--------------------------------------------------

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
