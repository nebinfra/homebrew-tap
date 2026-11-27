# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.46.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.1/nebcli_6.46.1_darwin_all.tar.gz"
    sha256 "585f3f28962c23381239bbac7fbd6c2b7855e07817db1c35eb91a6a038de303d"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.1/nebcli_6.46.1_linux_arm64.tar.gz"
      sha256 "713f27a16b16bada1f7bdcdebc986424f626bfce7eaf6ad18fdf6503d6c8ee46"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.1/nebcli_6.46.1_linux_amd64.tar.gz"
      sha256 "eb9340361288b564c6c617a00a2f88d52e2c32c3ba599a0ab2655f6c3624de5a"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
