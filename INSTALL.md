# 🪟 Windows Rice — OMArchy-like Setup

PC boulot Windows → Hyprland feel.

## Stack final

| Composant | Outil | Équivalent OMArchy |
|-----------|-------|--------------------|
| Tiling WM | GlazeWM | Hyprland |
| Status bar | Yasb | Waybar |
| Terminal | Windows Terminal + Git Bash | Kitty + Bash |
| Prompt | Oh My Posh (Catppuccin Mocha) | Starship/OMP |
| Launcher | Flow Launcher | Rofi |
| Font | MesloLGM Nerd Font | Nerd Font |
| `cat` | bat | bat |
| `ls` | eza | eza |
| `grep` | ripgrep | ripgrep |
| `find` | fd | fd |
| `cd` | zoxide | zoxide |
| fuzzy | fzf | fzf |
| git diff | delta | delta |

## Installation rapide

### Option 1 : Script automatique
```powershell
# Ouvrir PowerShell en admin, se placer dans le dossier des configs
cd <dossier-avec-les-fichiers>
Set-ExecutionPolicy Bypass -Scope Process -Force
.\install.ps1
```

### Option 2 : Manuel
```powershell
# Core
winget install Git.Git
winget install glzr-io.glazewm
winget install amnweb.yasb
winget install JanDeDobbeleer.OhMyPosh
winget install Flow-Launcher.Flow-Launcher

# CLI tools
winget install junegunn.fzf
winget install ajeetdsouza.zoxide
winget install sharkdp.bat
winget install eza-community.eza
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
winget install dandavison.delta

# Font
oh-my-posh font install Meslo
```

## Fichiers config — où les mettre

| Fichier | Destination |
|---------|-------------|
| `glazewm-config.yaml` | `%USERPROFILE%\.glzr\glazewm\config.yaml` |
| `bashrc` | `%USERPROFILE%\.bashrc` |
| `gitconfig` | `%USERPROFILE%\.gitconfig` (merge si existe déjà) |
| `windows-terminal-settings.jsonc` | Merge dans WT → Settings → Open JSON |

## Post-install (manuel)

### 1. Windows Terminal
- Settings → **Add new profile** → Git Bash :
  - Command line : `C:\Program Files\Git\bin\bash.exe --login -i`
  - Starting directory : `%USERPROFILE%`
- Settings → **Default profile** → Git Bash
- Settings → Appearance → Font : **MesloLGM Nerd Font**
- Ou merge le JSON de `windows-terminal-settings.jsonc`

### 2. Cacher la taskbar
- Clic droit taskbar → Taskbar settings → **Auto-hide** ON
- Yasb la remplace

### 3. GlazeWM
- Lancer GlazeWM (il démarre Yasb automatiquement via la config)
- Pour lancer au boot : `Win+R` → `shell:startup` → créer shortcut vers `glazewm.exe`

### 4. Flow Launcher
- Premier lancement → Settings → Hotkey → **Alt + Space**
- Theme → choisir dark

### 5. Git Bash + outils
- Rouvrir le terminal → le prompt Catppuccin devrait apparaître
- Tester : `bat --version`, `eza --version`, `rg --version`, `fzf --version`

## Keybinds (Win = touche Windows)

### Tiling (GlazeWM)
| Raccourci | Action |
|-----------|--------|
| `Win + Arrow` | Focus direction |
| `Win + Shift + Arrow` | Move window |
| `Win + 1-9` | Switch workspace |
| `Win + Shift + 1-9` | Move to workspace |
| `Win + Tab` | Next workspace |
| `Win + Shift + Tab` | Prev workspace |
| `Win + W` | Close window |
| `Win + T` | Toggle float/tile |
| `Win + F` | Fullscreen |
| `Win + V` | Toggle split direction |
| `Win + M` | Minimize |
| `Win + =/−` | Resize width |
| `Win + Shift + =/−` | Resize height |
| `Win + R` | Resize mode (arrows, Esc to exit) |
| `Win + Enter` | Terminal |
| `Win + Shift + Enter` | Browser |
| `Win + Shift + R` | Reload config |
| `Win + Shift + P` | Pause/unpause WM |

### Terminal (Git Bash)
| Raccourci | Action |
|-----------|--------|
| `Ctrl + R` | Fuzzy history (fzf) |
| `Ctrl + T` | Fuzzy file search (fzf) |
| `Alt + C` | Fuzzy cd (fzf) |
| `z <mot>` | Smart cd (zoxide) |

### Launcher
| Raccourci | Action |
|-----------|--------|
| `Alt + Space` | Flow Launcher (Rofi-like) |
