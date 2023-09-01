#!/bin/bash

extension() {
    # input url
    local url=${1//\"/} # remove the quote if there are
    # List of valid archive extensions
    local valid=("zip" "tar.gz")

    for ext in "${valid[@]}"; do
        if [[ "$url" =~ \.$ext$ ]]; then
            echo "$ext"
            return
        fi
    done

    echo ""
}

cat utils.json | jq '.[]' -c | while IFS= read -r item; do
    # see https://stackoverflow.com/questions/44656515/how-to-remove-double-quotes-in-jq-output-for-parsing-json-files-in-bash
    url=$(jq -r '.url' <<< $item)
    name=$(jq -r '.name' <<< $item)
    ext=$(extension $url)
    wget -q $url -O ~/install/"$name.$ext"

    # todo: unzip or tar base on ext
    tar -xf ~/install/"$name.$ext" -C ~/.codespace/bin

    # dont move if rename is missing
    pattern=$(jq -r '.rename' <<< $item)
    if [ "$line" != "null" ]; then
        from=$(find ~/.codespace/bin -maxdepth 1 -type d -name $pattern)
        to="$(echo ~)"/.codespace/bin/"$name"
        # check if it is the same name before rename
        if [ ! "$from" = "$to" ]; then
            echo "rename $from to $to"
            mv $from $to
        fi
    fi
done
