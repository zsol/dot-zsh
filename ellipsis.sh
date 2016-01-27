#!/usr/bin/env bash
#
# zeekay/zsh ellipsis package

pkg.install() {
  set -x
  if [ ! -d $HOME/.oh-my-zsh ]; then
    url="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
    utils.run_installer
  fi
  if ! utils.cmd_exists z; then
    git.clone "https://github.com/rupa/z" $HOME/.z
  fi
  if [ -e $HOME/.zshrc.pre-oh-my-zsh ]; then
      mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
  fi
}

pkg.link() {
  fs.link_files $PKG_PATH/_links
}

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
