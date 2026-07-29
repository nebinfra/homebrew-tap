# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.27.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.2/nebguard_5.27.2_darwin_all.tar.gz"
    sha256 "0c83e502d645bda51a396c6186b2b7ecf0ab5db26a530cb97724b0d3c9dd81b1"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.2/nebguard_5.27.2_linux_arm64.tar.gz"
      sha256 "64594c1c953d74a005d73bcbb91ef9f2afeb068d97ea16fe859cd151c2e354ea"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.2/nebguard_5.27.2_linux_amd64.tar.gz"
      sha256 "5d482ae9d78fbb70f2c2624d3c2b6964afe272f6407e0a10635bed523a0157a3"
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
