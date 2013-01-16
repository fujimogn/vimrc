#!/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.darwin.zsh
# $Date: 2013-01-13T20:42:24+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# for MacVim Kaoriya
# http://code.google.com/p/macvim-kaoriya/


if which vim >/dev/null 2>&1 ; then

  MACVIM="/Applications/MacVim.app"

  if [ -e "${MACVIM}/Contents/MacOS/Vim" ]; then

    function __vim() {
      local dovim=$MACVIM/Contents/MacOS/Vim
      if [[ ${#@} = 0 ]]; then
        env LANG=ja_JP.UTF-8  $dovim
      else
        env LANG=ja_JP.UTF-8  $dovim "$@"
      fi
    }

    alias {v,vi,vim}=__vim
    export EDITOR=__vim

  fi


  if [ -x "${MACVIM}/Contents/MacOS/mvim" ]; then

   function __gvim() {
      local dogvim=$MACVIM/Contents/MacOS/mvim
      if [[ ${#@} = 0 ]]; then
        env LANG=ja_JP.UTF-8 $dogvim
      else
        env LANG=ja_JP.UTF-8 $dogvim "$@"
      fi
    }

    alias {gv,gvim}=__gvim
  fi
fi





