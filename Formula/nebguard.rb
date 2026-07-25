# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.6"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.6/nebguard_5.23.6_darwin_all.tar.gz"
    sha256 "021a652e34594a595a030a407c9e970a6e8c15db2acea0b34615191d02a83433"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.6/nebguard_5.23.6_linux_arm64.tar.gz"
      sha256 "c96ba378e651500fd4f525b80583686d5b4aba57a274bfd8015f243f8c63f5d2"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.6/nebguard_5.23.6_linux_amd64.tar.gz"
      sha256 "7fb329dda4aa4755221d860c007d8db10b0a563709ddc8d42b4bfed7eefa7de7"
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
