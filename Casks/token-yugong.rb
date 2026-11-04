cask "token-yugong" do
  version "0.2.1"
  sha256 "7f3d2685b586edac3c1a4b264c712e3637099d79a89ff199234deebabdf60f79"

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

  # ~/.claude/token-pet stays: ~/.claude/settings.json may still run its bridge script.
  zap trash: [
    "~/Library/Application Support/TokenPet",
    "~/Library/Preferences/TokenPet.plist",
  ]

  caveats <<~EOS
    Token Yugong is ad-hoc signed and not notarized by Apple yet.
    On first launch macOS will block it: open it once, then go to
      System Settings → Privacy & Security → "Open Anyway".

    아직 Apple 공증 전이라 첫 실행 때 macOS 가 막습니다.
    한 번 연 뒤 시스템 설정 → 개인정보 보호 및 보안 → "그래도 열기" 를 눌러주세요.

    Before uninstalling, remove the "statusLine" entry for Token Yugong
    from ~/.claude/settings.json (the app's guide has an Undo button).
  EOS
end
