# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.31.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.1/nebguard_5.31.1_darwin_all.tar.gz"
    sha256 "6889ae17b4db6430dd6ae56e01facc8d5a439f24d62b3c170c4b30e73abfdf45"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.1/nebguard_5.31.1_linux_arm64.tar.gz"
      sha256 "a77e153c00a8ba2de9d7a4a1ec1c18e6057331db3f5c8292869359e94691a46f"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.31.1/nebguard_5.31.1_linux_amd64.tar.gz"
      sha256 "6f64751e235abaf244fc023c5c355e7582fa3bf85fb9ac328a653118153ac483"
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
