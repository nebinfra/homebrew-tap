# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.25.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.2/nebcli_6.25.2_darwin_all.tar.gz"
    sha256 "8f6451a04140ba25b04472cf11dff3293251f1fe3002ad008087f93255c9fadf"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.2/nebcli_6.25.2_linux_arm64.tar.gz"
      sha256 "1ab9ea6c90a5dfaad19fcacd956294258a4d337143a5b29b62d02597934b8563"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.2/nebcli_6.25.2_linux_amd64.tar.gz"
      sha256 "a00b77f2c12cce1d83423345edeff4e834d8d0dbb72138a57c5364ff49d21044"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
