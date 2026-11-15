# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.42.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.1/nebcli_6.42.1_darwin_all.tar.gz"
    sha256 "6983e7de1d7c7318189f6047c45ee05bea8e21c176231f0bc602b5b4e59acd15"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.1/nebcli_6.42.1_linux_arm64.tar.gz"
      sha256 "40ba78b98e915ec44fea54f4cdfc00686787462c3122598b9c537670e14ade72"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.1/nebcli_6.42.1_linux_amd64.tar.gz"
      sha256 "5db39fbf58337a14d5bdb7b0e1b04f3f56cb32b22eac639b9c16c77355f927d9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
