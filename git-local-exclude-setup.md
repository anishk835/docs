# Git Local Exclude Setup Guide

This document explains how to exclude files from Git tracking without modifying `.gitignore`, using Git's local exclude configuration.

## Overview

Git provides a **local exclude file** at `.git/info/exclude` that works exactly like `.gitignore` but:
- ✅ **Not tracked by Git** - won't appear in commits
- ✅ **Local to your repository** - other developers unaffected
- ✅ **Applies to all branches** - current and future branches
- ✅ **No changes to .gitignore** - keeps the tracked `.gitignore` clean

## When to Use Local Exclude

Use `.git/info/exclude` when you want to ignore files that are:
- **Personal/local** - Development tools, IDE configs, personal notes
- **Not relevant to others** - Documentation you're writing locally
- **Temporary** - Files you don't want to commit but need locally

**Do NOT use** for files that should be ignored by all developers (use `.gitignore` instead).

---

## Setup Instructions

### Step 1: Edit the Local Exclude File

Open the exclude file in your editor:

```bash
# Using your preferred editor
nano .git/info/exclude
# or
vim .git/info/exclude
# or
code .git/info/exclude
```

### Step 2: Add Your Exclusion Patterns

Add patterns at the end of the file using the same syntax as `.gitignore`:

```bash
# Ignore all CLAUDE.md files (local repository exclusion)
**/CLAUDE.md
CLAUDE.md

# Ignore .claude directories (local repository exclusion)
.claude/
**/.claude/

# Ignore .java-version file (local repository exclusion)
.java-version
```

### Step 3: Verify the Configuration

Check that Git is ignoring the files:

```bash
# Test specific files/directories
git check-ignore -v CLAUDE.md
git check-ignore -v .claude/
git check-ignore -v .java-version

# Check git status
git status
```

---

## Common Patterns

### Ignore Specific Files

```bash
# Single file in root
.java-version

# Single file in specific directory
docs/personal-notes.md
```

### Ignore All Files with Specific Name

```bash
# All CLAUDE.md files in any directory
**/CLAUDE.md
CLAUDE.md
```

### Ignore Directories

```bash
# Directory in root
.claude/

# All directories with this name
**/.claude/
```

### Ignore File Types

```bash
# All log files
*.log

# All temporary files
*.tmp
*~
```

---

## Example Configuration

Here's the complete `.git/info/exclude` configuration used in this repository:

```bash
# git ls-files --others --exclude-from=.git/info/exclude
# Lines that start with '#' are comments.
# For a project mostly in C, the following would be a good set of
# exclude patterns (uncomment them if you want to use them):
# *.[oa]
# *~

# Ignore all CLAUDE.md files (local repository exclusion)
**/CLAUDE.md
CLAUDE.md

# Ignore .claude directories (local repository exclusion)
.claude/
**/.claude/

# Ignore .java-version file (local repository exclusion)
.java-version
```

---

## Quick Setup Script

You can also add exclusions using the command line:

```bash
# Add single pattern
echo ".java-version" >> .git/info/exclude

# Add multiple patterns
cat >> .git/info/exclude << 'EOF'

# Ignore all CLAUDE.md files (local repository exclusion)
**/CLAUDE.md
CLAUDE.md

# Ignore .claude directories (local repository exclusion)
.claude/
**/.claude/

# Ignore .java-version file (local repository exclusion)
.java-version
EOF
```

---

## Verification Commands

### Check If File Is Ignored

```bash
# Check specific file
git check-ignore -v CLAUDE.md

# Output example:
# .git/info/exclude:10:CLAUDE.md    CLAUDE.md
```

### View Current Exclude Configuration

```bash
cat .git/info/exclude
```

### Check Git Status

```bash
git status
# The excluded files should not appear in untracked files
```

---

## Pattern Syntax

The exclude file uses the same pattern matching as `.gitignore`:

| Pattern | Matches |
|---------|---------|
| `file.txt` | `file.txt` in root directory |
| `*.log` | All files ending with `.log` in root |
| `**/*.log` | All `.log` files in any directory |
| `dir/` | Directory named `dir` in root |
| `**/dir/` | All directories named `dir` |
| `!important.log` | Negation - don't ignore this file |

---

## Troubleshooting

### Files Still Showing in Git Status

**Problem**: Added patterns to exclude but files still appear in `git status`

**Solution**: The file might already be tracked by Git. Use:
```bash
# Check if file is tracked
git ls-files | grep filename

# If tracked, you need to untrack it first
git rm --cached filename
git commit -m "Untrack filename"
```

### Pattern Not Working

**Problem**: Pattern doesn't match the files you want to ignore

**Solution**: Test your pattern:
```bash
# Test if pattern matches
git check-ignore -v path/to/file

# If no output, pattern doesn't match - adjust the pattern
```

### Want to Apply to All Developers

**Problem**: Need all team members to ignore certain files

**Solution**: Don't use `.git/info/exclude`. Instead, add patterns to `.gitignore`:
```bash
echo "pattern" >> .gitignore
git add .gitignore
git commit -m "Add pattern to gitignore"
```

---

## Benefits of Local Exclude

### ✅ Advantages

1. **No Git History Pollution** - Doesn't clutter commit history
2. **Personal Workflow** - Each developer can ignore different files
3. **No Merge Conflicts** - Never conflicts with others' changes
4. **Branch Independent** - Works across all branches automatically
5. **Quick Setup** - No need for pull requests or approvals

### ❌ Limitations

1. **Not Shared** - Other developers won't have your exclusions
2. **Manual Setup** - Each developer must configure separately
3. **Repository Specific** - Must configure per repository
4. **Not Versioned** - Can't track changes or revert

---

## Alternative: Global Gitignore

For patterns you want to ignore **across all repositories**, use global gitignore:

```bash
# Create global gitignore file
touch ~/.gitignore_global

# Configure Git to use it
git config --global core.excludesfile ~/.gitignore_global

# Add patterns
cat >> ~/.gitignore_global << 'EOF'
# IDE files
.idea/
.vscode/
*.swp

# OS files
.DS_Store
Thumbs.db
EOF
```

---

## Summary

| Feature | `.git/info/exclude` | `.gitignore` | Global `.gitignore` |
|---------|-------------------|--------------|-------------------|
| **Scope** | Local repo | Entire project | All repos |
| **Tracked** | No | Yes | No |
| **Shared** | No | Yes | No |
| **Use Case** | Personal files | Project standards | IDE/OS files |

---

## References

- [Git Documentation - gitignore](https://git-scm.com/docs/gitignore)
- [Git Documentation - git-config](https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreexcludesFile)
- [Pro Git Book - Ignoring Files](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_ignoring)

---

*Last Updated: 2026-03-11*
*Repository: specmgmt*
