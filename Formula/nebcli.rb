# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.17.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.1/nebcli_6.17.1_darwin_all.tar.gz"
    sha256 "1b7d5e630b26f676ceeba6afe2c223fe2dacaf2573161a0852e4e1b42914ca64"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.1/nebcli_6.17.1_linux_arm64.tar.gz"
      sha256 "45d706a0c19ca9d5b2e9f48965cf9ada270a3e9ea2040a43ab1c2b118fcd3ffa"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.1/nebcli_6.17.1_linux_amd64.tar.gz"
      sha256 "1b6cf5f5ff2162773f761ab498067d9b2a8ea0adc303eccb10b82b67abcc76f9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
