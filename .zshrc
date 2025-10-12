# This loads the Oh My Zsh framework. Must be at the top!
export ZSH="$HOME/.oh-my-zsh"

# Set a reliable theme. You can change this later.
# Remember: 'agnoster' requires a Powerline-compatible font!
ZSH_THEME="agnoster"

# List of plugins to load. These must be installed separately (you did this).
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# -------------------- CUSTOM ALIASES AND FUNCTIONS --------------------
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Check if exa is installed before setting aliases
if command -v exa &> /dev/null; then
    # exa aliases
    alias ls='exa --icons'               # Basic list with file icons
    alias ll='exa -lga --git --icons'    # Long, detailed list with icons and Git status
    alias tree='exa -T'                  # Tree view
else
    # Fallback to standard ls if exa is not available
    alias ls='ls --color=auto'
    alias ll='ls -alF'
fi

# General aliases
alias grep='grep --color=auto'

# -------------------- TMUX LAUNCHER --------------------

# Start tmux if not already running and the shell is interactive.
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ $- == *i* ]]; then
    # Attach to the session named 'main' or create a new one with that name.
    # The '-c $HOME' ensures the session always starts in the home directory (~).
    exec tmux new-session -A -s main -c $HOME
fi
