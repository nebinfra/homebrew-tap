# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.25.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.25.0/nebguard_5.25.0_darwin_all.tar.gz"
    sha256 "665fb8604b8b58f933fe3370722ba4226d082c81a3cbc395256c6ede01d14c63"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.25.0/nebguard_5.25.0_linux_arm64.tar.gz"
      sha256 "360acd366e834930255580d8fe190a37db7f2f55cd1f39a3f670047229e5aaa7"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.25.0/nebguard_5.25.0_linux_amd64.tar.gz"
      sha256 "5ee0ddb661b1f424e943cf76c91966c4e0f95a24bd6f25fe1bf37cca041d52c6"
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
