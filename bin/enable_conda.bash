#!/usr/bin/env bash

# Needs to be called with 'source' which shows as $0 == 'bash' or '-bash'
if [ ! $0 == 'bash' ] && [ ! $0 == '-bash' ];
  then
    echo "Need to call with 'source $0'"
    exit -1
fi

CONDAPATH="/home/cl/apps/anaconda3/etc/profile.d"
source "$CONDAPATH/conda.sh"

echo "Activate an ENV with"
echo "  conda activate ENV (then conda deactivate)" 
echo "  -or- source activate ENV' (Then 'source deactivate')"

conda env list

# TODO: Fix this to work on alternate conda bin paths
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/cl/apps/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/cl/apps/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/cl/apps/anaconda3/etc/profile.d/conda.sh"
#    else
 #       export PATH="/home/cl/apps/anaconda3/bin:$PATH"
 #   fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

