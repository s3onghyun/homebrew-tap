cask "bulchimbeon" do
  version "0.12.6"
  sha256 "f43301ea556e28587f86a23150a95c32d19246d7547ae9ba2a451c49b0267acc"

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
    Verify the download (optional):
      gh attestation verify <zip> --repo s3onghyun/bulchimbeon
  EOS
end
