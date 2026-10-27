# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.41.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.1/nebguard_5.41.1_darwin_all.tar.gz"
    sha256 "e5acefacaf23df413c0b498a05d5334fb16e6d51d38a8eb69032efc4c9ba06be"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.1/nebguard_5.41.1_linux_arm64.tar.gz"
      sha256 "556bd64d897d14d881e3b303e3851055d356921413d5124ed5228850f2b22ce4"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.41.1/nebguard_5.41.1_linux_amd64.tar.gz"
      sha256 "cba0c83372ee3c43f1f3c0b8d0b3f21eecda23c5b92ea69b2ea5cc213e0022c6"
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
