# System Administration Documentation

Unix/Linux system administration, networking, and utilities.

## 📖 Contents

### [Unix Permissions & TCP Commands](../unix-permission-tcp-command.md)
Essential system administration commands:

#### 🔐 Unix File Permissions

**Permission Format: `rwx`**
```
Owner   Group   Others
rwx     r-x     r-x
```

**Meaning:**
- **r** (read): List directory contents / Read file
- **w** (write): Create files in directory / Modify file
- **x** (execute): Descend into directory / Execute file

**Quick Reference:**
```bash
# Set permissions on all files in directory
sudo find /path/to/Dir -type f -print0 | xargs -0 sudo chmod 644

# Common permission patterns
chmod 755 script.sh    # rwxr-xr-x (executable)
chmod 644 file.txt     # rw-r--r-- (readable)
chmod 600 secret.key   # rw------- (private)
```

**Documentation:**
- [Bash Permissions Syntax](https://ss64.com/bash/syntax-permissions.html)

---

#### 🌐 TCP Packet Capture (tcpdump)

**Basic Commands:**

```bash
# 1. Capture from specific interface
tcpdump -i eth0

# 2. Capture only N packets
tcpdump -c 5 -i eth0

# 3. Print in ASCII
tcpdump -A -i eth0

# 4. Display available interfaces
tcpdump -D

# 5. Display packets in HEX and ASCII
tcpdump -XX -i eth0

# 6. Capture and save to file
tcpdump -w capture.pcap -i eth0

# 7. Read captured packets
tcpdump -r capture.pcap

# 8. Capture IP addresses (no DNS resolution)
tcpdump -n -i eth0

# 9. Capture only TCP packets
tcpdump -i eth0 tcp

# 10. Capture specific port
tcpdump -i eth0 port 22

# 11. Capture from source IP
tcpdump -i eth0 src 10.197.22.13

# 12. Capture to destination IP
tcpdump -i eth0 dst 10.197.22.13
```

**Advanced Filters:**

```bash
# Capture HTTP traffic
tcpdump -i eth0 port 80 -A

# Capture HTTPS traffic
tcpdump -i eth0 port 443

# Capture traffic between two IPs
tcpdump -i eth0 host 192.168.1.10 and host 192.168.1.20

# Capture specific protocol
tcpdump -i eth0 icmp

# Capture with timestamp
tcpdump -i eth0 -tttt

# Capture with verbose output
tcpdump -i eth0 -v
tcpdump -i eth0 -vv
tcpdump -i eth0 -vvv
```

---

#### 💾 Disk Usage

**Display file/directory sizes sorted by size:**
```bash
du -sh * | sed -e 's/\t/|/g' | sort -h -r
```

**Output Example:**
```
2.5G|logs
1.2G|backups
500M|data
100M|config
```

**Other Useful Commands:**
```bash
# Human-readable sizes
du -h --max-depth=1 /path/to/dir

# Total size of directory
du -sh /path/to/dir

# Sort by size
du -h /path/to/dir | sort -h

# Find largest files
find /path -type f -exec du -h {} + | sort -h -r | head -20

# Disk space overview
df -h

# Inode usage
df -i
```

---

## 🔗 Related Documents

- [.zshrc Configuration](../.zshrc) - Shell configuration
- [Scripts & Utilities](../script/) - System automation scripts
- [Docker Commands](../docker.md) - Container permissions

---

## 💡 Best Practices

### File Permissions

1. **Principle of Least Privilege**
   - Give minimum necessary permissions
   - Regular files: 644 (rw-r--r--)
   - Executables: 755 (rwxr-xr-x)
   - Private files: 600 (rw-------)
   - Directories: 755 (rwxr-xr-x)

2. **Security Best Practices**
   ```bash
   # SSH keys
   chmod 600 ~/.ssh/id_rsa
   chmod 644 ~/.ssh/id_rsa.pub
   chmod 700 ~/.ssh

   # Web server files
   find /var/www -type d -exec chmod 755 {} \;
   find /var/www -type f -exec chmod 644 {} \;
   ```

3. **Special Permissions**
   ```bash
   # Setuid (4): Run as owner
   chmod 4755 /usr/bin/sudo

   # Setgid (2): Inherit group
   chmod 2755 /var/shared

   # Sticky bit (1): Only owner can delete
   chmod 1777 /tmp
   ```

### Network Troubleshooting

1. **TCP Dump Best Practices**
   - Use `-n` to avoid DNS lookups (faster)
   - Save to `.pcap` for Wireshark analysis
   - Rotate capture files for long-running captures
   - Filter early to reduce capture size

2. **Common Troubleshooting Scenarios**
   ```bash
   # Debug slow application
   tcpdump -i eth0 -w slow.pcap host app-server

   # Monitor database connections
   tcpdump -i eth0 port 3306 -A

   # Check SSL/TLS handshake
   tcpdump -i eth0 port 443 -X

   # Verify firewall rules
   tcpdump -i eth0 src 10.0.0.5
   ```

3. **Performance Monitoring**
   ```bash
   # Network interface stats
   netstat -i

   # Active connections
   netstat -an | grep ESTABLISHED

   # Listening ports
   netstat -tuln

   # Socket statistics
   ss -s
   ```

### Disk Management

1. **Regular Monitoring**
   ```bash
   # Daily disk check script
   df -h | awk '$5 > 80 {print "Warning: " $1 " is " $5 " full"}'
   ```

2. **Cleanup Strategies**
   ```bash
   # Find old log files
   find /var/log -type f -mtime +30

   # Find large files
   find / -type f -size +100M -exec ls -lh {} \;

   # Clean package manager cache
   yum clean all        # RHEL/CentOS
   apt-get clean        # Debian/Ubuntu
   ```

3. **Inode Monitoring**
   ```bash
   # Check inode usage
   df -i

   # Find directories with many files
   find /path -xdev -type d -exec sh -c 'echo $(ls -1 "$1" | wc -l) "$1"' _ {} \; | sort -n -r | head -20
   ```

---

## 🔍 Quick Reference

### Permission Octal Values

| Octal | Binary | Permission | Description |
|-------|--------|------------|-------------|
| 0     | 000    | ---        | No access   |
| 1     | 001    | --x        | Execute     |
| 2     | 010    | -w-        | Write       |
| 3     | 011    | -wx        | Write + Execute |
| 4     | 100    | r--        | Read        |
| 5     | 101    | r-x        | Read + Execute |
| 6     | 110    | rw-        | Read + Write |
| 7     | 111    | rwx        | Full access |

### Common Port Numbers

| Port  | Service | Protocol |
|-------|---------|----------|
| 22    | SSH     | TCP      |
| 80    | HTTP    | TCP      |
| 443   | HTTPS   | TCP      |
| 3306  | MySQL   | TCP      |
| 5432  | PostgreSQL | TCP   |
| 6379  | Redis   | TCP      |
| 8080  | HTTP Alt| TCP      |
| 27017 | MongoDB | TCP      |

### tcpdump Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `host` | Specific host | `tcpdump host 192.168.1.1` |
| `src`  | Source address | `tcpdump src 192.168.1.1` |
| `dst`  | Destination | `tcpdump dst 192.168.1.1` |
| `port` | Port number | `tcpdump port 80` |
| `tcp`  | TCP only | `tcpdump tcp` |
| `udp`  | UDP only | `tcpdump udp` |
| `net`  | Network | `tcpdump net 192.168.1.0/24` |
| `and`  | Logical AND | `tcpdump host A and port 80` |
| `or`   | Logical OR | `tcpdump port 80 or port 443` |
| `not`  | Logical NOT | `tcpdump not port 22` |

---

## 📚 Additional Resources

**Unix/Linux:**
- [Linux Documentation Project](https://tldp.org/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

**Networking:**
- [tcpdump Manual](https://www.tcpdump.org/manpages/tcpdump.1.html)
- [Wireshark Documentation](https://www.wireshark.org/docs/)

**System Administration:**
- [Red Hat System Administration Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/system_design_guide/)

---

*Part of [Technical Documentation Repository](../README.md)*
