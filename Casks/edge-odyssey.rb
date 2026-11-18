cask "edge-odyssey" do
  version "0.6.2"
  sha256 "9d6ff03b9b246cf0cad5cc53fa539a90f699bd887615316c92010160dbe61dda"

  url "https://github.com/s3onghyun/edge-odyssey/releases/download/v#{version}/Edge-Odyssey-#{version}-arm64.zip"
  name "Edge Odyssey"
  desc "Pomodoro voyage around the screen edge that glows when Claude Code needs you"
  homepage "https://github.com/s3onghyun/edge-odyssey"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Edge Odyssey.app"

  uninstall quit: "app.edgeodyssey"

  # ~/.edge-odyssey stays: Claude Code hooks may still point at its scripts.
  zap trash: "~/Library/Preferences/app.edgeodyssey.plist"
end
