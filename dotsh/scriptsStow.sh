# stow -d "$PWD"/ -t 

from="$PWD"

#basename("$(from) 1")

basename() {
    local d="${1}"
    local num="${2}"
    shift
    for ((x=0; x<"${2}"; x++)); do
        d="${d%/*}"
    done
    echo "${2#"${d}"/}"
}

echo $d
to="/home/dnet/gitsync/${d}"

echo "$from" and "$to"