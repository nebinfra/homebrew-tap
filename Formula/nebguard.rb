# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.37.5"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.5/nebguard_5.37.5_darwin_all.tar.gz"
    sha256 "94ccd1121ca7ed2a4d445b2918b430ee07e206e14cf8771ba2cb5cc4a9acc240"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.5/nebguard_5.37.5_linux_arm64.tar.gz"
      sha256 "a086ab0cce6d5de47d6c8fc147fe4a9c971174b43affbbf0c73afb9b403d344a"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.5/nebguard_5.37.5_linux_amd64.tar.gz"
      sha256 "4d2510494a7cbff5a93711968ba940d4f69c204a1b395d5728b33df372efa4ec"
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
