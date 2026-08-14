# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.30.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.1/nebguard_5.30.1_darwin_all.tar.gz"
    sha256 "9e6a90356af1d4a38cbe2ba033b420b42b7ecc7a62ed21579dd3515445e8010a"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.1/nebguard_5.30.1_linux_arm64.tar.gz"
      sha256 "e73c62abe00391f2992234fe93a7fc9a4369c4ee6ffc904bb0e87607ab75acf5"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.30.1/nebguard_5.30.1_linux_amd64.tar.gz"
      sha256 "ce6905b84e1d0bd5253af3249afbf16fe4b6a87e79abc00b4e457da4130ad0a9"
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
