#!/bin/bash
# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Use virtualenv Python if available, otherwise system Python
if [ -x ./.venv/bin/python ]; then
    PYTHON_BIN="./.venv/bin/python"
elif [ -x ./venv/bin/python ]; then
    PYTHON_BIN="./venv/bin/python"
else
    PYTHON_BIN="python3"
fi

# Ensure repository root is on PYTHONPATH for the in-repo package
export PYTHONPATH="${SCRIPT_DIR}${PYTHONPATH:+:${PYTHONPATH}}"

exec "$PYTHON_BIN" -m appledeepdoc_mcp.main "$@"
