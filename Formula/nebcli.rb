# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.26.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.2/nebcli_6.26.2_darwin_all.tar.gz"
    sha256 "b72648880054d426f8bf7c33f8578b588bb0eaacaf37f600ce8beec26536968f"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.2/nebcli_6.26.2_linux_arm64.tar.gz"
      sha256 "3d62e6930af2eebff4617fd1dda0f7a795bb4fee70af140985594f7fd4e26bda"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.26.2/nebcli_6.26.2_linux_amd64.tar.gz"
      sha256 "b11c119a2e58f0a6b476bdc81b4190363520305b22eb5dfc9f8b52b4bd6449b9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
