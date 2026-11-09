# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.45.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.0/nebguard_5.45.0_darwin_all.tar.gz"
    sha256 "4959cad6e1e08e9efcc8b3e77c162768a98b223da259b9217d2f915a1ec18a9b"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.0/nebguard_5.45.0_linux_arm64.tar.gz"
      sha256 "4577c5749c6d2f2673a7f18a569a7fa128a91d9e73365caf06f57f37ddce7776"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.0/nebguard_5.45.0_linux_amd64.tar.gz"
      sha256 "e679074225a61d4ece51445f85a7443ebb6af6c36e4186c8a4f80e6d23501ad9"
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
