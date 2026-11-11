# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.5"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.5/nebcli_6.38.5_darwin_all.tar.gz"
    sha256 "7d4420b248e6c7e3b4087fb48afbd245fb2a8925e98b8049359606e844ef3be9"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.5/nebcli_6.38.5_linux_arm64.tar.gz"
      sha256 "dc75db1ee0113ff83cdee44a24994dd09430ea1d799dfd2c845aaf9c24eaf8cd"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.5/nebcli_6.38.5_linux_amd64.tar.gz"
      sha256 "677343134a46da8cc5caffdb80341c1f355558f927cdc6b8e0f0cea08bb4fc4f"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
