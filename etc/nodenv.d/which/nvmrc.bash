if ! NODENV_NVMRC_VERSION=$(nodenv-nvmrc); then
  echo "nvmrc: no version satisfying \`$NODENV_NVMRC_VERSION' installed" >&2
  exit 1
elif [ -n "$NODENV_NVMRC_VERSION" ]; then
  NODENV_COMMAND_PATH="${NODENV_ROOT}/versions/${NODENV_NVMRC_VERSION}/bin/${NODENV_COMMAND}"
fi
