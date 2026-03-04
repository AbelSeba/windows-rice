# ===================================================================
# Windows Rice Installer — OMArchy-like Setup
# Run in PowerShell as Administrator
# ===================================================================

Write-Host "Installing OMArchy-like Windows Rice..." -ForegroundColor Cyan
Write-Host ""

# -- Core apps ----------------------------------------------------
Write-Host "Installing core apps..." -ForegroundColor Yellow

# Git (includes Git Bash)
winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements

# Tiling window manager
winget install --id glzr-io.glazewm -e

# Status bar
winget install --id amnweb.yasb -e

# Terminal prompt
winget install --id JanDeDobbeleer.OhMyPosh -e

# App launcher (Rofi-like)
winget install --id Flow-Launcher.Flow-Launcher -e

Write-Host ""
Write-Host "Installing modern CLI tools..." -ForegroundColor Yellow

# Modern replacements
winget install --id junegunn.fzf -e              # fuzzy finder
winget install --id ajeetdsouza.zoxide -e        # smart cd
winget install --id sharkdp.bat -e               # better cat
winget install --id eza-community.eza -e         # better ls
winget install --id BurntSushi.ripgrep.MSVC -e   # better grep
winget install --id sharkdp.fd -e                # better find
winget install --id dandavison.delta -e          # better git diff

Write-Host ""
Write-Host "Installing Nerd Font..." -ForegroundColor Yellow
oh-my-posh font install Meslo

Write-Host ""
Write-Host "Copying config files..." -ForegroundColor Yellow

# GlazeWM config
$glazeDir = "$env:USERPROFILE\.glzr\glazewm"
New-Item -ItemType Directory -Force -Path $glazeDir | Out-Null
Copy-Item "glazewm-config.yaml" "$glazeDir\config.yaml" -Force
Write-Host "  [OK] GlazeWM config -> $glazeDir\config.yaml"

# Bashrc
Copy-Item "bashrc" "$env:USERPROFILE\.bashrc" -Force
Write-Host "  [OK] .bashrc -> $env:USERPROFILE\.bashrc"

# Git config (delta integration)
$gitconfigDest = "$env:USERPROFILE\.gitconfig"
if (Test-Path $gitconfigDest) {
    Write-Host "  [WARN] .gitconfig already exists - merge gitconfig manually" -ForegroundColor Yellow
} else {
    Copy-Item "gitconfig" $gitconfigDest -Force
    Write-Host "  [OK] .gitconfig -> $gitconfigDest"
}

Write-Host ""
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Manual steps remaining:" -ForegroundColor Yellow
Write-Host "  1. Open Windows Terminal -> Settings -> Open JSON file"
Write-Host "     Merge windows-terminal-settings.jsonc"
Write-Host "     Set Git Bash as default profile"
Write-Host "     Set font to 'MesloLGM Nerd Font'"
Write-Host ""
Write-Host "  2. Right-click taskbar -> Taskbar settings"
Write-Host "     Enable 'Automatically hide the taskbar'"
Write-Host ""
Write-Host "  3. Launch GlazeWM (Win+R -> glazewm)"
Write-Host "     Launch Yasb"
Write-Host "     Launch Flow Launcher -> set hotkey to Alt+Space"
Write-Host ""
Write-Host "  4. Reopen terminal to see the new prompt"
Write-Host "===========================================================" -ForegroundColor Cyan
