# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.47.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.3/nebguard_5.47.3_darwin_all.tar.gz"
    sha256 "07a743c6323f1c8e1bcb6427b3214791b33264851403c3e3d6d8bf2e3e884079"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.3/nebguard_5.47.3_linux_arm64.tar.gz"
      sha256 "d6bdc524e874b4d214616739f50595207578f0f485258f4715faeb51b938a91f"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.47.3/nebguard_5.47.3_linux_amd64.tar.gz"
      sha256 "e5dc6967a80027f329439c6c974a07e1919d7b354ee886f5139e72256f3318ed"
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
