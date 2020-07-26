#default ubuntu junk

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=100
HISTFILESIZE=100

# update screen szie
shopt -s checkwinsize

# better globbing
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

#actual bashrc file

export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=1;34:ln=32:bn=32:se=0"

#enable flask hotreloading, disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FLASK_DEBUG=1

export NODE_PATH="/usr/bin/node"
export CHROME_BIN="/usr/bin/chromium-browser"

#disable certain files
export PYTHONSTARTUP=$HOME/.config/pythonrc.py
export LESSHISTFILE=/dev/null
export NODE_REPL_HISTORY=/dev/null

#allows for control+s in vim
stty -ixon

export PS1="\[\e[1;31m\]\u \[\e[1;34m\]\W \$(__current_branch=\$(git branch 2> /dev/null | grep -F \"*\" | cut -c 3-);if [ \"\$__current_branch\" == \"master\" ]; then echo \"\[\e[0;32m\](\$__current_branch) \"; elif [ ! -z \"\$__current_branch\" ]; then echo \"\[\e[0;33m\](\$__current_branch) \";fi)\[\e[38;5;244m\]$ \[\e[0m\]"

alias p3="python3"
alias vv="source .venv/bin/activate"
alias mvv="python3 -m venv .venv && source .venv/bin/activate"

#makes accessing files easier
alias nvimrc="nvim -i NONE ~/.config/nvim/init.vim"
alias bashrc="nvim -i NONE ~/.bashrc"
alias todo="nvim -i NONE ~/todo"
alias v="nvim -i NONE"
alias vi="nvim -i NONE"
alias vim="nvim -i NONE"

#git related aliases
alias gpom="git push origin master"
alias gpo="git push origin"
alias gp="git push"
alias gcm="git commit -m"
alias ga="git add"
alias gau="git add -u"
alias gd="git diff"
alias gdd="git diff --cached"
alias gs="git status"
alias gl="git log --name-only"
alias gc="git checkout"
alias grm="git rm"
alias goof="git reset --soft HEAD~1"
alias gtfo="git checkout master -f"
function gg() { cd ~/git/$@; }

#system related aliases
alias src="source ~/.bashrc"
alias :q="exit"
alias cls="clear && ls"
alias cgs="clear && git status"
alias c="exit"
alias sl="ls"
alias r="./run"
alias p="cat"
alias cdd="cd .."
alias ..="cd .."
alias plant="netstat -plant"
alias sedri="find . -type f -print0 | xargs -0 sed -i"
function mk() { mkdir $@ && cd $@; }
alias k9="kill -9"
alias g="_grep_wrapper"
alias less="less -R"

function _grep_wrapper() {
	grep $@ -E --color=always --exclude-dir={\*.venv\*,\*node_modules\*,\*\.git\*,\*.\*py\*} | grep -v --color=always "Binary file";
}

function grepr() { _grep_wrapper -r $@ .; }
function greprf() { _grep_wrapper -rF $@ .; }
function lst() { tree -fi $@ | grep -v "pycache\|node_modules"; }

alias music="2>/dev/null 2>&1 php -S 0.0.0.0:1234 -t ~/Music/ &"
alias lsl="ls -Alh"
alias psx="ps aux | grep"
alias tss="tsc --build tsconfig.json"
alias tsw="tsc --build tsconfig.json -w"
alias ccmake="cmake --build ."

alias chrome="chromium-browser"

alias stretch="(sleep 3600; notify-send -u critical -i x 'Hey!' 'Time to stretch!') &"

function getbashrc() {
	curl https://raw.githubusercontent.com/dosisod/bashrc/master/bashrc > ~/.bashrc
}

function getvimrc() {
	curl https://raw.githubusercontent.com/dosisod/vimrc/master/vimrc > ~/.vimrc
}

[ -f ~/.config/.fzf/fzf.bash ] && source ~/.config/.fzf/fzf.bash
