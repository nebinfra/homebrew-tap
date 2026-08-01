# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.28.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.2/nebguard_5.28.2_darwin_all.tar.gz"
    sha256 "6e718b707d4f8ccb295c99e528677afd90c5e0bf4e9ad03acde0f0a0f61b67e2"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.2/nebguard_5.28.2_linux_arm64.tar.gz"
      sha256 "d1b2be3200d4677a245f57cacdf18aa73c0093cf9db4b1fb9fa11e8118a6d2b0"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.2/nebguard_5.28.2_linux_amd64.tar.gz"
      sha256 "0e0eb3cd3681131a4bfbb1eef4cf0d512edce38d8533278db60c8d73402517dd"
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
