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

# Make cd to symlink follow link
alias cd='cd -P '
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias waf="./modules/waf/waf-light"
alias hhh="history "
alias hhg="history | grep -i "
alias kk='kill -9 '

alias psg="ps -aux | grep -i "
alias envg="env | grep -i "

alias pycharm="/opt/pycharm-community-2018.2.2/bin/pycharm.sh"
alias processing="/opt/processing-3.4/processing"

alias ros_kill="killall gazebo & killall gzserver & killall gzclient & pkill -f ros & pkill -f rtabmap & pkill -f gmapping"

function cdz(){
    zdir="$HOME/z$1"
    echo "zdir = $zdir"
    if [ ! -L "$zdir" ]; then
       echo "$zdir Does not exist "
    else
        pushd .
        # -P makes it go to the actual dir
        cd -P "$zdir"
    fi
}

alias cdc="pushd $CATKIN_WS"
function ros_make(){
    # Change to project root. Relies on cdc alias and $CATKIN_WS env var
    cdc
    catkin_make

    # TODO: check retval of make
    source devel/setup.bash
}

alias sim=/media/cl/DDrive/AAAProjects/Udacity_self-driving-car-sim/carndsimcustom.x86_64
alias simp5=/home/cl/apps/Udacity/carNDProj5_KalmanSim/term2_sim.x86_64
# alias cl=/home/cl/apps/clion-2018.2.5/bin/clion.sh
alias cl=/home/cl/apps/clion-2019.3.4/bin/clion.sh

