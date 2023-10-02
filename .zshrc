#Hide user in terminal
export DEFAULT_USER="$(whoami)"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

plugins=(git docker colorize pip python kubectl kube-ps1 kubectx zsh-autosuggestions)
#autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

#GPG
GPG_TTY=$(tty)
export GPG_TTY

#GO
export GOPATH=~/go
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export CGO_ENABLED=1
export GOMOD111=on
export GO111MODULE=on
export GOPRIVATE=golang.frontdoorhome.com/*,go.ftdr.com/*

#PYTHON PYTEST
export PATH=$PATH:/home/seancheevers/.local/bin

#DOTNET
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

#Homebrew path
export=PATH=$PATH:/usr/local/Cellar

# Exporting a default AWS Region
export AWS_REGION="us-east-1"

#Kubernetes
alias k="kubectl"
alias kcc='kubectl config current-context'
alias kdp='kubectl delete po'
alias kgc='kubectl config get-contexts'
alias kge='kubectl get events --sort-by='\''{.lastTimestamp}'\'
alias kgp='kubectl get po'
alias kl='kubectl logs '
alias kpf='kubectl port-forward'
alias ksc='kubectl config use-context'
alias mk="minikube kubectl --"
source <(kubectl completion zsh)

#GCP
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#Krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

source ~/sandbox/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1) '

#Usage:
#➜  ~ ksn dev1                                                       (dev-context/dev1)
#     Context "dev-context" modified.
#     Namespace: dev1

#➜  ~ ksn ff                                                         (dev-context/dev1)
#     Error from server (NotFound): namespaces "ff" not found
alias ksn='_f(){k get namespace $1 > /dev/null; if [ $? -eq 1 ]; then return $?; fi;  k config set-context $(k config current-context) --namespace=$1; echo "Namespace: $1"};_f'


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"

alias edit='open -a TextEdit'

# Options for showing all aliaseses for all the plugins installed
# Useful for discovering options previously unknown
function options() {
    PLUGIN_PATH="$HOME/.oh-my-zsh/plugins/"
    for plugin in $plugins; do
        echo "\n\nPlugin: $plugin"; grep -r "^function \w*" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/()//'| tr '\n' ', '; grep -r "^alias" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/=.*//' |  tr '\n' ', '
    done
}

function plugins() {
    echo $plugins
}

# This was needed to resolve an issue where tab completion was not working
# See github issue: https://github.com/docker/cli/issues/263
autoload -Uz compinit
compinit

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
[[ /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/kubectl ]]

#ASDF
#. /opt/homebrew/opt/asdf/libexec/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Created by `pipx` on 2022-06-15 21:58:25
export PATH="$PATH:/Users/sean.cheevers/.local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/seancheevers/sandbox/google-cloud-sdk/path.zsh.inc' ]; then . '/home/seancheevers/sandbox/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/seancheevers/sandbox/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/seancheevers/sandbox/google-cloud-sdk/completion.zsh.inc'; fi
