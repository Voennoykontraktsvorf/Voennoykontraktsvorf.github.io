#!/usr/bin/env bash
# Push LP to GitHub Pages repo.
# Usage: bash publish.sh <github-username> [repo-name]
# Example: bash publish.sh vasyaGH voenkontrsvo-lp
set -e

USER="${1:?Usage: bash publish.sh <github-username> [repo-name]}"
REPO="${2:-voenkontrsvo-lp}"

cd "$(dirname "$0")"

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add -A
git commit -m "LP update: $(date -u '+%Y-%m-%d %H:%M UTC')" || echo "no changes to commit"

REMOTE_URL="https://github.com/$USER/$REPO.git"
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

echo "→ Push to $REMOTE_URL"
git push -u origin main

echo ""
echo "✓ Pushed. Now:"
echo "  1. Go to https://github.com/$USER/$REPO/settings/pages"
echo "  2. Source: 'main' branch / (root) → Save"
echo "  3. Wait 1-2 min → live at https://$USER.github.io/$REPO/"
echo ""
echo "  Or if repo is named '$USER.github.io' — live at https://$USER.github.io/"
