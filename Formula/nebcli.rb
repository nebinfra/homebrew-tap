# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.35.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.1/nebcli_6.35.1_darwin_all.tar.gz"
    sha256 "9c04f6f310936cd74ec86122904481be64e8ff2a16d834e27127d18809e396b1"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.1/nebcli_6.35.1_linux_arm64.tar.gz"
      sha256 "9e3154ab30830df2087859d6327c364229b940d49dcd233ee2f6136091b9140c"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.1/nebcli_6.35.1_linux_amd64.tar.gz"
      sha256 "d426f4efb8edc90e29c406bf8b5ab9fff255b0f257280ff33fec80f2f134d5b5"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
