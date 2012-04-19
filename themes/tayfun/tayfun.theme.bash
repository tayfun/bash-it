#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function prompt_command() {
    if [[ -z "$(scm_prompt_info)" ]]
    then
        PS1="${green}\w${red}$(virtualenv_prompt)${red}${green}$(scm_prompt_info) ${green}\$${reset_color} "
    else
        PS1="${green}\w${red}$(virtualenv_prompt)${red}${green}$(scm_prompt_info) \n${green}\$${reset_color} "
    fi

}

PROMPT_COMMAND=prompt_command;
