# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.28.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.1/nebguard_5.28.1_darwin_all.tar.gz"
    sha256 "9f66e84c90dad949cb6d007c6a1bf23dc6ba24774484c10eb2100d3d82e8fae0"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.1/nebguard_5.28.1_linux_arm64.tar.gz"
      sha256 "0be384bd4f0373e31cf4e6bed7cf30b6035fdc566f7b82cfe0ba77744fa3a03b"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.1/nebguard_5.28.1_linux_amd64.tar.gz"
      sha256 "55cf57620b1a283314220059de92bffbab4acceba53ef0bfa55d53b7d56c7afa"
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
