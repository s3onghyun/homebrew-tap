class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.8.1/bulchimbeon_0.8.1_linux_amd64.tar.gz"
      sha256 "ef8a1b7f57a987442693a02022d5675dbb81419eaf0cf59d1783a54fbd970401"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.8.1/bulchimbeon_0.8.1_linux_arm64.tar.gz"
      sha256 "59a2fab58d57b9d4d5ae8c15561018319ad6c85f08c54130acf9b36aa6a2ddd7"
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
