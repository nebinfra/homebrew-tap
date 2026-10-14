# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.36.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.36.0/nebguard_5.36.0_darwin_all.tar.gz"
    sha256 "b4504f6370b9d742d5d5ca0b1f8bbcbe743f0adb96866c2c81b8897d7893ed59"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.36.0/nebguard_5.36.0_linux_arm64.tar.gz"
      sha256 "a081f62c4b9b512a239e815e6723082a0bed13bfa93f8a16f3e80972b1472adc"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.36.0/nebguard_5.36.0_linux_amd64.tar.gz"
      sha256 "ed96c9c59b4232548f6035ebd8bdcbfe1651db7898126462c26c2037e5425e16"
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
