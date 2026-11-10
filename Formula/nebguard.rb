# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.45.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.2/nebguard_5.45.2_darwin_all.tar.gz"
    sha256 "f666f1677ebba146c7b040a83cca0355606de3964fa069fa26d0b56b5214ed51"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.2/nebguard_5.45.2_linux_arm64.tar.gz"
      sha256 "229c53f279d17e0568303a82856864d7e235d5a2521184f4de293ed127d9d0f3"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.2/nebguard_5.45.2_linux_amd64.tar.gz"
      sha256 "8637e7c5392775e2079643fb3ee9ca02e1ec31b3dd363873ce226047f326c999"
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
