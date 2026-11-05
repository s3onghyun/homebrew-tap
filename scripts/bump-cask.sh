#!/bin/sh
# Point a cask at a release: version and sha256 (read from the release's .sha256 asset).
#   scripts/bump-cask.sh token-yugong          # the latest release
#   scripts/bump-cask.sh edge-odyssey 0.3.1    # a given version
set -eu
cask="$(dirname "$0")/../Casks/$1.rb"
repo=$(sed -n 's|^ *homepage "https://github.com/\(.*\)"|\1|p' "$cask")
# gh authenticates with GH_TOKEN: the anonymous API is rate-limited (403) on shared runner IPs
version=${2:-$(gh release view -R "$repo" --json tagName -q .tagName | sed 's/^v//')}
[ -n "$version" ] || { echo "no latest release for $repo" >&2; exit 1; }
url=$(sed -n 's/^ *url "\(.*\)"$/\1/p' "$cask" | sed "s/#{version}/$version/g")
sha=$(curl -fsSL "$url.sha256" | cut -d' ' -f1)
case $sha in *[!0-9a-f]*) sha= ;; esac
[ "${#sha}" -eq 64 ] || { echo "no sha256 at $url.sha256" >&2; exit 1; }
sed -i.bak -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" "$cask" && rm "$cask.bak"
echo "$1 $version $sha"
