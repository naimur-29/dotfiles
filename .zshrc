# This loads the Oh My Zsh framework. Must be at the top!
export ZSH="$HOME/.oh-my-zsh"

# Set a reliable theme. You can change this later.
# Remember: 'agnoster' requires a Powerline-compatible font!
ZSH_THEME="bureau"

# List of plugins to load. These must be installed separately (you did this).
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# -------------------- CUSTOM ALIASES AND FUNCTIONS --------------------

# Check if exa is installed before setting aliases
if command -v eza &> /dev/null; then
    # exa aliases
    alias ls='eza --icons'               # Basic list with file icons
    alias ll='eza -lga --git --icons'    # Long, detailed list with icons and Git status
    alias tree='eza -T --icons'                  # Tree view
else
    # Fallback to standard ls if exa is not available
    alias ls='ls --color=auto'
    alias ll='ls -alF'
fi

# General aliases
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias grep='grep --color=auto'
alias nv='nvim'
alias nd='neovide'

# -------------------- TMUX LAUNCHER --------------------

# cd ~
# tmux
if [[ -n "$TMUX" ]]; then
    # If TMUX is running, source the configuration file.
    # The 'source-file' command can be executed directly within the pane.
    tmux source-file ~/.tmux.conf
fi

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$PATH:/usr/local/go/bin  

. "$HOME/.local/bin/env"
