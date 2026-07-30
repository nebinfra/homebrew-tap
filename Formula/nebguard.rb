# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.27.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.4/nebguard_5.27.4_darwin_all.tar.gz"
    sha256 "34c53bf102102eb9485861d52a05a3704c6955e14085811ed8bd30d153fba39a"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.4/nebguard_5.27.4_linux_arm64.tar.gz"
      sha256 "df3ae9f32a9b78bff86714ed001dbd1df1719e9c5c529660317f24c58a343b04"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.27.4/nebguard_5.27.4_linux_amd64.tar.gz"
      sha256 "0cafa07e6f63fcb5b1242f26bc900ee24c54346812af225a2b0f883f5347e830"
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
