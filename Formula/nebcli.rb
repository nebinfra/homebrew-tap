# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.15.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.15.0/nebcli_6.15.0_darwin_all.tar.gz"
    sha256 "43e5d27d74fcb6f21c91dfb2d750da4fb4ebe51c352ba56f1ef3f82054e88979"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.15.0/nebcli_6.15.0_linux_arm64.tar.gz"
      sha256 "015a5a425e2bf437733614dcfee3d84e9477a572f38b4e9bb6cb4f9c581bba0b"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.15.0/nebcli_6.15.0_linux_amd64.tar.gz"
      sha256 "0dcd8d151d6a91f06a5129112747a195056428fdb6e73da2b1e7627f4d0d52dc"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
