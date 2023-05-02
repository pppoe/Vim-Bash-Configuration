[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%d/%m/%y %T "
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\e[32m\u#\h@\@\e[0m \e[34m\w\e[0m\[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n\$"

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias lh='ls -lh'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l'
alias lm='ls -l|more'
alias la='ls -a'
alias l='ls -CF'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ]; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

export TERM=xterm
if [ -f "/opt/intel/bin/compilervars.sh" ]; then
    source /opt/intel/bin/compilervars.sh intel64
fi
alias vim=nvim
export EDITOR=nvim
if [ -f "/Users/haoxiang/Main/TechStacks/DL/torch/install/bin/torch-activate" ]; then
    . /Users/haoxiang/Main/TechStacks/DL/torch/install/bin/torch-activate
fi
if [ -f "$HOME/.pythonstartup" ]; then
    export PYTHONSTARTUP=$HOME/.pythonstartup
fi
PATH=/usr/local/bin:$PATH
