# Git Documentation

Version control guides and configurations.

## 📖 Contents

### [Git Cheat Sheet](../git-cheat-sheet.md)
Essential Git commands and workflows:
- **Branch Cleanup**: Automatically delete merged/stale local branches
- **Log Decoration**: Colorize and format git logs
- **Terminal Prompt**: Display current branch in shell prompt

**Quick Commands:**
```bash
# Clean up merged branches
git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done

# Decorated git log
git log --all --decorate --oneline --graph
```

---

### [Git Local Exclude Setup Guide](../git-local-exclude-setup.md)
Configure personal file exclusions without modifying `.gitignore`:
- **Local Exclusions**: Use `.git/info/exclude` for personal patterns
- **Pattern Syntax**: Same as `.gitignore` but not tracked
- **Use Cases**: IDE configs, personal notes, temporary files

**Quick Setup:**
```bash
# Add patterns to local exclude
cat >> .git/info/exclude << 'EOF'
# Personal exclusions
.idea/
.vscode/
*.swp
.DS_Store
EOF

# Verify
git check-ignore -v .idea/
```

---

## 🔗 Related Documents

- [Dev Setup Issues & Fixes](../dev-setup-issues-fix-notes.md) - Git SSH to HTTPS migration
- [.zshrc Configuration](../.zshrc) - Git branch in terminal prompt

---

## 💡 Best Practices

1. **Use `.git/info/exclude` for personal files**
   - IDE configurations
   - Personal notes and TODO files
   - Local development tools

2. **Use `.gitignore` for project-wide patterns**
   - Build artifacts
   - Dependencies (node_modules, target/)
   - Environment files (.env)

3. **Use global `.gitignore` for system files**
   - OS-specific files (.DS_Store, Thumbs.db)
   - Editor swap files (*.swp, *~)

---

*Part of [Technical Documentation Repository](../README.md)*
