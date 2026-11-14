# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.40.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.40.0/nebcli_6.40.0_darwin_all.tar.gz"
    sha256 "1ec9d99188b1fdf72ef417c505852111351722994bc4fed2e1f5c36a73d3f27c"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.40.0/nebcli_6.40.0_linux_arm64.tar.gz"
      sha256 "2caee503c5eb41f52976eea4500fa977d562866a71f8acc88befe7bc356e03a0"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.40.0/nebcli_6.40.0_linux_amd64.tar.gz"
      sha256 "c54862a0c4e8e12aea914cba7fa5c9c0a9fb0054d05f58c4091a8ed13ac39598"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
