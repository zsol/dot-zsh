export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
which brew >/dev/null 2>/dev/null && export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$DOTFILES/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
