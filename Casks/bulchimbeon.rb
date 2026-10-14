cask "bulchimbeon" do
  version "0.6.8"
  sha256 "a385c721cee76a923f184f98f230559543cecf1d5c1c0dc91f2fb591404ce8fe"

  url "https://github.com/s3onghyun/bulchimbeon/releases/download/v#{version}/Bulchimbeon-#{version}.zip"
  name "Bulchimbeon"
  name "불침번"
  desc "Menu bar night-watch soldier that keeps the computer awake while AI agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"

  depends_on macos: :ventura

  app "Bulchimbeon.app"

  uninstall quit: "io.github.s3onghyun.bulchimbeon"

  zap trash: [
    "~/Library/Application Support/Bulchimbeon",
    "~/Library/Preferences/io.github.s3onghyun.bulchimbeon.plist",
  ]

  caveats <<~EOS
    Bulchimbeon is ad-hoc signed and not notarized by Apple yet.
    On first launch macOS will block it: open it once, then go to
      System Settings → Privacy & Security → "Open Anyway".

    아직 Apple 공증 전이라 첫 실행 때 macOS 가 막습니다.
    한 번 연 뒤 시스템 설정 → 개인정보 보호 및 보안 → "그래도 열기" 를 눌러주세요.

    Verify the download (optional):
      gh attestation verify <zip> --repo s3onghyun/bulchimbeon
  EOS
end
