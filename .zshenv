[ -e ~/.zshenv-private ] && source ~/.zshenv-private

addToPath() {
  for entry; do
    case ":$PATH:" in
      *":${entry}:"*) : ;;         # If it's already in the path, do nothing (i.e. `:`)
      *) PATH=$PATH:${entry} ;;    # If not, add it.
    esac
  done
}

# Prepend local binary directory to the PATH
addToPath "${HOME}/.local/bin"

# Append golang binaries to the PATH
export GOPATH="${HOME}/go"
addToPath "${GOPATH}/bin"

# Append super-user binaries to the PATH
addToPath "/sbin" "/usr/sbin"

# Keep ls from doing stupid things
export QUOTING_STYLE=literal

# Mattermost
export MM_LIVE_RELOAD=true
addToPath "${HOME}/node_modules/.bin" "/usr/lib/node/bin"
# For auto-deployment of plugins to my local development environment.
export MM_SERVICESETTINGS_SITEURL=http://localhost:8065
export MM_ADMIN_USERNAME=mitchellroe
# MM_ADMIN_PASSWORD is set in ~/.zshenv-private

# Emacs
# export EDITOR='emacsclient'
# export ALTERNATE_EDITOR='emacs'
alias e='emacsclient -nw -a emacs'

# Trying to get into vSphere
alias esxcli="/usr/bin/esxcli --server='vc6.sys.oakland.edu' --username='op_mbroe@admnet' --thumbprint='E3:79:A6:9A:A1:7A:92:6A:59:B2:72:D0:87:6A:CF:EB:18:F0:0C:88'"

# GitLab
addToPath "/opt/runit/command" "${HOME}/.rbenv/bin" \
          "${HOME}/.rbenv/shims"
# Also need to run `eval $(rbenv init -)`, according to rbenv's docs. Run it
# last, though, as it mucks with the PATH directly.

# snapd
addToPath "/var/lib/snapd/snap/bin"

# Change over to neovim
alias vi='nvim'
alias vim='nvim'

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
addToPath "${PYENV_ROOT}/bin"
command -v pyenv > /dev/null && eval "$(pyenv init -)"

# tmux
# Make sure you have the following line in your ~/.tmux.conf:
#   new-session -n $HOST
alias tmux='tmux attach'

export PATH

# Left over from the GitLab setup.
eval "$(rbenv init -)"
