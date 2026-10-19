# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.37.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.3/nebguard_5.37.3_darwin_all.tar.gz"
    sha256 "5059d31ee488ec8ade187bec67cad751b4870a0c805a5b0f5400acfdf27e85cc"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.3/nebguard_5.37.3_linux_arm64.tar.gz"
      sha256 "8d096879478ad395479dbb6abb0f75c0ab4b3e4e3980e9587341f9fcc3ad70b4"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.3/nebguard_5.37.3_linux_amd64.tar.gz"
      sha256 "236f931d111916770a0412bea933eebef7c3a5c994d239d4ad5e60dceb95b613"
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
