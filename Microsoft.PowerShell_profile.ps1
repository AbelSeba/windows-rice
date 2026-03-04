# PowerShell Profile — OMArchy-inspired terminal
# Place at: %USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# (Run `notepad $PROFILE` to find/create the right path)

# ── Oh My Posh (prompt theme) ────────────────────────────────────────
# Choose your theme: catppuccin_mocha, gruvbox, tokyo, nordtron, etc.
# Preview all: Get-PoshThemes
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin_mocha.omp.json" | Invoke-Expression

# ── Aliases (Linux-like) ─────────────────────────────────────────────
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vim -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name grep -Value Select-String
Set-Alias -Name which -Value Get-Command
Set-Alias -Name touch -Value New-Item

# ── Functions (Linux muscle memory) ──────────────────────────────────
function mkcd { param($dir) mkdir -Force $dir; Set-Location $dir }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function la { Get-ChildItem -Force @args }

# ── PSReadLine (better shell UX) ─────────────────────────────────────
if (Get-Module -ListAvailable -Name PSReadLine) {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

# ── Clear startup noise ──────────────────────────────────────────────
Clear-Host
