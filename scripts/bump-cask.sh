#!/bin/sh
# Point a cask at a release: version and sha256 (read from the release's .sha256 asset).
#   scripts/bump-cask.sh token-yugong          # the latest release
#   scripts/bump-cask.sh edge-odyssey 0.3.1    # a given version
set -eu
cask="$(dirname "$0")/../Casks/$1.rb"
repo=$(sed -n 's|^ *homepage "https://github.com/\(.*\)"|\1|p' "$cask")
version=${2:-$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" | sed -n 's/^ *"tag_name": "v\{0,1\}\(.*\)",$/\1/p')}
url=$(sed -n 's/^ *url "\(.*\)"$/\1/p' "$cask" | sed "s/#{version}/$version/g")
sha=$(curl -fsSL "$url.sha256" | cut -d' ' -f1)
case $sha in *[!0-9a-f]* | "") echo "no sha256 for $url" >&2; exit 1 ;; esac
[ ${#sha} -eq 64 ] || { echo "bad sha256 for $url" >&2; exit 1; }
sed -i.bak -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" "$cask" && rm "$cask.bak"
echo "$1 $version $sha"
