# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

eval "$(starship init bash)"

# dotfiles management
alias config='/run/current-system/sw/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nixconfig='/run/current-system/sw/bin/git --git-dir=$HOME/nixdotfiles/ --work-tree=/'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

fastfetch --config ascii-art

# uv
export PATH="/home/nicole/.local/bin:$PATH"
alias kimi='kimi --mcp-config-file /home/nicole/.config/kimi/mcp.json'
