# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.34.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.34.0/nebguard_5.34.0_darwin_all.tar.gz"
    sha256 "bc1085995e02d50521e860cc979539431648e7276ba081f51c4bc85b550326d6"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.34.0/nebguard_5.34.0_linux_arm64.tar.gz"
      sha256 "6c57fca3a6492cd41b44534127f3a9bfadb04afc5c203c72ba28ce7207e5c6bd"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.34.0/nebguard_5.34.0_linux_amd64.tar.gz"
      sha256 "626d715f70bcedaa58484345b549d39864744a53163adbdd4cbae83fae2b31ad"
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
