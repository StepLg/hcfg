## Установка нормального поведения клавиш Delete, Home, End и т.д.:
bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey "^[OD" backward-word # one word back
bindkey "^[OC" forward-word # one word forward
# bindkey " " magic-space ## do history expansion on space


# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit -s

# Исправление поведения less - для ликвидации лишних Esc
# и прочего безобразия при  выводе man-страниц.
# Насколько мне известно, нужно только в некоторых дистрибутивах
export LESS="-R"

export LESSCHARSET=utf-8

export LD_LIBRARY_PATH=$HOME/.local/lib/
export C_INCLUDE_PATH=$HOME/.local/include/
export CPLUS_INCLUDE_PATH=$HOME/.local/include/
export LIBRARY_PATH=$HOME/.local/lib/
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_NUMERIC=POSIX

[ ! -d $HOME/bin ] || export PATH=$HOME/bin:$PATH

alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tawk="awk -v OFS='\t' -F'\t'"
alias screen='screen -U'
alias heasy_install='easy_install -U -s ~/bin -d ~/.local/lib/python2.6/site-packages/'
alias tmux='TERM=xterm-256color tmux -u'

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tawk="awk -v OFS='\t' -F'\t'"
alias screen='screen -U'
alias heasy_install='easy_install -U -s ~/bin -d ~/.local/lib/python2.6/site-packages/'
alias tmux='TERM=xterm-256color tmux -u'
alias mlog='clear; tail -n 100 -f '

## файл истории команд
## если не указан, история не будет сохраняться
## при выходе из сеанса
HISTFILE=~/.zhistory

## Число команд, сохраняемых в HISTFILE
SAVEHIST=5000

## Чucлo koмaнg, coxpaняeмыx в сеансе
HISTSIZE=5000

RSTACKSIZE=20

# Опции истории команд
## Дополнение файла истрии
setopt  APPEND_HISTORY
## Игнopupoвaть вce пoвтopeнuя команд
setopt  HIST_IGNORE_ALL_DUPS
## Игнopupo лишние пpoбeлы
setopt  HIST_IGNORE_SPACE
## Удалять из файл истории пустые строки
setopt  HIST_REDUCE_BLANKS
## Отключение звукового сигнала при ошибках
setopt  No_Beep
## Нe cчuтaть Control+C зa выxog uз oбoлoчku
setopt  IGNORE_EOF
## Комментарии в интерактивном режиме
setopt  INTERACTIVE_COMMENTS

# Опции общего поведения
# bindkey -v    # режим навигации в стиле vi
bindkey -e      # peжuм нaвuгaцuu в cтuлe emacs

bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# Для разворота сокращенного ввода типа cd d/e в docs/editors
autoload -U compinit
compinit

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

autoload -U colors

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
   for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done
   PR_NO_COLOUR="%{$terminfo[sgr0]%}"

local blue_op=""$PR_BLUE"["$PR_NO_COLOUR""
local blue_cp=""$PR_BLUE"]"$PR_NO_COLOUR""
local blue_zd=""$PR_BLUE"╭─"$PR_NO_COLOUR""
local blue_zu=""$PR_BLUE"╰─"$PR_NO_COLOUR""
local path_p="${blue_op}$PR_MAGENTA%/$PR_NO_COLOUR${blue_cp}%b"
local user_host="${blue_op}%B$PR_GREEN%n@%m$PR_NO_COLOUR${blue_cp}"
PROMPT="${blue_zd}${user_host}${PR_BLUE}─[$PR_NO_COLOUR%B%*%b${PR_BLUE}]─$PR_NO_COLOUR${path_p}
${blue_zu}$PR_BLUE%#$PR_NO_COLOUR "
# RPROMPT="%B%*%b"


