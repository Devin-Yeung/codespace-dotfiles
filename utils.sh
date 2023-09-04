#!/bin/bash

extension() {
    # input url
    local url=${1//\"/} # remove the quote if there are
    # List of valid archive extensions
    local valid=("zip" "tar.gz" "tbz")

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
    echo "downlaod $url to" ~/install/$name.$ext
    wget -q $url -O ~/install/"$name.$ext"

    mkdir -p ~/.codespace/bin/"$name"
    echo "create dir" ~/.codespace/bin/"$name"
    # unzip base on ext
    echo "extract" ~/install/"$name.$ext" "to" ~/.codespace/bin/"$name"
    if [ "$ext" = "tar.gz" ] || [ "$ext" = "tbz" ]; then
        tar -xf ~/install/"$name.$ext" -C ~/.codespace/bin/"$name"
    elif [ "$ext" = "zip" ]; then
        unzip -o -q ~/install/"$name.$ext" -d ~/.codespace/bin/"$name"
    fi

    # don't peel if field is missing
    pattern=$(jq -r '.peel' <<< $item)
    if [ "$pattern" != "null" ]; then
        from=$(find ~/.codespace/bin/$name -maxdepth 1 -type d -name $pattern)
        to="$(echo ~)"/.codespace/bin/$name
        # check if it is the same name before peel
        if [ ! "$from" = "$to" ]; then
            echo "peel $from/* to $to"
            mv $from/* $to
            rm -r $from
        fi
    fi

    path=$(jq -r '.path' <<< $item)
    bin=$(basename $path)
    echo "link ~/.codespace/bin/$name/$path to /usr/bin/$bin"
    sudo ln -sf ~/.codespace/bin/"$name/$path" /usr/bin/"$bin"
done

# tmux
sudo apt upgrade
sudo apt update
sudo apt install tmux -y
