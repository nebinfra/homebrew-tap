# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.45.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.4/nebguard_5.45.4_darwin_all.tar.gz"
    sha256 "f31dc79ffcfe631cbd98f07b988a890d09ed48ccb26e6efdfb81e83af5ee8eac"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.4/nebguard_5.45.4_linux_arm64.tar.gz"
      sha256 "10ef83e741a5c2b3474c48dc292be06d2b6ee80a9e6c4f77f0dcb0ac29ab273f"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.45.4/nebguard_5.45.4_linux_amd64.tar.gz"
      sha256 "6267754dd546d24ac980556cb1dff7d03c1d208d5eda5c5d44b9a956af2613fc"
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
