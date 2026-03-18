# Build Tools Documentation

Build automation and dependency management guides.

## 📖 Contents

### [Maven Info](../maven-info.md)
Maven build tool commands and best practices:

#### 🔍 Diagnostics
```bash
# Plugin version updates
mvn version:display-plugin-updates

# Dependency analysis
mvn dependency:tree
mvn dependency:analyze
```

#### 🔒 Security Analysis
```bash
# OWASP dependency check
mvn org.owasp:dependency-check-maven:check
```
**Note:** Register with vulnerability database for API key to speed up checks.

#### 📊 Reports
```bash
# Dependency report
mvn project-info-reports:dependencies

# License report
mvn license:third-party-report
```

#### ⚡ Performance
```bash
# Use mvnd (Maven Daemon) for faster builds
mvnd clean install
```

#### 📝 Build Phases
- **Test Phase**: JUnit tests executed
- **Verify Phase**: Integration tests executed

---

## 🔗 Related Documents

- [Migration JUnit 4 to 5](../migration-junit4-to-5.md) - Maven Surefire configuration
- [Dev Setup Issues](../dev-setup-issues-fix-notes.md) - Maven super POM and optional dependencies

---

## 💡 Best Practices

1. **Use Maven Extension**
   ```bash
   # View build plan
   mvn buildplan:list-phase
   ```

2. **Dependency Management**
   - Use `dependency:analyze` to find unused dependencies
   - Mark optional dependencies for flexible implementation
   - Regularly update plugins with `version:display-plugin-updates`

3. **Security**
   - Run OWASP checks in CI/CD pipeline
   - Register for vulnerability database API key
   - Review dependency reports before releases

4. **Performance**
   - Use `mvnd` for faster local builds
   - Skip tests for quick builds: `mvn clean package -DskipTests`
   - Leverage build cache with Tycho (for Eclipse plugins)

---

## 📚 Additional Resources

- [Maven Documentation](https://maven.apache.org/guides/)
- [Maven Central Repository](https://mvnrepository.com/)
- [OWASP Dependency Check](https://owasp.org/www-project-dependency-check/)

---

*Part of [Technical Documentation Repository](../README.md)*
