cask "keyray" do
  version "0.3.3"
  sha256 "b25f4cc0e8eaac2da5cf29ba0932cbc5a2d669a9602a5e5505ef2d78ea66af17"

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
