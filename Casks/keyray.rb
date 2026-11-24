cask "keyray" do
  version "0.3.2"
  sha256 "359c1f7d190010fae82bf79afcdbb906db7c6096f36aecc4004c143de2dba6ac"

  url "https://github.com/s3onghyun/keyray/releases/download/v#{version}/Keyray-#{version}.dmg"
  name "Keyray"
  name "키레이"
  desc "Show keystrokes and shortcuts on screen, with announcements from AI agents"
  homepage "https://github.com/s3onghyun/keyray"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Keyray.app"
  binary "#{appdir}/Keyray.app/Contents/MacOS/Keyray", target: "keyray"

  uninstall quit: "com.s3onghyun.keyray"

  zap trash: "~/Library/Containers/com.s3onghyun.keyray"
end
