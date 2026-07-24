# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.5"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.5/nebguard_5.23.5_darwin_all.tar.gz"
    sha256 "f87fa5a0c4d17d12bf374bcb5a6aab0aff1e69e3fff4378b176a542d62eefc0e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.5/nebguard_5.23.5_linux_arm64.tar.gz"
      sha256 "9315adb593037246a66cedc806746d5ec8404a95434e3d0d2c68579d3a7584b7"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.5/nebguard_5.23.5_linux_amd64.tar.gz"
      sha256 "682b05f24d90d547f84b101e5397044c9ab75f945c49a2ae318debfcb3c64d0c"
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
