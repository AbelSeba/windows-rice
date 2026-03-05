# ~/.bashrc — MSYS2 config (OMArchy-inspired)
# Place at: C:/msys64/home/<user>/.bashrc
# Also symlink to %USERPROFILE%\.bashrc for consistency

# ── Starship (prompt) ────────────────────────────────────────────────
eval "$(starship init bash)"

# ── Modern CLI tools ─────────────────────────────────────────────────
alias cat='bat --paging=never'
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'
alias grep='rg'

# ── Zoxide (smart cd) ────────────────────────────────────────────────
eval "$(zoxide init bash)"

# ── fzf (fuzzy finder) ───────────────────────────────────────────────
eval "$(fzf --bash)"

# ── Navigation ───────────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias q='exit'
alias mk='mkdir -p'
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

# ── Windows helpers ──────────────────────────────────────────────────
alias open='explorer.exe'
alias pbcopy='clip.exe'
alias pbpaste='powershell.exe -c Get-Clipboard'

# ── SSH agent ────────────────────────────────────────────────────────
export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"

ssh_agent_start() {
    # Kill stale socket
    rm -f "$SSH_AUTH_SOCK"
    eval $(ssh-agent -a "$SSH_AUTH_SOCK") > /dev/null
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
}

# Check if agent is alive
if ! ssh-add -l &>/dev/null; then
    ssh_agent_start
fi

# ── PATH: add Windows tools via Scoop ────────────────────────────────
export PATH="$HOME/scoop/shims:$PATH"
# Add Windows user bin if needed
export PATH="/c/Users/$(whoami)/AppData/Local/Programs/oh-my-posh/bin:$PATH"

# ── Clean startup ────────────────────────────────────────────────────
clear
