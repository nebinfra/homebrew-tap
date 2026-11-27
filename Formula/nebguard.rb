# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.47.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.4/nebguard_5.47.4_darwin_all.tar.gz"
    sha256 "3cca3dffca3a53b7ab334819d03d7ac25c8978e9c135305293f167813952ec78"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.4/nebguard_5.47.4_linux_arm64.tar.gz"
      sha256 "6b9dbfd370874d3bf894dab1a91110bc31fde1792c414d2d8b285f1885c7ab7c"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.4/nebguard_5.47.4_linux_amd64.tar.gz"
      sha256 "fe2539b90b645561f36c07d636722c09cdb18d2f4fb3b8d863e3091bdc0cbb9b"
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
