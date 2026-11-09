class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.2/bulchimbeon_0.12.2_linux_amd64.tar.gz"
      sha256 "e452fa9e1908c478d1bb751db780c480f34c0293290cb21b5ea224dd4b5b1e18"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.2/bulchimbeon_0.12.2_linux_arm64.tar.gz"
      sha256 "8dcb4eb30c35b3b26d0d09a6c93916986e704fadbdaddd0b0f5eca744ffe85d6"
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
