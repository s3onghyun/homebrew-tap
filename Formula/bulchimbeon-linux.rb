class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.4/bulchimbeon_0.12.4_linux_amd64.tar.gz"
      sha256 "b8c31200cd1078282b1090b0cbe42a7281945e4d610c16fbdf86487960ef5966"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.4/bulchimbeon_0.12.4_linux_arm64.tar.gz"
      sha256 "d3ec84b2c25e0cc7beab68e490239e72a2935c200824edeff7bfc8c6631d8400"
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
