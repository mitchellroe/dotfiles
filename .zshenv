[ -e ~/.zshenv-private ] && source ~/.zshenv-private

append_to_path() {
  for entry; do
    case ":${PATH}:" in
      *":${entry}:"*) : ;; # If it's already in the PATH, do nothing.
      *) PATH=${PATH}:${entry} ;; # If not, add it.
    esac
  done
}

prepend_to_path() {
  for entry; do
    case ":${PATH}:" in
      *":${entry}:"*) : ;; # If it's already in the path, do nothing (i.e. `:`)
      *) PATH=${entry}:${PATH} ;; # If not, add it.
    esac
  done
}

# Append super-user binaries to the PATH
append_to_path "/sbin" "/usr/sbin"

# Keep ls from doing stupid things
export QUOTING_STYLE=literal

# snapd
append_to_path "/var/lib/snapd/snap/bin"

# Use vimx where it is available
command -v vimx > /dev/null && {
  alias vi='vimx'
  alias vim='vimx'
  export EDITOR=vimx
} || {
  export EDITOR=vim
}

# tmux
# Make sure you have the following line in your ~/.tmux.conf:
#   new-session -n $HOST
tmux_cmd=$(which tmux)
tmux() {
  SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock ${tmux_cmd} -2 attach || \
    SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock ${tmux_cmd} -2
}

# emacs
alias ec='emacsclient'

# man coloration
! [[ "${LESS}" =~ "-R" ]] && export LESS="-R ${LESS}"
[ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP

# less pagination in less (i.e. only paginate if more than one screenful)
! [[ "${LESS}" =~ "-F" ]] && export LESS="-F ${LESS}"

# base16
BASE16_SHELL="${HOME}/.opt/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

############################
# Leave these steps for last
############################

[ -e ~/.zshenv_private ] && source ~/.zshenv_private

# Prepend local binary directory to the PATH
prepend_to_path "${HOME}/.local/bin"

export PATH
