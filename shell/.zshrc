# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

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
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias profile="nano ~/.zshrc"
alias clr="clear"
alias refresh="source ~/.zshrc"

## Environment Variables ##

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
alias gcm="git commit -m"

# Docker Shortcuts
alias dc='docker-compose'

alias vprof='nvim ~/.config/nvim/init.vim'

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

# Generate output.zip for terraform files
generate_output_zip() {
  for line in $(find . -name 'package.json' -maxdepth 2 -mindepth 2); do
    cd "$(dirname "$line")"
    npm install -q
    zip -q -r output.zip src node_modules
    cd ../
  done
}
alias gzp="generate_output_zip"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# lvl cli PAT
export GH_TOKEN=952e65620e8d78364ece8f98038efbf2555e8165

# LinOS Backend Stuff
export NPM_TOKEN=bGV2dmVsLWxpbm9zOkFQN2RkUm1xNmJGS1R4UllwTnNaeEVSbXdkUA==

# Deno Setup
export DENO_INSTALL="/home/sam/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# X11/WSL2 stuff
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/sam/.nvm/versions/node/v12.16.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/sam/.nvm/versions/node/v12.16.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# Go Global variables
export GOROOT=/usr/local/go
export GOPATH=/home/sam/workspace/tutorials/golang
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Vagrant & VirtualBox stuff
export PATH="${PATH}:/home/sam/.local/bin"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="${PATH}:/mnt/c/Program Files/Oracle/VirtualBox"

# Add Yarn global packages to path
export PATH="$(yarn global bin):$PATH"

