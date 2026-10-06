# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.35.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.35.0/nebguard_5.35.0_darwin_all.tar.gz"
    sha256 "0053f440d7907a34efdcef311997cf210b5982dbb55814904a83c4c9daddde43"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.35.0/nebguard_5.35.0_linux_arm64.tar.gz"
      sha256 "da785fc3fa5fc5a174523106d6995ea7a7d2ca0416a4f77e37c4018cad8f6fa8"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.35.0/nebguard_5.35.0_linux_amd64.tar.gz"
      sha256 "00b5e8d5fba2eb27ea876f9aefe684dfab8cbc9b5a95338990ab3eabb8c4f59e"
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
