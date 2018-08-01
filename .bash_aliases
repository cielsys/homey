# Aliases

alias ls='LC_COLLATE=C \ls --group-directories-first'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='LC_COLLATE=C \ls --group-directories-first --color=auto'
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias waf="./modules/waf/waf-light"
alias hhh="history "
alias hhg="history | grep -i "
alias kk='kill -9 '
alias cdp='pushd ~/catkin_ws'
alias cds='pushd ~/catkin_ws/src/RoboND-Kinematics-Project/kuka_arm/scripts'

alias mmm="source ~/bin/ros_make.bash"
alias psg="ps -aux | grep -i "
alias sds="source ~/catkin_ws/devel/setup.bash"
