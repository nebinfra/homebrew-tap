# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.41.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.2/nebguard_5.41.2_darwin_all.tar.gz"
    sha256 "ee1685498284a33bba28805c184d436671e3397011f3da0fb5de04d410e1a9f4"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.2/nebguard_5.41.2_linux_arm64.tar.gz"
      sha256 "29eb5995e8407298495e4c2a70cc681c99f5674445fa3df3efaaee943fc9a1cc"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.2/nebguard_5.41.2_linux_amd64.tar.gz"
      sha256 "07b066cd43a85a779b66ddb0044668e07422173a2e1b22520fe678c90c1f0b2f"
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
