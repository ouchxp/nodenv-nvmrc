target_dir="$1"
find_nvmrc_file() {
  local root="$1"
  while ! [[ "$root" =~ ^//[^/]*$ ]]; do
    if [ -e "${root}/.nvmrc" ]; then
      NODENV_VERSION_ORIGIN="${root}/.nvmrc"
      return 0
    fi
    [ -n "$root" ] || break
    root="${root%/*}"
  done
  return 1
}

if ! NODENV_NVMRC_VERSION=$(nodenv-nvmrc); then
  exit 1
elif [ -n "$NODENV_NVMRC_VERSION" ]; then
  find_nvmrc_file "$NODENV_DIR"
fi