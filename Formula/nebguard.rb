# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.30.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.0/nebguard_5.30.0_darwin_all.tar.gz"
    sha256 "4bebfc9ed5c84d9a2bac86090d6202e647500445f672438b638d5cbf7fc997f5"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.0/nebguard_5.30.0_linux_arm64.tar.gz"
      sha256 "775545fe94a552fb42c7cafc15fa5f81b26af2fce9ff71ed1581aec21bbfaa2a"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.0/nebguard_5.30.0_linux_amd64.tar.gz"
      sha256 "72fff3e5f4d86d82a325af96248c593358717a9ef0a5e152f7629607d817de6a"
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
