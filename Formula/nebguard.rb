# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.37.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.2/nebguard_5.37.2_darwin_all.tar.gz"
    sha256 "7905b856c4508347181f4b1bea0259f462e7232fe3fcd6f43a7e387fee956216"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.2/nebguard_5.37.2_linux_arm64.tar.gz"
      sha256 "c9b7fcbf6b3999f9e8fc24db1a97da4a61f38cd0da5eb64ae1b4222b83aef273"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.2/nebguard_5.37.2_linux_amd64.tar.gz"
      sha256 "5b7befdaa8d84905c6ad1df123ca3487d67cd9e40d2e4d4d08b4f6b455c26656"
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
