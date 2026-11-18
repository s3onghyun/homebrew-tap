cask "edge-odyssey" do
  version "0.7.0"
  sha256 "15c924799e4953ccc4c3f15baa9df099d9ecfe959145f96a8d580eb12e8b298d"

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
