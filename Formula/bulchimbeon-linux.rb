class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.2/bulchimbeon_0.7.2_linux_amd64.tar.gz"
      sha256 "578d854440b81202476b1be070c53367a6dabe18f2c2e55e992008e308fa323a"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.2/bulchimbeon_0.7.2_linux_arm64.tar.gz"
      sha256 "e616fbd2e0f3e9a044d2f49464912e72cb4ed953f1d1c27678a9882715709f25"
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
