# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

ZSH_THEME="bullet-train"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vscode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Change Settings
BULLETTRAIN_PROMPT_ORDER=(
	time
	status
	dir
	nvm
	git
)
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_DIR_BG=magenta
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_NVM_FG=black

# Example aliases
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias profile="nvim ~/.zshrc"
alias clr="clear"
alias refresh="source ~/.zshrc"

# git alias commands
alias gf='git fetch'
alias gc='git checkout'
alias gb='git branch'
alias gs='git status'
alias gl="git log --all --graph --decorate --oneline --abbrev-commit --use-mailmap"
alias grb="git rebase"
alias grbi="git rebase -i"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias gadd="git add -u && gs"
alias gcm="git commit"
alias gcb='git checkout $(git branch -a | fzf-tmux -d 15 --no-preview | sed "s/remotes\/origin\///g")'

# Docker Shortcuts
alias dc='docker-compose'

## Custom functions ##

# Combined git commit & push and alias
git_commit_and_push() {
    git commit -m "$1"
    git push
}
alias gcp="git_commit_and_push"

# Find and kill process on specific port number
kill_process_on_port() {
    kill $(lsof -t -i :$1)
}
alias pkfire="kill_process_on_port"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Deno Setup
export DENO_INSTALL="/home/sam/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/sam/.nvm/versions/node/v12.16.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/sam/.nvm/versions/node/v12.16.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# Go Global variables
export GOROOT=/usr/local/go
export GOPATH=/home/sam/workspace/tutorials/golang
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Add Yarn global packages to path
export PATH="$(yarn global bin):$PATH"

# Use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{**/.git,**/dist,**/node_modules}/*"'
