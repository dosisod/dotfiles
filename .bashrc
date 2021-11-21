#default ubuntu junk

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

HISTCONTROL=ignorespace
HISTSIZE=-1
HISTFILESIZE=-1

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

set -o vi
bind -m vi-insert 'Control-l: clear-screen'

export EDITOR=nvim
export VISUAL=nvim

export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=1;34:ln=32:bn=32:se=0"

#enable flask hotreloading, disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FLASK_DEBUG=1

#path for gnome keyring
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

#disable certain files
export PYTHONSTARTUP=$HOME/.config/pythonrc.py
export LESSHISTFILE=/dev/null
export LESS="-FRIX~"
export NODE_REPL_HISTORY=/dev/null

#allows for control+s in vim
stty -ixon

cd $(cat /tmp/__pwd 2> /dev/null)

__git_branch() {
	branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

	[ "$branch" = "master" ] &&
		printf "\e[0;32m(master) " || {
		[ ! -z "$branch" ] &&
			printf "\e[0;33m($branch) ";
	}
}

__status_code() {
	[ "$1" != "0" ] && echo "[$1] "
}

export PS1="\$(__status_code \$?)\[\e[1;31m\]\u \[\e[1;34m\]\W \$(__git_branch)\[\e[38;5;244m\]$ \[\e[0m\]"

alias p3="python3"
alias vv="source .venv/bin/activate"
alias mvv="python3 -m venv .venv && source .venv/bin/activate"

#makes accessing files easier
alias nvimrc="$EDITOR -i NONE ~/.config/nvim/init.vim"
alias bashrc="$EDITOR -i NONE ~/.bashrc"
alias todo="$EDITOR -i NONE ~/todo"
alias v="$EDITOR -i NONE"
alias vi="$EDITOR -i NONE"
alias vim="$EDITOR -i NONE"

#git related aliases
alias gpom="git push origin master"
alias gpoh="git push origin HEAD"
alias gcm="git commit -m"
alias ga="git add"
alias gau="git add -u"
alias gd="git diff"
alias gdd="git diff --cached"
alias gs="git status"
alias gl="git log --name-only"
alias grm="git rm"
alias goof="git reset --soft HEAD~1"
alias gtfo="git checkout master -f"

alias d="doas docker"
alias dk="doas docker-compose"

#system related aliases
alias m="pwd > /tmp/__pwd"
alias src="source ~/.bashrc"
alias :q="exit"
alias sl="ls"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias sedri="find . -type f -print0 | xargs -0 sed -i"
alias sedr="find . -type f -print0 | xargs -0 sed"
function mk() { mkdir $@ && cd $@; }
alias k9="kill -9"
alias g="_grep_wrapper"
alias gdb="gdb -ex='set history save on' -ex='set history filename /tmp/gdb_history'"
alias cd=z

function _grep_wrapper() {
	grep $@ -IE --color=auto --exclude-dir={\*.venv\*,cosmopolitan,\*node_modules\*,\*\.git\*,\*.\*py\*};
}

function grepr() { _grep_wrapper -r $@ .; }
function greprf() { _grep_wrapper -rF $@ .; }
function lst() { tree -afi $@ | grep -v "\.venv\|\.git\|pycache\|node_modules"; }

alias psx="ps aux | grep"

[ -f ~/.config/git/completion.bash ] && source ~/.config/git/completion.bash

[ -f ~/.config/.fzf/fzf.bash ] && source ~/.config/.fzf/fzf.bash

[ -f ~/.config/npm/completion.bash ] && source ~/.config/npm/completion.bash

eval "$(zoxide init bash)"
