class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.1/bulchimbeon_0.7.1_linux_amd64.tar.gz"
      sha256 "a0487a32ffbda4b23a9d622fcd418c23b4cd53dd07bec8894142c40d1d966395"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.1/bulchimbeon_0.7.1_linux_arm64.tar.gz"
      sha256 "94912032cf8fac0e0cb0789a590645f32b1400534cd598d9fba3fa1c4bd69226"
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
