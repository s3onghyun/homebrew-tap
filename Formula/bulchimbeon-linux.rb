class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.9.0/bulchimbeon_0.9.0_linux_amd64.tar.gz"
      sha256 "1113469e1da21eb58944d9a5384a84fec84602d31fef365613077e229f7fae0d"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.9.0/bulchimbeon_0.9.0_linux_arm64.tar.gz"
      sha256 "348840890b84c4be92c5ddd9326c99ea503054bdad5b5c07819c9356fe7f69fe"
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
