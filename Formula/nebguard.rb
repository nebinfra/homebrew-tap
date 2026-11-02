# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.44.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.0/nebguard_5.44.0_darwin_all.tar.gz"
    sha256 "efa56ded7b2baf238b46bc506e730f05d705d94964729067e93915c345601d46"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.0/nebguard_5.44.0_linux_arm64.tar.gz"
      sha256 "100e75c54389de1dbf7e8bbbbc5e5ffc6c28a12be9f7537c10266ec16fb7794c"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.44.0/nebguard_5.44.0_linux_amd64.tar.gz"
      sha256 "9128980375c4751e93bca9c63f607279f411107979eca32a78fe8e4ae24b4651"
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
