#!/bin/bash
if ! [ -e dirvenv ]
then
    echo "You must be in the dirvenv folder to run the installation script!"
    exit 1
fi

mv dirvenv /usr/local/bin

echo "
# DIRVENV
show_virtual_env() {
  if [ -n \"\$VIRTUAL_ENV\" ]; then
      echo \"(\$(basename \$VIRTUAL_ENV))\"
    fi  
}

PS1='\$(show_virtual_env)'\$PS1" > $HOME/.dirvenvrc

echo "
source \$HOME/.dirvenvrc
" >> $HOME/.bashrc

echo "layout_virtualenv() {
  local venv_path=\"\$1\"
    source \${venv_path}/bin/activate
}

layout_virtualenvwrapper() {
  local venv_path=\"\${PWD}/\$1\"
    layout_virtualenv \$venv_path
}" >> $HOME/.direnvrc

