shopt -s expand_aliases

function editorconfig-init {
    if [[ -f .editorconfig ]]; then
        echo "[ERROR] .editorconfig config already exists in $(pwd)"
    else
        echo "# editorconfig.org" > .editorconfig
        echo "root = true" >> .editorconfig
        echo "" >> .editorconfig
        echo "[*]" >> .editorconfig
        echo "indent_style = space" >> .editorconfig
        echo "indent_size = 2" >> .editorconfig
        echo "end_of_line = lf" >> .editorconfig
        echo "charset = utf-8" >> .editorconfig
        echo "trim_trailing_whitespace = true" >> .editorconfig
        echo "insert_final_newline = true" >> .editorconfig
        echo "" >> .editorconfig
        echo "[*.md]" >> .editorconfig
        echo "trim_trailing_whitespace = false" >> .editorconfig
    fi
}

function git_branch {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch=' (detached*) '
    fi
    git_branch=" ($branch) "
  else
    git_branch=""
  fi

  printf "$git_branch"
}

function prefix-css {
  if [[ -x /usr/bin/autoprefixer-cli ]]; then
    /usr/bin/autoprefixer-cli --no-remove --no-cascade -o "$2" "$1" -b "> 1%, last 4 versions, IE > 10, iOS > 6, safari > 6, Firefox ESR" > /dev/null 2>&1
  else
    echo "No executable: autoprefixer-cli. Install it via [sudo] npm install -g autoprefixer-cli"
  fi
}
