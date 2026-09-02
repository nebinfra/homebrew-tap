# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.32.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.32.0/nebguard_5.32.0_darwin_all.tar.gz"
    sha256 "276fdd7f9680c4062497f0fdae116253e3a19c4f7acad85915463a7f6a184cdd"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.32.0/nebguard_5.32.0_linux_arm64.tar.gz"
      sha256 "50e6c2f9b56c4af358d71f2df4e23586156ad4e2badce30ea5b92bc505e999f9"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.32.0/nebguard_5.32.0_linux_amd64.tar.gz"
      sha256 "f82df0d815e2966aa7be3f1095dc8ea5a2f0faffbc611733d83acf6f4bfe59ec"
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
