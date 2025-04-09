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
