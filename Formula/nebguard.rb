# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.45.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.1/nebguard_5.45.1_darwin_all.tar.gz"
    sha256 "22ffbf7a465c39200715de519d162d45ca8faf76d96c0ba95f93728db76962b0"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.1/nebguard_5.45.1_linux_arm64.tar.gz"
      sha256 "bcb7810d52912c35fb49bda37b3c2fd3a35fbc6670bc2ebf1eec296dc2dbf99d"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.1/nebguard_5.45.1_linux_amd64.tar.gz"
      sha256 "0a42f8890e05137c2bd997b393e482d71a0c1af8b6c6499eb40637b695e5f9a8"
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
