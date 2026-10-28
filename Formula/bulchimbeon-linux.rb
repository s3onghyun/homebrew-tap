class BulchimbeonLinux < Formula
  desc "Keep the machine awake while AI coding agents work"
  homepage "https://github.com/s3onghyun/bulchimbeon"
  license "MIT"

  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.1/bulchimbeon_0.10.1_linux_amd64.tar.gz"
      sha256 "b729d34320ab854f23c73f770fe5d9c919a176b24512e048f63bc73b31b529e5"
    end
    on_arm do
      url "https://github.com/s3onghyun/bulchimbeon/releases/download/v0.10.1/bulchimbeon_0.10.1_linux_arm64.tar.gz"
      sha256 "ae9ccf4228f436919cc7e12ffa290de37dcaed193246218e2bdaa85b6c18b8a7"
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
