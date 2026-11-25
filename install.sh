#!/usr/bin/env bash
# Makes every skill in ./skills available to Claude Code, Codex and Antigravity.
# Safe to re-run; run again after adding a skill.
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")" && pwd)"
skills_dir="$repo_dir/skills"

# Claude Code reads ~/.claude/skills, Codex reads ~/.agents/skills. Both follow symlinks.
link_skills_into() {
  local target_dir="$1"
  mkdir -p "$target_dir"
  for skill_dir in "$skills_dir"/*/; do
    local skill_name link_path
    skill_name="$(basename "$skill_dir")"
    link_path="$target_dir/$skill_name"
    if [ -e "$link_path" ] && [ ! -L "$link_path" ]; then
      echo "skip  $link_path exists and is not a link"
      continue
    fi
    ln -sfn "${skill_dir%/}" "$link_path"
    echo "link  $link_path"
  done
}

link_skills_into "$HOME/.claude/skills"
link_skills_into "$HOME/.agents/skills"

# Antigravity documents no symlink support, but reads a manifest that lists skill folders.
antigravity_manifest="$HOME/.gemini/config/skills.json"
mkdir -p "$(dirname "$antigravity_manifest")"
python3 -I - "$antigravity_manifest" "$skills_dir" <<'PY'
import json, sys
manifest_path, skills_path = sys.argv[1], sys.argv[2]
try:
    with open(manifest_path) as f:
        manifest = json.load(f)
except FileNotFoundError:
    manifest = {}
entries = manifest.setdefault("entries", [])
if not any(entry.get("path") == skills_path for entry in entries):
    entries.append({"path": skills_path})
with open(manifest_path, "w") as f:
    json.dump(manifest, f, indent=2)
    f.write("\n")
print(f"entry {manifest_path} -> {skills_path}")
PY
