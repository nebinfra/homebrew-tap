# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.45.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.45.0/nebcli_6.45.0_darwin_all.tar.gz"
    sha256 "09378d5b12814b0ad9e683f0abdc7961c7c8391f3f44f5516978a525bf8f6ac6"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.45.0/nebcli_6.45.0_linux_arm64.tar.gz"
      sha256 "2ccd6c3f58b8add860302610a3e1e15520160ff01bbefce478d1da42bbf29b30"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.45.0/nebcli_6.45.0_linux_amd64.tar.gz"
      sha256 "6eb392dc621aee977020c8b0675248f651276ce33b29d3cf0a43fd8deae29ffe"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
