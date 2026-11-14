# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.46.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.46.0/nebguard_5.46.0_darwin_all.tar.gz"
    sha256 "cea8470ce2dfaf765da4b35b5498ed43f4f8138090db2af5c764cd4799d4d49f"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.46.0/nebguard_5.46.0_linux_arm64.tar.gz"
      sha256 "9f964332e2191d99136fab0d4f0920baaa245599bbdf6fa14558520c17624dcc"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.46.0/nebguard_5.46.0_linux_amd64.tar.gz"
      sha256 "98505656137c74ca34ed15b56155e33e9b9545ecfdc08e305dbabe64b9cf2c1a"
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
