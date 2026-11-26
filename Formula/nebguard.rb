# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.47.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.0/nebguard_5.47.0_darwin_all.tar.gz"
    sha256 "ee3c125e40d515b29394b798c321863e18fcb934f5e364001a36bde62d611281"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.0/nebguard_5.47.0_linux_arm64.tar.gz"
      sha256 "8f6e97fe2097bff57bff4b0c9a4afa4e3a4bea3a8a6237d96f952f0c5ad2d6ac"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.0/nebguard_5.47.0_linux_amd64.tar.gz"
      sha256 "e55d916ff03c7b4bae1725ab25c6c823f3e65eaf0071abec0338588d8926da20"
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
