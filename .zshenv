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

# Prepend golang binaries to the PATH
export GOPATH="${HOME}/go"
prepend_to_path "${GOPATH}/bin"
[ -d "/usr/local/go/bin" ] && prepend_to_path "/usr/local/go/bin"

# Append super-user binaries to the PATH
append_to_path "/sbin" "/usr/sbin"

# Keep ls from doing stupid things
export QUOTING_STYLE=literal

# Mattermost
export MM_LIVE_RELOAD=true
append_to_path "${HOME}/node_modules/.bin" "/usr/lib/node/bin"
# For auto-deployment of plugins to my local development environment.
export MM_SERVICESETTINGS_SITEURL=http://localhost:8065
export MM_ADMIN_USERNAME=mitchellroe
# MM_ADMIN_PASSWORD is set in ~/.zshenv-private

# Emacs
alias e='emacsclient -nw -a emacs --no-wait'

# GitLab
append_to_path "/opt/runit/command" "${HOME}/.rbenv/bin" \
          "${HOME}/.rbenv/shims"
# Also need to run `eval $(rbenv init -)`, according to rbenv's docs. Run it
# last, though, as it mucks with the PATH directly.

# snapd
append_to_path "/var/lib/snapd/snap/bin"

# Use vimx where it is available
command -v vimx > /dev/null && {
  alias vi='vimx'
  alias vim='vimx'
}

# tmux
# Make sure you have the following line in your ~/.tmux.conf:
#   new-session -n $HOST
tmux_cmd=$(which tmux)
tmux() {
  SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock ${tmux_cmd} -2 attach || \
    SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock ${tmux_cmd} -2
}

# man coloration
export LESS="-R"
[ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP

# pyenv stuff
export PYENV_ROOT="${HOME}/.pyenv"
prepend_to_path "${PYENV_ROOT}/bin"
command -v pyenv > /dev/null && {
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

# rbenv stuff
command -v rbenv > /dev/null && {
  eval "$(rbenv init -)"
}

# kubernetes
alias k='kubectl'

############################
# Leave these steps for last
############################

# Prepend local binary directory to the PATH
prepend_to_path "${HOME}/.local/bin"

export PATH
