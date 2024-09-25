# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set a home directory for the plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Check if Zinit is already installed, and install it if not.
if [ ! -d "$ZINIT_HOME" ]; then 
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

### Plugin manager
# Activate the plugin manager
source "${ZINIT_HOME}/zinit.zsh"

### Adding plugins
# Add the Powerlevel10K plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add auto completion
zinit light zsh-users/zsh-completions
# Load the auto completions
autoload -U compinit && compinit

# Add fuzzy finder menu for completions
# According to the github page, it must be loaded after compinit and before autosuggestion
# or syntax highlighting
zinit light Aloxaf/fzf-tab

# Add syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add auto suggestions
zinit light zsh-users/zsh-autosuggestions

## History for autosuggestion and the configuration for it
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

### Keybinds 
# Accept autosuggestions with CTRL+f
bindkey '^f' autosuggest-accept

### Shell integration
# Fuzzy finder
eval "$(fzf --zsh)"
# Zoxide 
eval "$(zoxide init --cmd cd zsh)"
# Thefuck
eval "$(thefuck --alias fuck)"

### Exports
# Set default editor as nvim
export EDITOR=nvim
export QT_QPA_PLATFORM=wayland

### Aliases
alias cat='bat'
alias ls='exa -a --icons' 
alias fzf='fzf -m --preview="bat --color=always {}"'
alias fzfnvim='nvim $(fzf -m --preview="bat --color=always {}")'
alias llm='~/.gobeyn-arch/llm_runner.sh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
