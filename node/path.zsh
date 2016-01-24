npm_path=$(which npm)
test -f $npm_path && npm -g bin 2>&1 >/dev/null | grep -q '.' && export PATH="$(npm -g bin 2>/dev/null):$PATH"
