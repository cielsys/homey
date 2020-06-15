#!/usr/bin/env bash

# Needs to be called with 'source' which shows as $0 == 'bash' or '-bash'
if [ ! $0 == 'bash' ] && [ ! $0 == '-bash' ];
  then
    echo "Need to call with 'source $0'"
    exit -1
fi

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

echo "Activate an ENV with 'workon ENV' (Then 'deactivate')"
echo "Available venvs:"
lsvirtualenv -b

# python -m pip
# sudo pip3 install virtualenv virtualenvwrapper
# mkvirtualenv NEWENV -p python3.6
# workon NEWENV

# workon cv
