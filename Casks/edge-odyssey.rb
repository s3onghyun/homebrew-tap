cask "edge-odyssey" do
  version "0.5.0"
  sha256 "b30d4114cd79832082174baa6716f565056767f77fc2d7ec90e75e073c68fab2"

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

  caveats <<~EOS
    Edge Odyssey is ad-hoc signed and not notarized by Apple yet.
    On first launch macOS will block it: open it once, then go to
      System Settings → Privacy & Security → "Open Anyway".

    아직 Apple 공증이 전혀 되지 않은 macOS 앱입니다.
    한 번 연 뒤 시스템 설정 → 개인정보 보호 및 보안 → "그래도 열기"를 눌러주세요.
  EOS
end
