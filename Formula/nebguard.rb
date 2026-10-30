# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.43.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.43.0/nebguard_5.43.0_darwin_all.tar.gz"
    sha256 "652c834ad0d645ce69686ea136c3fcd3684c72ae790fe1535fcadd990c01284e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.43.0/nebguard_5.43.0_linux_arm64.tar.gz"
      sha256 "62d9870619c1371df68a27300a9608557096bdca6e18936c344dac8e5eb1e095"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.43.0/nebguard_5.43.0_linux_amd64.tar.gz"
      sha256 "dc5f76b5f465037fa4a3e9c34517923a32cf98102b5d989c12935833d1764d08"
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
