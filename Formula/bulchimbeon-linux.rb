class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.5/bulchimbeon_0.12.5_linux_amd64.tar.gz"
      sha256 "ffb1d7778df9dd80cad2cd6d22e9dd7cd48555dd88b1a36c3f79fc138ce0a202"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.5/bulchimbeon_0.12.5_linux_arm64.tar.gz"
      sha256 "7754777dd3e55e272403f5ad34dbc1e894ca7c7edad24cfb5be292f467a5767a"
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
