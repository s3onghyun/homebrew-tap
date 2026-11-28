class AgentOtelKit < Formula
  desc "Point Claude Code, Codex, Gemini CLI and Qwen Code at a local OTel stack"
  homepage "https://github.com/s3onghyun/agent-otel-kit"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.3.0/agent-otel-kit_0.3.0_darwin_amd64.tar.gz"
      sha256 "e842cc6b309363698b7a113f031427993361ba83fc5e836ab740495969a3abfb"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.3.0/agent-otel-kit_0.3.0_darwin_arm64.tar.gz"
      sha256 "d93426427ed0b44b4ac118f1343ecf16862cc135d3d6df7893514a2fd8252220"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.3.0/agent-otel-kit_0.3.0_linux_amd64.tar.gz"
      sha256 "7c56b907e8255a5dc6f70edc7ff9a6d2cccb832f38bc68470f1be2af4d652596"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.3.0/agent-otel-kit_0.3.0_linux_arm64.tar.gz"
      sha256 "bd9f71627f8f3698b5d1934a4010a21dc31e2104aee49ab2e72d8c0161c8451a"
    end
  end

  def install
    bin.install "agent-otel-kit"
  end

  def caveats
    <<~EOS
      The CLI configures the agents and checks the stack. The stack itself
      (collector, Prometheus, Loki, Tempo, Grafana) runs from the repository:
        git clone https://github.com/s3onghyun/agent-otel-kit
        cd agent-otel-kit && docker compose up -d
    EOS
  end

  test do
    assert_match "agent-otel-kit #{version}", shell_output("#{bin}/agent-otel-kit version")
  end
end
