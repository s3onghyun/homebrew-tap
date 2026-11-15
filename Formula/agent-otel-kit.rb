class AgentOtelKit < Formula
  desc "Point Claude Code, Codex and Gemini CLI at a local OpenTelemetry stack"
  homepage "https://github.com/s3onghyun/agent-otel-kit"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.1.0/agent-otel-kit_0.1.0_darwin_amd64.tar.gz"
      sha256 "f0a8899e14150b28b7556acdcafa8f638e28216abc8a32d964cc90c69e3d76eb"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.1.0/agent-otel-kit_0.1.0_darwin_arm64.tar.gz"
      sha256 "baed389021359034954a69c69c856fac482c4781184176313c5b6c6a2b9473f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.1.0/agent-otel-kit_0.1.0_linux_amd64.tar.gz"
      sha256 "6f615e15b417c51a55eb955e42475b986b9e43f5d0ce67d19f11e02872fd3add"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.1.0/agent-otel-kit_0.1.0_linux_arm64.tar.gz"
      sha256 "f8e28becc2266887ad055692ebc81a81c9eef511fe922777dd9592776777b24e"
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
