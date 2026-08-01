# Created by newuser for 5.9.2
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# ==============================================================================
# 1. SYSTEM ENVIRONMENT & PATHS
# ==============================================================================
# Set your default text editor for git and terminal commands
export EDITOR='nano'

# Append common development binary paths to your system PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Ensure native language fallback support
export LANG=en_US.UTF-8

# ==============================================================================
# 2. PERSISTENT HISTORY SETTINGS
# ==============================================================================
# Define where command history logs are physically saved
HISTFILE=~/.zhistory

# Number of historical commands kept in active memory
HISTSIZE=10000

# Maximum number of commands written to the history file
SAVEHIST=30000

# Instantly write commands to history instead of waiting for shell exit
setopt INC_APPEND_HISTORY

# Do not log a command if it matches the immediately preceding one
setopt HIST_IGNORE_DUPS

# Remove extra blank spaces from commands before saving them
setopt HIST_REDUCE_BLANKS

# Do not record lines starting with a space (useful for hiding secrets)
setopt HIST_IGNORE_SPACE

# ==============================================================================
# 3. INTERACTIVE SHELL OPTIMIZATION
# ==============================================================================
# Initialize the built-in advanced tab-completion system
autoload -Uz compinit && compinit

# Enable case-insensitive and partial tab-completion matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Automatically change directories by just typing the folder path
setopt AUTO_CD

# ==============================================================================
# 4. CUSTOM TERMINAL PROMPT (VISUAL THEME)
# ==============================================================================
# Configures a clean, informative, dual-color prompt: [directory] ❯
# %F{cyan}%~%f display current directory relative to home (~).
# %F{green}❯%f displays a clean prompt symbol.
PROMPT='%F{cyan}%~%f %F{green}❯%f '

# ==============================================================================
# 5. TIME-SAVING ALIASES (SHORTCUTS)
# ==============================================================================
# File navigation shortcuts
alias ls='ls -G --color=auto' # Force colored listing output (macOS/Linux)
alias ll='ls -lh'             # Long-format list with human-readable file sizes
alias la='ls -A'              # List all files including hidden dotfiles
alias ..='cd ..'              # Quick directory jump upward
alias ...='cd ../..'          # Jump up two directory levels

alias ff='fastfetch' 	      # Open fastfetch

# Productivity shortcuts
alias c='clear'               # Fast terminal screen wipe
alias zconfig='nano ~/.zshrc'  # Instant shortcut to edit this config file
alias zreload='source ~/.zshrc' # Instant shortcut to reload configuration changes

# Git safety and quick shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

