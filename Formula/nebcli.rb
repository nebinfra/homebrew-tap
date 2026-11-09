# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.1/nebcli_6.38.1_darwin_all.tar.gz"
    sha256 "7f8f3d4009f11acbb18554d7748cfc68430058850206343207879ee43b702413"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.1/nebcli_6.38.1_linux_arm64.tar.gz"
      sha256 "16f03e15ce319a607fc0859c88cd062dff949903e8bb6e6d23653ddab1b7991d"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.1/nebcli_6.38.1_linux_amd64.tar.gz"
      sha256 "e83e76e65348053bfaa405719da2520121746208da06382ccaf8093edc8736a3"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
