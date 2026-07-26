# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.27.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.0/nebguard_5.27.0_darwin_all.tar.gz"
    sha256 "e6317f5b2a7a8bdc6728bdd23a082fefc1e3f570db463942e5c7a9ae8d4daafc"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.0/nebguard_5.27.0_linux_arm64.tar.gz"
      sha256 "50dee62f800e6f92d253d89e60099167fac8948f194ac7f7e7b1f750b1ed4cde"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.0/nebguard_5.27.0_linux_amd64.tar.gz"
      sha256 "fd15d652ab03c900697f6637cf6a2273d0f470f04859ce2ce09e55bb158213d3"
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
