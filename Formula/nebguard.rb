# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.26.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.26.0/nebguard_5.26.0_darwin_all.tar.gz"
    sha256 "e2790e95e213fabb9cb0caf994400eb072d7b85a14326014305b839a75c02b2e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.26.0/nebguard_5.26.0_linux_arm64.tar.gz"
      sha256 "763f79b38f6d9893f749a308663d15fe81961d99b1eeeeef323dfbfd51e0e42c"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.26.0/nebguard_5.26.0_linux_amd64.tar.gz"
      sha256 "455c25e66ca81b58754b85c74e75b20c92d0980b9f2b679dab7944d009e5ba50"
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
