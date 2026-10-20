# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.26.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.0/nebcli_6.26.0_darwin_all.tar.gz"
    sha256 "43dffee4c5647f020926894f0c00df6ecd7cc70fcee37fb8075e7b23b31c1102"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.0/nebcli_6.26.0_linux_arm64.tar.gz"
      sha256 "a5ec80388a485e42b6de3b8259fbf703a37075fed74ff232e2ca6484cb551ae0"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.0/nebcli_6.26.0_linux_amd64.tar.gz"
      sha256 "c60dee84815bf0d4f42287458c535beb85ba946904617ea42ee3ff64dae5e88a"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
