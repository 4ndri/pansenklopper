#!/bin/sh

ohmyposhEval='eval "$(oh-my-posh init bash --config ~/.poshthemes/jandedobbeleer.omp.json)"'
SetPrompt(){
  FILE=$1
  if test -f "$FILE"; then
      echo "$FILE exists."
      echo $ohmyposhEval >> $FILE
  fi
}

SetPrompt ~/.bashrc
SetPrompt ~/.bash_profile
SetPrompt ~/.profile