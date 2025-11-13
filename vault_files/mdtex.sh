#!/bin/bash
set -e

# --- Parse args (-v <file>) ---
if [[ "$1" == "-v" ]]; then
  file_path="$2"
else
  file_path="$1"
fi

if [ -z "$file_path" ]; then
  echo "[ERROR] No file path provided."
  exit 1
fi



# --- Resolve vault and base file names ---
vault_dir="$(dirname "$file_path")"
base_name="$(basename "$file_path" .md)"
out_dir=".md2overleaf/${base_name}"
mkdir -p "$out_dir"

echo "[DEBUG] Vault dir: $vault_dir"
echo "[DEBUG] Output dir: $out_dir"
echo "[DEBUG] Base name: $base_name"
# Step 1: Sanitize the markdown for Pandoc
python3 sanitize_markdown.py "$file_path"

which pandoc
pandoc -v | head -n 1


pandoc "$file_path" \
  --lua-filter=final_filter.lua \
  --from=markdown+lists_without_preceding_blankline \
  --metadata=lang:he \
  --metadata=dir:rtl \
  -o "${out_dir}/${base_name}.tex"


echo "[DEBUG] Pandoc exit code: $?"
find "${out_dir}" -maxdepth 1 -name "*.tex" -ls
# Step 3: Restore the math blocks for Obsidian readability
python3 restore_math_blocks.py "$file_path"

echo "✅ Conversion complete: ${out_dir}/${base_name}.tex created"

