# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.40.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.40.1/nebguard_5.40.1_darwin_all.tar.gz"
    sha256 "54fb8fca40b8a2de98407a3985de5774d6a4291f31697db7b19580027cd6ec05"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.40.1/nebguard_5.40.1_linux_arm64.tar.gz"
      sha256 "05a487f543ac84582658a02de0d8e1af6a380f7c10c986d63f377bb7004bc31f"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.40.1/nebguard_5.40.1_linux_amd64.tar.gz"
      sha256 "e39dfeb1c94c5073df98629ebb6ccd37fa8668ce5d839f52feaf738c89a2c0be"
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
