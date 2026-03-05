# ~/.bashrc — Git Bash config (OMArchy-inspired)
# Place at: %USERPROFILE%\.bashrc
# Git Bash loads this automatically on startup

# ── Starship (prompt) ────────────────────────────────────────────────
eval "$(starship init bash)"

# ── Modern CLI tools (installed via winget) ──────────────────────────
# bat → better cat
alias cat='bat --paging=never'

# eza → better ls
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'

# ripgrep → better grep
alias grep='rg'

# fd → better find
alias find='fd'

# ── Zoxide (smart cd) ────────────────────────────────────────────────
eval "$(zoxide init bash)"
# Usage: z <partial-path> → jumps to most used matching dir

# ── fzf (fuzzy finder) ───────────────────────────────────────────────
eval "$(fzf --bash)"
# Ctrl+R = fuzzy history search
# Ctrl+T = fuzzy file search
# Alt+C  = fuzzy cd into directory

# ── Navigation shortcuts ─────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ── Utility aliases ──────────────────────────────────────────────────
alias c='clear'
alias h='history'
alias q='exit'
alias mk='mkdir -p'

# Quick dir creation + cd
mkcd() { mkdir -p "$1" && cd "$1"; }

# ── Git shortcuts ────────────────────────────────────────────────────
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias gco='git checkout'

# ── Git delta (better diff) ──────────────────────────────────────────
# Add to ~/.gitconfig:
#   [core]
#     pager = delta
#   [interactive]
#     diffFilter = delta --color-only
#   [delta]
#     navigate = true
#     dark = true
#     side-by-side = true

# ── Windows-specific helpers ─────────────────────────────────────────
# Open file/folder in Explorer
alias open='explorer.exe'

# Open VS Code (if installed)
alias code='code.exe'

# Clipboard (works in Git Bash)
alias pbcopy='clip.exe'
alias pbpaste='powershell.exe Get-Clipboard'

# ── SSH agent auto-start ─────────────────────────────────────────────
env=~/.ssh/agent.env
agent_load_env() { test -f "$env" && . "$env" >| /dev/null; }
agent_start() {
    (umask 077; ssh-agent > "$env")
    . "$env" >| /dev/null
}
agent_load_env
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
    agent_start
    ssh-add 2>/dev/null
elif [ "$SSH_AUTH_SOCK" ] && [ "$agent_run_state" = 1 ]; then
    ssh-add 2>/dev/null
fi
unset env

# ── Clean startup ────────────────────────────────────────────────────
clear
