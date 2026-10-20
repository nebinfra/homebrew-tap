# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.26.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.1/nebcli_6.26.1_darwin_all.tar.gz"
    sha256 "6a93bb8cdbff4ca482b09ea017c4d81c28c1b07c5863e3b1f074b692bc57f9f0"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.1/nebcli_6.26.1_linux_arm64.tar.gz"
      sha256 "ceeead91847224e697d8053e1faff96d8bf74ccd167a1e7f9f250eef93e4b3a3"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.1/nebcli_6.26.1_linux_amd64.tar.gz"
      sha256 "81a0dca813c9c296fbbc23d193e697f8e3ab2d97f11863f9245d4835801c11f6"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
