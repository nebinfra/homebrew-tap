# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.29.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.1/nebguard_5.29.1_darwin_all.tar.gz"
    sha256 "8b7b6c65f70881e5dd890507efe60ab20f33d12f4264dfd812c4db6bc8ec99e0"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.1/nebguard_5.29.1_linux_arm64.tar.gz"
      sha256 "732362c25d8c7f902e61c552c6f741139ec1a2d8738806fe97101848d00dc953"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.1/nebguard_5.29.1_linux_amd64.tar.gz"
      sha256 "f2da89eb6ed69ed6dc7a429b805c61b0af5c9830d98a1766c80941b38a575393"
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
