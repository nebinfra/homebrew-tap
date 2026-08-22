# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.31.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.0/nebguard_5.31.0_darwin_all.tar.gz"
    sha256 "e4ea9b78168a69ec117bef44e252528d660cf650aa33836521e2c7bd6548d8ab"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.0/nebguard_5.31.0_linux_arm64.tar.gz"
      sha256 "d536e56033c6bc0e1d7d5c43a8d8682f173866700867f9d15aaa835e4fdb9f97"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.0/nebguard_5.31.0_linux_amd64.tar.gz"
      sha256 "76d191d5712d8b11bc9b75e58d7154df0dae45b0a640237755df2c6b804ff5b3"
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
