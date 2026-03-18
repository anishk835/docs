# Technical Documentation Repository

A comprehensive collection of development guides, setup instructions, and reference materials for software engineering.

## 📑 Table of Contents

- [Version Control](#version-control)
- [Build Tools](#build-tools)
- [Java & Spring](#java--spring)
- [Containerization](#containerization)
- [Orchestration](#orchestration)
- [Node.js](#nodejs)
- [System Administration](#system-administration)
- [Development Environment](#development-environment)
- [Scripts & Utilities](#scripts--utilities)
- [Learning Resources](#learning-resources)

---

## 🔧 Version Control

### Git
- **[Git Cheat Sheet](./git-cheat-sheet.md)** - Essential Git commands and workflows
  - Delete merged/stale branches
  - Decorate git logs with colors and formatting
  - Add branch name to terminal prompt

- **[Git Local Exclude Setup Guide](./git-local-exclude-setup.md)** - Configure local file exclusions
  - Use `.git/info/exclude` for personal file patterns
  - Keep `.gitignore` clean for team-wide patterns
  - Complete setup with examples and troubleshooting

---

## 🏗️ Build Tools

### Maven
- **[Maven Info](./maven-info.md)** - Maven build tool useful commands
  - Dependency analysis and security scanning
  - Plugin diagnostics and version management
  - Build plan inspection and optimization
  - License and report generation

---

## ☕ Java & Spring

### Spring Framework
- **[Spring Security in Detail](./spring-security.md)** - Comprehensive Spring Security guide
  - Configure web MVC without Spring Boot auto-configure
  - Security architecture and authentication flow
  - Custom authentication providers and filters
  - UserDetails, AuthenticationManager, and ProviderManager
  - Filter chain configuration and best practices

### Testing
- **[Migration JUnit 4 to JUnit 5](./migration-junit4-to-5.md)** - Complete migration guide
  - JUnit 5 architecture (Platform, Jupiter, Vintage)
  - Annotation changes and Mockito integration
  - Maven Surefire plugin configuration
  - Common migration patterns and tips

### Performance
- **[Memory Efficient Java Code](./java/memory-efficient.md)** - Java memory optimization techniques
  - Object memory footprint and GC tuning
  - Heap size configuration and sweeping methods
  - Avoid memory leaks and best practices
  - Primitive types vs. boxing in Java 8

---

## 🐳 Containerization

### Docker
- **[Docker Commands](./docker.md)** - Essential Docker commands
  - Container management and cleanup
  - Image operations and tagging
  - Volume mounting and environment files
  - Best practices and troubleshooting

- **[Docker Uninstall Script](./docker/docker-uninstall.sh)** - Clean Docker installation removal

---

## ☸️ Orchestration

### Kubernetes
- **[Kubernetes Notes](./kubernetes.md)** - Kubernetes cluster management
  - Multi-node cluster setup
  - Service discovery and DNS configuration
  - Logging with Fluentd and Supervisord
  - kubectl commands and best practices
  - Tutorial and practice resources

### DC/OS
- **[DCOS Local Universe](./dcos-local-universe.md)** - DC/OS local universe setup
  - Repository cloning and Python 3 setup
  - Docker daemon configuration and proxy setup
  - Marathon and package configuration

---

## 🟢 Node.js

- **[Node Installation Guide](./node-install.md)** - Install Node.js using nvm
  - Install Node Version Manager (nvm) via Homebrew
  - List and install specific Node.js versions
  - Manage multiple Node.js installations

### Scripts
- **[Install Node using npm](./node/install-node-using-npm.sh)** - npm-based installation
- **[Install Node using nvm](./node/install-node-using-nvm.sh)** - nvm-based installation

---

## 🖥️ System Administration

### Unix/Linux
- **[Unix Permissions & TCP Commands](./unix-permission-tcp-command.md)** - System administration basics
  - File and directory permissions (rwx)
  - tcpdump packet capture and analysis
  - Network debugging and monitoring
  - Disk usage commands

---

## 🛠️ Development Environment

### Configuration
- **[.zshrc Configuration](./.zshrc)** - Zsh shell configuration
  - Git branch display in terminal prompt
  - Command history optimization
  - jenv for Java version management
  - nvm for Node.js version management
  - fzf integration for fuzzy finding

### Troubleshooting
- **[Dev Setup Issues & Fixes](./dev-setup-issues-fix-notes.md)** - Common development issues
  - Node.js library installation errors
  - Migrate Git SSH to HTTPS
  - Personal access token setup
  - Git fast-forward conflicts

---

## 📜 Scripts & Utilities

### System Scripts
- **[RSS by PID](./script/rss-by-pid.sh)** - Monitor memory usage by process ID
- **[Tar/Untar Scripts](./script/tar-untar-scripts.sh)** - Archive compression utilities

### Grid Computing
- **[Grid Computing Examples](./script/grid/)** - C programs for parallel computing
  - [Rainfall calculation](./script/grid/rainfall.c)
  - [Temperature analysis](./script/grid/tempreature.c)
  - [Grid README](./script/grid/README.md)

---

## 📚 Learning Resources

- **[Blogs & References](./blogs.md)** - Curated technical articles
  - **Distributed Systems**: LinkedIn's Real-Time Presence Platform
  - **Containers**: Docker, containerd, Kata, Firecracker comparison
  - **Virtualization**: Protection rings and architecture
  - **Java**: Zero-copy I/O, Maven multi-module projects
  - **Spring Data**: JPA performance optimization
  - **File Systems**: Red Hat Enterprise Linux filesystem guide

---

## 🖼️ Diagrams & Images

All diagrams and images referenced in the documentation are stored in the [`images/`](./images/) directory:

- Spring Security architecture diagrams
- JUnit 5 architecture visualizations
- Authentication flow charts

See [images/README.md](./images/README.md) for details.

---

## 📝 Usage

### Quick Navigation

```bash
# Clone this repository
git clone <repository-url>
cd docs

# Search for specific topics
grep -r "Spring Security" .
grep -r "Docker" .

# Open specific guide
open spring-security.md
```

### Contributing

When adding new documentation:

1. Place files in appropriate category directories
2. Update this README with links and descriptions
3. Use clear, descriptive filenames
4. Include code examples where applicable
5. Add diagrams to `images/` directory

---

## 🏷️ Categories Overview

| Category | Files | Description |
|----------|-------|-------------|
| **Git** | 2 files | Version control commands and configuration |
| **Maven** | 1 file | Build tool commands and diagnostics |
| **Java/Spring** | 3 files | Framework guides and testing |
| **Docker** | 2 files | Container management |
| **Kubernetes** | 2 files | Orchestration and clustering |
| **Node.js** | 3 files | Installation and version management |
| **Unix** | 1 file | System administration commands |
| **Scripts** | 5 files | Automation utilities |
| **Config** | 2 files | Development environment setup |

---

## 🔍 Quick Reference

### Most Used Commands

**Git:**
```bash
# Clean up local branches
git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
```

**Maven:**
```bash
mvn dependency:tree              # Show dependency hierarchy
mvn dependency:analyze           # Analyze unused dependencies
mvn org.owasp:dependency-check-maven:check  # Security audit
```

**Docker:**
```bash
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")  # Remove untagged images
docker rm $(docker ps -a -q)     # Remove stopped containers
```

**Node.js:**
```bash
nvm list-remote                  # List available versions
nvm install <version>            # Install specific version
nvm use <version>                # Switch Node version
```

---

## 📄 License

This documentation is maintained for personal reference and development use.

---

## 📧 Contact

For questions or contributions, please open an issue or submit a pull request.

---

*Last Updated: 2026-03-18*
