#default ubuntu junk

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export CARGO_HOME="$XDG_CACHE_HOME"/cargo
export RUSTUP_HOME="$XDG_CACHE_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
unset DEBUGINFOD_URLS

HISTCONTROL=ignorespace
HISTSIZE=-1
HISTFILESIZE=-1
HISTFILE=$XDG_CACHE_HOME/bash/history

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
export VIMRUNTIME=~/git/neovim/runtime

export PATH=$PATH:~/.local/bin:./node_modules/.bin:~/.cargo/bin:~/.local/share/go/bin/

export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=1;34:ln=32:bn=32:se=0"

#enable flask hotreloading, disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FLASK_DEBUG=1

#disable certain files
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export LESSHISTFILE=/dev/null
export LESS="-FRIX~"
export NODE_REPL_HISTORY=/dev/null

#allows for control+s in vim
stty -ixon

\cd "$(cat /tmp/__pwd 2> /dev/null)"

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
alias nvimrc="$EDITOR -i NONE ~/.config/nvim/init.lua"
alias bashrc="$EDITOR -i NONE ~/.bashrc"
alias v="$EDITOR -i NONE"
alias vi="$EDITOR -i NONE"
alias vim="$EDITOR -i NONE"
alias t="cd ~/git/todo && $EDITOR x"
alias k="cal9000"

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
alias gnow='GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date=now -n'
alias diff="diff --color=auto"
alias gca="git commit --amend --no-edit"

alias d="sudo docker"
alias dk="sudo docker-compose"

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
alias gdb="gdb -n -x $XDG_CONFIG_HOME/gdb/init"
alias cd=z
alias http="python3 -m http.server"

function _grep_wrapper() {
	grep $@ -IE --color=auto --exclude-dir={\*.venv\*,cosmopolitan,\*node_modules\*,\*\.git\*,\*.\*py\*,\*htmlcov\*};
}

function grepr() { _grep_wrapper -r $@ .; }
function greprf() { _grep_wrapper -rF $@ .; }
function lst() { tree -afi $@ | grep -v "\.venv\|\.git\|pycache\|node_modules"; }

alias psx="ps aux | grep"

[ -f ~/.config/.fzf/shell/completion.bash ] && source ~/.config/.fzf/shell/completion.bash
[ -f ~/.config/.fzf/shell/key-bindings.bash ] && source ~/.config/.fzf/shell/key-bindings.bash

[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git

eval "$(zoxide init bash)"

. "$CARGO_HOME/env"
