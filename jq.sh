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

    # todo: dont move if rename if missing
    # check if it is same name before rename
    pattern=$(jq -r '.rename' <<< $item)
    from=$(find ~/.codespace/bin -maxdepth 1 -type d -name $pattern)
    to=~/.codespace/bin/"$name"
    mv $from $to
done
