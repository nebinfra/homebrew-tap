# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.47.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.1/nebguard_5.47.1_darwin_all.tar.gz"
    sha256 "1fed04af15a5aa392d127f0ad2480fd6b28c1224fd2f8f424186d85703a32d41"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.1/nebguard_5.47.1_linux_arm64.tar.gz"
      sha256 "63aaed77354db5b7136628826f35c3b3b71a3e413112ac6fb89ea2b05f32fac6"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.1/nebguard_5.47.1_linux_amd64.tar.gz"
      sha256 "e07bc2e159cad1d8352511007aaa4a7e30f80858ca42068a7303599e1a631351"
    end
  end

  def install
    bin.install "nebguard"
  end

  test do
    system "#{bin}/nebguard", "version"
  end

  def caveats
    <<~EOS
      Wire NebGuard into your AI CLI:
        nebguard setup claude-code   # Claude Code
        nebguard setup codex-cli     # Codex CLI
      
    EOS
  end
end
