#!/usr/bin/env bash
# Initialize Bash It

# Reload Library
alias reload='source ~/.bash_profile'

# Only set $BASH_IT if it's not already set
if [ -z "$BASH_IT" ];
then
    # Setting $BASH to maintain backwards compatibility
    # TODO: warn users that they should upgrade their .bash_profile
    export BASH_IT=$BASH
    export BASH=`bash -c 'echo $BASH'`
fi

# For backwards compatibility, look in old BASH_THEME location
if [ -z "$BASH_IT_THEME" ];
then
    # TODO: warn users that they should upgrade their .bash_profile
    export BASH_IT_THEME="$BASH_THEME";
    unset $BASH_THEME;
fi

# Load colors first so they can be use in base theme
source "${BASH_IT}/themes/colors.theme.bash"
source "${BASH_IT}/themes/base.theme.bash"

# library
LIB="${BASH_IT}/lib/*.bash"
for config_file in $LIB
do
  source $config_file
done

unset config_file
if [[ $PROMPT ]]; then
    export PS1=$PROMPT
fi
