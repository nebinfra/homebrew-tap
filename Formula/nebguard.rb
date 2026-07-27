# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.27.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.1/nebguard_5.27.1_darwin_all.tar.gz"
    sha256 "4d2e5f1eaf08548e61ff84d5e3665b79f772cf0e17af02a4e901b81ad0760e18"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.1/nebguard_5.27.1_linux_arm64.tar.gz"
      sha256 "d717de8d3104d2f72d2929d2ce4533439aa718b4c115b579b5d9d408b20e0f44"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.1/nebguard_5.27.1_linux_amd64.tar.gz"
      sha256 "804a79b02963ececa36300dde008f50deeff531b7d99265ea303a1bdc154217f"
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
