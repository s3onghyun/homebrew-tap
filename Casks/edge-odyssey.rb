cask "edge-odyssey" do
  version "0.8.0"
  sha256 "70b20de0ea9bbfad194b0b8d300cd35eef7b7459bab98351431b9395792ac5c4"

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
