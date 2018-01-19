if ! NODENV_NVMRC_VERSION=$(nodenv-nvmrc); then
  echo "nvmrc: no version satisfying \`$NODENV_NVMRC_VERSION' installed" >&2
  exit 1
elif [ -n "$NODENV_NVMRC_VERSION" ]; then
  NODENV_VERSION="${NODENV_NVMRC_VERSION}"
fi