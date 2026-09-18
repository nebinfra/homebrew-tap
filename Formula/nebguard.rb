# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.33.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.33.0/nebguard_5.33.0_darwin_all.tar.gz"
    sha256 "3f3e13df9b4bde560c6f86951695cf6ea02611fe2e7179a4d28de7006d65d00c"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.33.0/nebguard_5.33.0_linux_arm64.tar.gz"
      sha256 "7c5047102830d9fd8ae022d50af57c9e74e2dfa7aa54c128b910b9ce64100851"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.33.0/nebguard_5.33.0_linux_amd64.tar.gz"
      sha256 "4bb912c83c0e1ee21eebf56f0101457523439b7ea41296f21d48a9e4bf5dc935"
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
