# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.31.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.31.0/nebcli_6.31.0_darwin_all.tar.gz"
    sha256 "c15d47b0cbb426f3ddf62d071fd68e9fc21019ed99e17d9529a6b9e72bca7157"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.31.0/nebcli_6.31.0_linux_arm64.tar.gz"
      sha256 "1473ecac54b113f8f9ec2d5c2c6a49faaa02be6e1f6d80140ac6e227ca978692"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.31.0/nebcli_6.31.0_linux_amd64.tar.gz"
      sha256 "284f5f55ac848eb28e0fffc89c7315263dbf5495f9fff67154673d867a37d748"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
