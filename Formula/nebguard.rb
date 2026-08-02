# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.28.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.3/nebguard_5.28.3_darwin_all.tar.gz"
    sha256 "7dc9ccc5ce507705bbb6adcfc4b59bf261bda633c2a6f92020ed24deaf27ee4d"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.3/nebguard_5.28.3_linux_arm64.tar.gz"
      sha256 "37fbc3d99571ceeb3bb3e4fdd5b0957260916b1dfb4fe443818f4de478e0a922"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.28.3/nebguard_5.28.3_linux_amd64.tar.gz"
      sha256 "85cfd683792325eb769ac83a23ddcb7c1920b7cef6e8c0a48f9424cc6c899cc6"
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
