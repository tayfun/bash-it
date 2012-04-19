# based on https://gist.github.com/318247

# Usage: browser
# pipe html to a browser
# e.g.
# $ echo "<h1>hi mom!</h1>" | browser
# $ ron -5 man/rip.5.ron | browser

function browser() {
    if [ -t 0 ]; then
        if [ -n "$1" ]; then
            gnome-open $1 > /dev/null 2>&1
        else
            cat <<usage
Usage: browser
pipe html to a browser

$ echo '<h1>hi mom!</h1>' | browser
$ ron -5 man/rip.5.ron | browser
usage

    fi

    else
        f="/tmp/browser.$RANDOM.html"
        cat /dev/stdin > $f
        gnome-open $f > /dev/null 2>&1
    fi
}



#
# Usage: raw google.com
# wget into a temp file and pump it into your browser
#
# e.g.
# $ raw google.com
function raw() {
    if [ -t 0 ]; then
        if [ -n "$1" ]; then
            wget -qO- $1 | browser
        else
            cat <<usage
Usage: raw google.com
wget into a temp file and pump it into your browser

$ raw google.com
usage
      fi
    fi
}
