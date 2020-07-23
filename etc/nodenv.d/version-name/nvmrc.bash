# Check if NODENV_VERSION is a environment variable, rather than a shell variable
if ! printenv NODENV_VERSION >/dev/null; then
  if ! NODENV_NVMRC_VERSION=$(nodenv-nvmrc); then
    echo "nvmrc: no version satisfying \`$NODENV_NVMRC_VERSION' installed" >&2
    exit 1
  elif [ -n "$NODENV_NVMRC_VERSION" ]; then
    NODENV_VERSION="${NODENV_NVMRC_VERSION}"
  fi
fi