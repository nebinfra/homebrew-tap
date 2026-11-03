# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.44.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.1/nebguard_5.44.1_darwin_all.tar.gz"
    sha256 "838703a2daf9383e1710be9e0db9862faf141d6166c78f7d947c4ed5c4e8c316"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.1/nebguard_5.44.1_linux_arm64.tar.gz"
      sha256 "a286a789499e926deee3e729f538892a2395fca8fe4dd4175df8429b3452a988"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.1/nebguard_5.44.1_linux_amd64.tar.gz"
      sha256 "20fb87859d8a4f7e6cf495a6fc586522abbba5cb0fbbb17701ce8a068313238d"
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
