class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.0/bulchimbeon_0.12.0_linux_amd64.tar.gz"
      sha256 "710d335242342c34b104aea1e4fa889f8e89d343e7ffdab36f0a575546e4362e"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.12.0/bulchimbeon_0.12.0_linux_arm64.tar.gz"
      sha256 "c36cef8e503b1a4c89fc9feb7ab1be806c6e1548f115bf00b1837b5daba19d8f"
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
