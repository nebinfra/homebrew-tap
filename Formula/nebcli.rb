# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.32.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.32.0/nebcli_6.32.0_darwin_all.tar.gz"
    sha256 "8d73aa83fd2e9e4c97533e89074e6f26ecc716e8d4651dc0eef25cd5afcd0348"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.32.0/nebcli_6.32.0_linux_arm64.tar.gz"
      sha256 "ec7bfbdec26dfe7f94430c89112e73c0b20fe7aa46c8a15f152d417fe1e3429b"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.32.0/nebcli_6.32.0_linux_amd64.tar.gz"
      sha256 "f56265cb6a7cd09cf351ffbacec32f545e1632bb1555f1c22fb977789b9daaae"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
