# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.47.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.2/nebguard_5.47.2_darwin_all.tar.gz"
    sha256 "2f258e5bde2fbc02a58cb1c8f3f90e8a6bbbee35526a0b653be687f9a34b3bcd"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.2/nebguard_5.47.2_linux_arm64.tar.gz"
      sha256 "959673a43aca6408e43725e5f793ca5a6786b601f06ba43b321d05780f694ac4"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.2/nebguard_5.47.2_linux_amd64.tar.gz"
      sha256 "78b3859c9981046aec281650ccbbfa8751da0632f9e5ad3c84249302708b31aa"
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
