cask "wound" do
  version "0.1.1"
  sha256 "120a04898f8bf2eb37778c0fd9f97c75c64cd05f8cd5e934c82bfce7236483b7"

  url "https://github.com/s3onghyun/wound/releases/download/v#{version}/Wound-#{version}-macos-universal.zip"
  name "Wound"
  desc "Mechanical watch for macOS that you have to wind"
  homepage "https://github.com/s3onghyun/wound"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Wound.app"

  uninstall quit: "com.s3onghyun.wound"

  zap trash: "~/Library/Preferences/com.s3onghyun.wound.plist"

  caveats <<~EOS
    Wound is ad-hoc signed and not notarized by Apple yet.
    On first launch macOS will block it: open it once, then go to
      System Settings → Privacy & Security → "Open Anyway".

    아직 Apple 공증 전이라 첫 실행 때 macOS 가 막습니다.
    한 번 연 뒤 시스템 설정 → 개인정보 보호 및 보안 → "그래도 열기" 를 눌러주세요.
  EOS
end
