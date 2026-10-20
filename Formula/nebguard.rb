# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.38.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.38.0/nebguard_5.38.0_darwin_all.tar.gz"
    sha256 "9198751a192885c3f8d971540e30038aa44db7c88d8093fc27ca6289f5251118"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.38.0/nebguard_5.38.0_linux_arm64.tar.gz"
      sha256 "4f198b8632beea045d8fea4318a2508fd5678b2e5457bf6d84e3a78b8bf6b0d0"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.38.0/nebguard_5.38.0_linux_amd64.tar.gz"
      sha256 "3d645e0c061731820f55d9202b04d35c38ba29948330558af0d65f7a8b34ddff"
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
