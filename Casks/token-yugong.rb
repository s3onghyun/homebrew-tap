cask "token-yugong" do
  version "0.3.3"
  sha256 "4ca2ca7624935c92d873d40dc98b41e769bb284585693ce86cd2638bf6cc2a91"

  url "https://github.com/s3onghyun/token-yugong/releases/download/v#{version}/TokenYugong-#{version}-macos-universal.zip"
  name "Token Yugong"
  name "우공"
  desc "Pixel-art menu bar pet for Claude Code and Codex usage limits"
  homepage "https://github.com/s3onghyun/token-yugong"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "TokenYugong.app"

  uninstall quit: "dev.yugongpet.app"

  # ~/.claude/token-pet stays; ~/.claude/settings.json may still run its bridge script.
  zap trash: [
    "~/Library/Application Support/TokenPet",
    "~/Library/Preferences/TokenPet.plist",
  ]

  caveats <<~EOS
    Before uninstalling, remove the "statusLine" entry for Token Yugong
    from ~/.claude/settings.json (the app’s guide has an Undo button).
  EOS
end