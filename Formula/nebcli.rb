# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.50.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.50.0/nebcli_6.50.0_darwin_all.tar.gz"
    sha256 "cb293fcebb4b37e7a227a00b65987131451034db5a5b44b6e2e05cb4bafbf3e7"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.50.0/nebcli_6.50.0_linux_arm64.tar.gz"
      sha256 "175c31d810297b2bba77d33ceb5bd8c8e6f410530097a0f8458f4fa43795826a"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.50.0/nebcli_6.50.0_linux_amd64.tar.gz"
      sha256 "31e82a6539cd761ab182eb4abe651f1067298f39ff2521d01a5c3125c5a4acd9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
