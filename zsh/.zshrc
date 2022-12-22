# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

autoload -Uz compinit
compinit

export PATH="${PATH}:${HOME}/.local/bin"
export EDITOR=vim
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

zmodload zsh/zpty

pty() {
	zpty pty-${UID} ${1+$@}
	if [[ ! -t 1 ]]; then
		setopt local_traps
		trap '' INT
	fi
	zpty -r pty-${UID}
	zpty -d pty-${UID}
}

ptyless() {
	pty $@ | less
}

## Modified commands
#alias diff='colordiff'              # requires colordiff package
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
#alias more='less'
#alias df='df -h'
#alias du='du -c -h'
#alias mkdir='mkdir -p -v'
#alias nano='nano -w'
#alias ping='ping -c 5'
#alias dmesg='dmesg -HL'

## New commands
#alias da='date "+%A, %B %d, %Y [%T]"'
#alias du1='du --max-depth=1'
#alias hist='history | grep'         # requires an argument
#alias openports='ss --all --numeric --processes --ipv4 --ipv6'
#alias pgg='ps -Af | grep'           # requires an argument
#alias ..='cd ..'

# Privileged access
if (( UID != 0 )); then
	alias sudo='sudo '
	alias scat='sudo cat'
	alias svim='sudoedit'
	alias root='sudo -i'
	alias reboot='sudo systemctl reboot'
	alias poweroff='sudo systemctl poweroff'
	alias update='sudo pacman -Su'
	alias netctl='sudo netctl'
fi

## ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

## Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
