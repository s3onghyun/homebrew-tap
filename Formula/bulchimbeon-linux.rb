class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.0/bulchimbeon_0.7.0_linux_amd64.tar.gz"
      sha256 "0d0ed91319da6a452f9a66bf29d28dbad2708aa52cadce90e4788462be2ac6b4"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.0/bulchimbeon_0.7.0_linux_arm64.tar.gz"
      sha256 "3e61673848bfc48b3b47f88e49821f37e09bf7621044b70fc3d6c116c6a47386"
    end
  end

  def install
    bin.install "bulchimbeon"
  end

  service do
    run [opt_bin/"bulchimbeon", "run"]
    keep_alive crashed: true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bulchimbeon version")
  end
end
