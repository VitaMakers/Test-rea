#!/bin/bash
# Prepares REA for Claude Code cloud sessions: submodules, dependencies and build.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Upstream engines in third_party/ (LFS objects are not served anonymously).
GIT_LFS_SKIP_SMUDGE=1 git submodule update --init --recursive --depth 1

# npm install reuses the cached node_modules from previous sessions.
npm install --no-audit --no-fund

# Standalone CLI and MCP server in dist/ (Turbo skips unchanged tasks).
npm run build:cached
