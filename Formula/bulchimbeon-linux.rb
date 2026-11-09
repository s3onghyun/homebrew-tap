class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.3/bulchimbeon_0.12.3_linux_amd64.tar.gz"
      sha256 "950745e7591bd3e25d82bb5b3796ae69001465a5130dce543002025d655ff6c7"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.3/bulchimbeon_0.12.3_linux_arm64.tar.gz"
      sha256 "a0e8b9235c256f6d0c668505d82a58b4b6d8d01b2fa5c6a27836be5a699d80e0"
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
