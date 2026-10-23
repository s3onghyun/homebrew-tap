class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.3/bulchimbeon_0.7.3_linux_amd64.tar.gz"
      sha256 "802d65897bf22e41513eaabbed998f3427a99d5df3ddea484929cb2b077d1365"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.7.3/bulchimbeon_0.7.3_linux_arm64.tar.gz"
      sha256 "1b0a706cbc328bba7b774b1fc45a5a88d2059c7fc49de2fdb7c3ada7d9d542d4"
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
