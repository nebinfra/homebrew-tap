# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.28.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.28.0/nebcli_6.28.0_darwin_all.tar.gz"
    sha256 "af46e8770a81fcab1d03343213d1a59165e9a7df16816d0d95921b0cfcd7707c"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.28.0/nebcli_6.28.0_linux_arm64.tar.gz"
      sha256 "9c49c98794fd46726e1c192909a3c1438278ea6c5003535794fe48950640952a"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.28.0/nebcli_6.28.0_linux_amd64.tar.gz"
      sha256 "d183a5e78b2ff99b658e10e4ceb0ccb0b1dcac6eb13f05b9bdcc71c3bfb23f39"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
