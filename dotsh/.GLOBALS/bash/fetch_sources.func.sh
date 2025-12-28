#!/usr/bin/env bash
set -euo pipefail

# default location for reusable source fragments (override with env var if desired)
src_path="${src_path:-/etc/.GLOBALS/bash}"

fetch_sources() {
    local src_query="${1:-}"
    local pre_cmd="${2:-}"

    if [[ -z "$src_query" ]]; then
        printf 'Usage: fetch_sources <array_name> [pre_cmd]\n' >&2
        return 2
    fi

    # Run pre-refresh command if provided and available (synchronous)
    if [[ -n "$pre_cmd" ]]; then
        if type "$pre_cmd" >/dev/null 2>&1; then
            "$pre_cmd" >/dev/null 2>&1 || printf 'Warning: pre_cmd "%s" returned non-zero\n' "$pre_cmd" >&2
        else
            printf 'Warning: pre_cmd "%s" not found\n' "$pre_cmd" >&2
        fi
    fi

    local tmp_file
    tmp_file="$(mktemp "/tmp/fetched_sources_${src_query}_XXXX.sh")" || return 1

    # Read named array into local array 'arr'. Prefer nameref, fallback to eval.
    local -a arr
    if declare -p "$src_query" >/dev/null 2>&1; then
        if declare -n _ref="$src_query" 2>/dev/null; then
            arr=("${_ref[@]}")
            unset _ref
        else
            eval "arr=(\"\${${src_query}[@]}\")"
        fi
    fi

    {
        echo "#!/usr/bin/env bash"
        echo "# Auto-generated source bundle for: $src_query"
        echo "# Generated: $(date --iso-8601=seconds 2>/dev/null || date)"
        echo ""
        if [[ ${#arr[@]} -gt 0 ]]; then
            for item in "${arr[@]}"; do
                if [[ "$item" == *=* ]]; then
                    # item is an assignment like NAME=value (preserve quotes if present)
                    printf 'export %s\n' "$item"
                else
                    # treat item as filename underneath src_path
                    if [[ -f "${src_path%/}/$item" ]]; then
                        printf '. "%s/%s"\n' "${src_path%/}" "$item"
                    else
                        printf '# missing: %s/%s\n' "${src_path%/}" "$item"
                    fi
                fi
            done
        else
            printf 'printf "No sources found for: %s\n" "%s"\n' "$src_query" "$src_query"
        fi
    } > "$tmp_file"

    chmod +x "$tmp_file"
    printf '%s\n' "$tmp_file"
}
