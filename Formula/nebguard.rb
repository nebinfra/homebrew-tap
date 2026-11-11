# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.45.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.3/nebguard_5.45.3_darwin_all.tar.gz"
    sha256 "c203e031d81752dc30480084230f8f0807185085d05f01c838430b9be1bb0077"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.3/nebguard_5.45.3_linux_arm64.tar.gz"
      sha256 "c775d77b2bee3411e0d903e9a481ef49fe92cf59e2608c05cf4cc908572026dc"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.3/nebguard_5.45.3_linux_amd64.tar.gz"
      sha256 "79c7fc2d1d067ea5ca707fabd8d8959585828e1bd1114155733425912418faa3"
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
