# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.44.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.2/nebguard_5.44.2_darwin_all.tar.gz"
    sha256 "4a998ffa6082e8e5292ce042d18ee3d07a6dad8e04e81923136510f8ec2c72b2"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.2/nebguard_5.44.2_linux_arm64.tar.gz"
      sha256 "06d422108bc6fe24668a4f3b97bd7df684c09b4de6b0341eb283b738904130fb"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.2/nebguard_5.44.2_linux_amd64.tar.gz"
      sha256 "17df210819e0a743cb9a27d1f13c8cb30a98b72b479ad5f2eb02110836cdf59d"
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
