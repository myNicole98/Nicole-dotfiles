# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

eval "$(starship init bash)"

# dotfiles management
alias config='/run/current-system/sw/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nixconfig='/run/current-system/sw/bin/git --git-dir=$HOME/dotfiles/ --work-tree=/'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

