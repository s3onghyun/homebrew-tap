class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.0/bulchimbeon_0.10.0_linux_amd64.tar.gz"
      sha256 "3b6e95968989983c0a02f560aa8281dd0704358265179c6b264f5a6a3190448c"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.0/bulchimbeon_0.10.0_linux_arm64.tar.gz"
      sha256 "0c96ed2710237ff589b638f571c3639d249907f162067ca9288f0fc933db51d9"
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
