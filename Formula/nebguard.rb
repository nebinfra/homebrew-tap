# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.37.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.4/nebguard_5.37.4_darwin_all.tar.gz"
    sha256 "fb3d50c24cbb0dcd9653ecaa775e8ddecf3e6a5579b5b1f8ba51ca371ba6df5d"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.4/nebguard_5.37.4_linux_arm64.tar.gz"
      sha256 "3fe97c694874c201fd3ba36e5691e90bc26eba8ee067743ffef800c811153d06"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.37.4/nebguard_5.37.4_linux_amd64.tar.gz"
      sha256 "d697417df31e8fe4900b048ed64a5aeff82a96d03147f85de34c50d8254df5f2"
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
