# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.28.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.0/nebguard_5.28.0_darwin_all.tar.gz"
    sha256 "200a41c3ccc63a48190ec04acac21ce8636e63fa664ac1bb7c609af8de0d1f4a"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.0/nebguard_5.28.0_linux_arm64.tar.gz"
      sha256 "bc79d72c1f733842e6c4255932d3b9fa0f00ef3c4db609264b81fd43988a7ce4"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.0/nebguard_5.28.0_linux_amd64.tar.gz"
      sha256 "dfb4a0b4d1e3f014ba579f14d6ae931cccdb258d570eae4c22afe82c5df72e1c"
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
