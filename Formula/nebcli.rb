# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.52.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.52.0/nebcli_6.52.0_darwin_all.tar.gz"
    sha256 "d05e893bcc8bee95531ca771dd438aec9e27e3d6fcc4f97f70846080295f8975"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.52.0/nebcli_6.52.0_linux_arm64.tar.gz"
      sha256 "806156c1f95a8468415c055c32b3b918b806224db1a93de366950e9b327321b4"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.52.0/nebcli_6.52.0_linux_amd64.tar.gz"
      sha256 "8dfbe6ee6b88719fcbfc17709866e321022b46f9985e9f707cb07a940b9f5963"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
