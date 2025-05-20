# --- Powerlevel10k Instant Prompt ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh Core ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="$HOME/go/bin:$PATH"

plugins=(
  git
  z
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# --- zoxide Init ---
eval "$(zoxide init zsh)"

# --- Environment Variables ---
export EDITOR="nvim"
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$HOME/go/bin:$PATH"

# --- Aliases ---

# File & Navigation (using eza and bat for better ls and cat)
alias ls='eza --git --group-directories-first --icons'
alias l='ls'
alias ll='eza -alF --git --icons'
alias la='eza -a --icons'
alias lt='eza -T --icons'
alias ltl='eza -TL --icons'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cat='bat'

# Essentials
alias o='open .'
alias bc='brew update && brew upgrade && brew autoremove && brew cleanup && brew doctor && echo "Homebrew maintenance complete."'

# Git shortcuts
alias ga='git add .'
alias gc='git commit -m'
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gcl='git clone'
alias gp='git push'
alias gpl='git pull'

# Docker
alias d='docker'
alias dps='docker ps'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcud='docker compose up -d'

# Node / pnpm
alias p='pnpm'
alias pi='pnpm install'
alias pa='pnpm add'
alias pr='pnpm run'
alias pd='pnpm dev'
alias pb='pnpm build'

# System & Misc
alias c='clear'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'

# Vim
alias vi="nvim"
alias vim="nvim"
alias code="nvim"

# Quick edit and reload config
alias src='source ~/.zshrc && echo ".zshrc reloaded"'

# Clipboard (macOS)
alias pbcopy='pbcopy'
alias pbpaste='pbpaste'

# Network & Ports
alias ports='lsof -i -P | grep LISTEN'

# Alias to attach to 'main' session or create it if it doesn't exist
alias ta='tmux attach -t main || tmux new -s main'

# Kill process on port
killport() {
  if [[ -z $1 ]]; then
    echo "Usage: killport <port>"
    return 1
  fi
  sudo lsof -t -i:$1 | xargs kill -9
}

# Extract archives (auto detects)
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Aliases for quick tmux usage
alias t='tmux'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tk='tmux kill-session -t'
alias tls='tmux ls'

# Enable correct tab completion with fzf and autosuggestions
# Load fzf completion and key bindings if installed
if type fzf >/dev/null 2>&1; then
  source $(brew --prefix)/opt/fzf/shell/completion.zsh
  source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
