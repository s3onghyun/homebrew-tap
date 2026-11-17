class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.6/bulchimbeon_0.12.6_linux_amd64.tar.gz"
      sha256 "d144f4366b87de0d7269d40c4c8df044af179a71e1ec2158afdbb9af0017af60"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.6/bulchimbeon_0.12.6_linux_arm64.tar.gz"
      sha256 "25b782b60413cffe42f01f12acabb46a0a867e584d612693d6b8b479e6043b3b"
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
