# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.29.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.0/nebguard_5.29.0_darwin_all.tar.gz"
    sha256 "6732902daf2f4357c69b7c820e61d62168ed20156781309a665a12a8ae5c0dd8"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.0/nebguard_5.29.0_linux_arm64.tar.gz"
      sha256 "81591ab049a24a1286192df16d1dc7feee88fd481b09152e5acf1dc0443c4cdb"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.29.0/nebguard_5.29.0_linux_amd64.tar.gz"
      sha256 "11f4a31a00b82899a32498fea8a5b18545d057bc4669373d1b662fa7f79f6189"
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
