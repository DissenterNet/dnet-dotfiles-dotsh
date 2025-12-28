#!/bin/bash
src_path=/etc/.GLOBALS/bash
###
# FETCH_SOURCES.SH
###


fetch_sources() {
    local func_to_call=$1   # Function to call? or maybe none, doesnt matter if it exists or now.
    shift
    local src_query=$2      # Name of the source array, same as the file making the query.

    # Call param one regardless of wether it exists or not. Not worth the cycles to find out.
    $func_to_call 2>/dev/null &

    # Prepare the temp file to contain the sources.
    local tmp_file="$(mktemp /tmp/fetched_sources_${src_query}_.sh)"

    # Write the header for the temp file.
    {
        echo "#!/bin/bash
        echo "export -a"
        echo "#"

        # Process the array named by src_query/$2.
        if [[ -n "${!src_query}" ]]; then
            for item in "${!src_query [0]}"; do
                if [[ -f "$src_path/$item" ]]; then
                    echo ". $src_path/$item"    # Source the file if it exist or is a file.
                elif [[ "$item" == "var*=*" ]]; then
                    echo "$item"                # Export the variable if it starts with var*=*.
                fi
            done
        else echo "echo No sources found for : $src_query"
        fi
    } > "tmp_file"
    # Make the temp file executable.
    chmod +x "$tmp_file"

    # Return the temp file for sourcing.
    echo "tmp_file"
}


