#!/usr/bin/env bash
# run_python.sh - Run Python with the skill's dependencies, from wherever the skill lives.
#
# Usage: bash <skill_path>/scripts/run_python.sh script.py [args...]
#        bash <skill_path>/scripts/run_python.sh -m pytest ...
#
# Interpreter order (never installs anything):
#   1. $LATEX_SKILL_PYTHON, if set
#   2. <skill>/.pixi/envs/default/bin/python  (created by: cd <skill> && pixi install)
#   3. python3 on PATH
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -n "${LATEX_SKILL_PYTHON:-}" ]]; then
  PY="$LATEX_SKILL_PYTHON"
elif [[ -x "${ROOT}/.pixi/envs/default/bin/python" ]]; then
  PY="${ROOT}/.pixi/envs/default/bin/python"
else
  PY="python3"
fi
exec "$PY" "$@"
