class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.8.0/bulchimbeon_0.8.0_linux_amd64.tar.gz"
      sha256 "fd58da09c2d1e34861b5a0af92da5d14858661ff9dd9a57a96d1b5e03d9712ea"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.8.0/bulchimbeon_0.8.0_linux_arm64.tar.gz"
      sha256 "31aae76d18d785d511829b1322a0b67694fd4b18d39817d9fe6739237cb5d0a4"
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
