# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.39.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.39.0/nebguard_5.39.0_darwin_all.tar.gz"
    sha256 "408d4e1d1f22235475d73be79adcee0dba29060cd7ce23aecc429c1e24dcb332"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.39.0/nebguard_5.39.0_linux_arm64.tar.gz"
      sha256 "87ca19fa3c234c2f29b8521f3b583a8bbc22655d4b6e96fb00f2ad6f241f1087"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.39.0/nebguard_5.39.0_linux_amd64.tar.gz"
      sha256 "1eb06e287fcf0ad6cdb29e7ac4a7507367bba5794e2694540e0ca0b1ae75951d"
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
