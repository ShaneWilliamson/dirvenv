# dirvenv
Utility to quickly create virtualenvs utilized by direnv

## Dependencies
* [direnv](https://github.com/direnv/direnv)
* virtualenv (`pip install virtualenv`)

## Setup

### Method 1
Run the install script:
```
sudo ./install.sh
```

### Method 2
Add this to your `~/.bashrc` file:
```
show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi  
}

PS1='$(show_virtual_env)'$PS1
```

Add this to your `~/.direnvrc` file:
```
layout_virtualenv() {
  local venv_path="$1"
  source ${venv_path}/bin/activate
}

layout_virtualenvwrapper() {
  local venv_path="${PWD}/$1"
  layout_virtualenv $venv_path
}
```

Lastly, add the dirvenv folder to your path.

## Usage
1. Navigate to your desired directory for a new virtualenv.
2. Run `dirvenv virtualenv-name`

Watch as your new virtualenv is set up, and then sourced by dirvenv.
