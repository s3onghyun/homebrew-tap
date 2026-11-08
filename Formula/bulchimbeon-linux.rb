class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.1/bulchimbeon_0.12.1_linux_amd64.tar.gz"
      sha256 "97290505af7700094c5d21c8ecae1d53582739d1b6df976403925ba354df8168"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.1/bulchimbeon_0.12.1_linux_arm64.tar.gz"
      sha256 "aa79e27f992a1e1710caa3ac58e3faa81950c49f1e6d533b62987e954b4a62e4"
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
