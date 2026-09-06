# Claude Code Cheat Sheet

## KEYBOARD SHORTCUTS

### GENERAL CONTROLS

* **`Ctrl C`** : Cancel input/generation
* **`Ctrl D`** : Exit session
* **`Ctrl L`** : Redraw screen
* **`Ctrl O`** : Toggle verbose/transcript
* **`Ctrl R`** : Reverse search history
* **`Ctrl G`** : Open prompt in editor
* **`Ctrl X E`** : Open in editor (alias)
* **`Ctrl B`** : Background running task
* **`Ctrl T`** : Toggle task list
* **`Ctrl V`** : Paste image chip
* **`Ctrl X K`** : Kill background agents
* **`Esc Esc`** : Rewind or summarize

### MODE SWITCHING

* **`Shift Tab`** : Cycle permission modes / Normal > Auto-Accept > Plan
* **`Alt P`** : Switch model
* **`Alt T`** : Toggle thinking on / off
* **`Alt O`** : Toggle fast mode

### INPUT & PREFIXES

* **`\Enter` / `Ctrl J**` : Newline
* **`/`** : Slash command
* **`!`** : Direct bash
* **`@`** : File mention + autocomplete

### SESSION PICKER

* **`Up` / `Down**` : Navigate sessions
* **`Left` / `Right**` : Expand / collapse

### TRANSCRIPT MODE (`CTRL+O`)

* **`Ctrl E`** : Toggle show all
* **`Q` / `Esc**` : Exit transcript

---

## PLAN MODE

* **`Shift Tab`** : Normal > Auto-Accept > Plan
* **`--permission-mode plan`** : Start in plan mode

## THINKING & EFFORT

* **`Alt T`** : Toggle thinking on / off
* **`"ultrathink"`** : Max effort for current turn
* **`Ctrl O`** : See thinking in verbose mode
* **`/effort low / medium / high / max / auto`** : Set thinking effort level

## CONTEXT MANAGEMENT

* **`/context`** : Usage + optimization tips / Visualize context grid
* **`/compact [focus]`** : Compress context with focus
* **`Auto-compact`** : Fires at ~95% capacity
* **`1M context`** : Opus 4.6 (Max / Team / Ent)
* **`CLAUDE.md`** : Survives compaction!

## GIT WORKTREES

* **`--worktree name`** : Isolated branch per feature
* **`isolation: worktree`** : Agent in own worktree
* **`sparsePaths`** : Checkout only needed dirs
* **`/batch`** : Auto-creates worktrees

## SESSION POWER MOVES

* **`claude -c`** : Continue last conversation
* **`claude -r "name"`** : Resume by name
* **`/btw question`** : Side Q, no context cost

## VOICE MODE

* **`/voice`** : Enable push-to-talk
* **`Space (hold)`** : Record, release to send (20 languages: EN, ES, FR, DE, CZ, PL...)

## SDK / HEADLESS

* **`claude -p [query]`** : Non-interactive query
* **`--output-format`** : Structured output
* **`--max-budget-usd 5`** : Cost cap
* **`cat file | claude -p`** : Pipe input

## SCHEDULING & REMOTE

* **`/loop 5m msg`** : Recurring task
* **`/rc`** : Remote control bridge
* **`--remote`** : Web session on claude.ai
* **`AUTO MODE DENIED`** : Action requires confirmation

---

## SLASH COMMANDS

### SESSION

* **`/clear`** : Clear conversation
* **`/compact [focus]`** : Compact context
* **`/resume`** : Resume / switch session
* **`/rename [name]`** : Name current session
* **`/branch [name]`** : Branch conversation
* **`/cost`** : Token usage + cache breakdown
* **`/context`** : Visualize context grid
* **`/diff`** : Interactive diff viewer
* **`/copy [N]`** : Copy last (or Nth) response
* **`/rewind`** : Rewind / code checkpoint
* **`/export`** : Export conversation

### CONFIG

* **`/config`** : Open settings
* **`/model [model]`** : Switch model
* **`/fast [on|off]`** : Toggle fast mode
* **`/theme`** : Change color theme
* **`/permissions`** : View / update permissions
* **`/effort [level]`** : low / med / high / max / auto
* **`/keybindings`** : Customize shortcuts
* **`/terminal-setup`** : Configure terminal

### TOOLS

* **`/init`** : Create `CLAUDE.md`
* **`/memory`** : Edit `CLAUDE.md` files
* **`/mcp`** : Manage MCP servers
* **`/hooks`** : Manage hooks
* **`/skills`** : List available skills
* **`/agents`** : Manage agents
* **`/chrome`** : Chrome integration
* **`/add-dir <path>`** : Add working directory

### SPECIAL

* **`/powerup`** : Interactive feature tour
* **`/btw <q>`** : Side question
* **`/plan [desc]`** : Plan mode + auto-start
* **`/loop [interval]`** : Schedule recurring task
* **`/voice`** : Push-to-talk (20 langs)
* **`/doctor`** : Diagnose installation
* **`/remote-control`** : Bridge to claude.ai/code
* **`/usage`** : Plan limits and rate status
* **`/schedule`** : Cloud scheduled tasks
* **`/feedback`** : Submit feedback (alias: `/bug`)

---

## MCP SERVERS

### ADD SERVERS

* **`--transport http`** : Remote HTTP (recommended)
* **`--transport stdio`** : Local process
* **`--transport sse`** : Remote SSE

### SCOPES

* **`Local`** : `~/.claude.json` (you only)
* **`Project`** : `.mcp.json` (shared / VCS)
* **`User`** : `~/.claude.json` (global)

### MANAGE

* **`/mcp`** : Interactive UI
* **`claude mcp list`** : List all servers
* **`claude mcp serve`** : Run Claude Code as MCP server
* **`maxResultSizeChars`** : Up to 500K via `_meta` override

---

## MEMORY & FILES

### CLAUDE.MD LOCATIONS

* **`./CLAUDE.md`** : Project (team-shared)
* **`~/.claude/CLAUDE.md`** : Personal (all projects)
* **`/etc/claude-code/`** : Managed (org-wide)

### RULES & IMPORT

* **`.claude/rules/*.md`** : Project rules
* **`~/.claude/rules/*.md`** : User rules
* **`paths:` frontmatter** : Path-specific rules
* **`@path/to/file`** : Import into `CLAUDE.md`

### AUTO MEMORY

* **`~/.claude/projects/*/memory/`** : `MEMORY.md` + topic files, auto-loaded (Max: 25KB / 200 lines per file)

---

## PERMISSION MODES

* **`default`** : Prompts for every action
* **`acceptEdits`** : Auto-accept file edits
* **`plan`** : Read-only, no writes
* **`dontAsk`** : Deny unless explicitly allowed
* **`bypassPermission`** : Bypass permission checks
* **`--dangerously-skip-permissions`** : CLI flag to skip all prompts

---

## SKILLS & AGENTS

### BUILT-IN SKILLS

* **`/simplify`** : Code review (3 parallel agents)
* **`/batch`** : Parallel changes (5-30 worktrees)
* **`/debug [desc]`** : Troubleshoot from debug log
* **`/loop [interval]`** : Recurring scheduled task
* **`/claude-api`** : Load API + SDK reference

### CUSTOM SKILL LOCATIONS

* **`.claude/skills/<n>/`** : Project skills
* **`~/.claude/skills/<n>/`** : Personal skills

### SKILL FRONTMATTER

* **`description`** : Auto-invocation trigger
* **`allowed-tools`** : Skip permission prompts
* **`model`** : Override model for skill
* **`effort`** : Override effort level
* **`paths: [globs]`** : Path-specific (YAML list)
* **`context: fork`** : Run in subagent
* **`$ARGUMENTS`** : User input placeholder
* **`${CLAUDE_SKILL_DIR}`** : Skill's own directory
* **`!'cmd'`** : Dynamic context injection
* **`plugin bin/`** : Ship executables for Bash tool

### BUILT-IN AGENTS

* **`Explore`** : Fast read-only (Haiku)
* **`Plan`** : Research for plan mode
* **`General`** : Full tools, complex tasks
* **`Bash`** : Terminal separate context

### AGENT FRONTMATTER

* **`permissionMode`** : `default` / `acceptEdits` / `plan` / `dontAsk`
* **`isolation:`** `worktree`
* **`memory:`** `user` | `project`
* **`background: true`** : Background task
* **`maxTurns`** : Limit agentic turns
* **`initialPrompt`** : Auto-submit first turn
* **`SendMessage`** : Resume agents (replaces resume)
* **`@agent-name`** : Mention named subagents
