
set_xterm_title () {
    local title="$1"
    echo -ne "\e]0;$title\007"
}


precmd () {
    set_xterm_title "${USER}@${HOSTNAME} `dirs -0` $PROMPTCHAR"
}

# Note that this can cause problems with bash scripts such as:
# alias show-branches='for k in `git branch|sed s/^..//`;do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k" --`\\t"$k";done|sort'
#preexec () {
#    set_xterm_title "$1 {`dirs -0`} (${USER}@${HOSTNAME})"
#}

case "$TERM" in
    xterm*|rxvt*) preexec_install;;
esac
