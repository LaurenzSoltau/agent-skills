#!/usr/bin/env bash
# Links every skill in ./skills into ~/.claude/skills. Re-run after adding a skill.
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")" && pwd)"
target_dir="${HOME}/.claude/skills"
mkdir -p "$target_dir"

for skill_dir in "$repo_dir"/skills/*/; do
  skill_name="$(basename "$skill_dir")"
  link_path="$target_dir/$skill_name"
  if [ -e "$link_path" ] && [ ! -L "$link_path" ]; then
    echo "skip  $skill_name: $link_path exists and is not a link"
    continue
  fi
  ln -sfn "${skill_dir%/}" "$link_path"
  echo "link  $skill_name"
done
