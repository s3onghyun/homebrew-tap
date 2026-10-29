class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.11.0/bulchimbeon_0.11.0_linux_amd64.tar.gz"
      sha256 "b2dfa3663a41447f173861723bfe6841cb76d9d9994549f5d7f0fc33ff32350f"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.11.0/bulchimbeon_0.11.0_linux_arm64.tar.gz"
      sha256 "052c3082b332a9298b7afd8c99d69aa54d8123c12ef35d88662ab76ebe12b7f9"
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
