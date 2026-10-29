class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.2/bulchimbeon_0.10.2_linux_amd64.tar.gz"
      sha256 "787f74d98ea64f079de8d73ef33751f958597f4f90fcd4702fc8e44442833c5c"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.2/bulchimbeon_0.10.2_linux_arm64.tar.gz"
      sha256 "fe3328160d0cee6a2aaf1c33659f30b8f33d57e32a15b9971ff357a19dce3128"
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
