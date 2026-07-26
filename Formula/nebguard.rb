# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.7"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.7/nebguard_5.23.7_darwin_all.tar.gz"
    sha256 "d3dcf6f4c0d156ecb6058411f212ac535ea8bb003253e818b7a454909d102c9c"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.7/nebguard_5.23.7_linux_arm64.tar.gz"
      sha256 "33e3d3fa4bdc1b358fc75ef8580373fc42128a68c0952371172850740ed8711b"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.7/nebguard_5.23.7_linux_amd64.tar.gz"
      sha256 "b2814de4779e88d5d5a763d4f421c7d47de1ca8fb64438708a176ab7c2012372"
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
