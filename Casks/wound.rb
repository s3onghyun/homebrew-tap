cask "wound" do
  version "0.1.2"
  sha256 "ac9c64bb899157932fb8cbbf9e1dd301cfad9ed9505958b3ba548c7ba1a85eda"

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
end
