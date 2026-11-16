class AgentOtelKit < Formula
  desc "Point Claude Code, Codex, Gemini CLI and Qwen Code at a local OTel stack"
  homepage "https://github.com/s3onghyun/agent-otel-kit"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.2.0/agent-otel-kit_0.2.0_darwin_amd64.tar.gz"
      sha256 "c566f0cd9266aba3a380ac018572055018b159d9b6f6d1866efaede5e29ebe14"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.2.0/agent-otel-kit_0.2.0_darwin_arm64.tar.gz"
      sha256 "04eef92703ffb4a6530988dae650e8695e131a4845a6b0ff327179c029426c43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.2.0/agent-otel-kit_0.2.0_linux_amd64.tar.gz"
      sha256 "a1219171f9f86ff12873622166f6b2d1fd2760d44a4b439f6bb7ceed4a955063"
    end
    on_arm do
      url "https://github.com/s3onghyun/agent-otel-kit/releases/download/v0.2.0/agent-otel-kit_0.2.0_linux_arm64.tar.gz"
      sha256 "a03123c568a088c2cd0a199f52d6e1b45a8df0c7fafc89dcf6093d780cea1fa1"
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
