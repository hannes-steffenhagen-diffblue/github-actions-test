read -r version_line
major=$(echo $version_line | cut -d . -f 1)
minor=$(echo $version_line | cut -d . -f 2)
patch=$(echo $version_line | cut -d . -f 3)
echo "$major.$minor.$(expr $patch + 1)"
