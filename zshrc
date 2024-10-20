# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Bat
export NULLCMD=bat
export DOTFILES="$HOME/.dotfiles"

# Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  zsh-nvm
  alias-finder
  colored-man-pages
  git
  macos
  web-search
  z
  # zsh-autocomplete
)

# Setup Brew shell completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# oh-my-zsh source
source $ZSH/oh-my-zsh.sh

# Syntax highlighting (installed via brew)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestions (installed via brew)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source  ~/.p10k.zsh

# NVM
export NVM_DIR="$HOME/.nvm"

# Automatically switch node versions in directories with .nvmrc files
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source /Users/chris/.docker/init-zsh.sh || true # Added by Docker Desktop

# Pythong
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
eval "$(rbenv init -)"

# Aliases
source ~/.dotfiles/aliases

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k.zsh.
[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
