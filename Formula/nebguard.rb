# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.24.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.24.0/nebguard_5.24.0_darwin_all.tar.gz"
    sha256 "5680461cd0bea8dc1ec618daa9735b9e8280264faf340e059d11c8236143236d"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.24.0/nebguard_5.24.0_linux_arm64.tar.gz"
      sha256 "92ed7522d3ed75bbdb94c2b388f2fea4cba09c2bc824bd0c58b6eff476943f6e"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.24.0/nebguard_5.24.0_linux_amd64.tar.gz"
      sha256 "4d3b0e65e83803d4e3c35c2377a5a5ff046ec593bbbfb4e2e584965f8fddfa40"
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
