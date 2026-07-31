# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.13.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.1/nebcli_6.13.1_darwin_all.tar.gz"
    sha256 "8609fd3c87a31b36169466de3420c5dae9b4e098c1715c4012a367c184a55adb"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.1/nebcli_6.13.1_linux_arm64.tar.gz"
      sha256 "e53d36c31fea9eb189c6d120597a0986c484f7ab4af5336578cde9ef0e68e981"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.1/nebcli_6.13.1_linux_amd64.tar.gz"
      sha256 "c9e6dc466f80c7b4e20e812f230510b1aba0aa891057fe1a4aa236a41dff25ce"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
