# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.42.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.42.0/nebguard_5.42.0_darwin_all.tar.gz"
    sha256 "72def228dba8a3c769fd35808ac3b7f5aab4d2c0fd6317ce3f2c0727fb0a05cb"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.42.0/nebguard_5.42.0_linux_arm64.tar.gz"
      sha256 "62735ffc335d30fb8058de90f56dfeaa84f3b0f6c4c1f2855f3f53dc89a91fed"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.42.0/nebguard_5.42.0_linux_amd64.tar.gz"
      sha256 "b2327c0790c3bb48cc6f0a583b0e9a5d7ed2b12080f7027aedbcabad51063283"
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
