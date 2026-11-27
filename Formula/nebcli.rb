# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.47.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.47.0/nebcli_6.47.0_darwin_all.tar.gz"
    sha256 "312447e37891c39f321652afbe1868d8af3710bab1fe1925060b08bd08049327"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.47.0/nebcli_6.47.0_linux_arm64.tar.gz"
      sha256 "4f9eda24579d3f3d6624a488cf7114874c3d557b0ef353c367452ea3c358ccd4"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.47.0/nebcli_6.47.0_linux_amd64.tar.gz"
      sha256 "a443fcbd68752ae54910530098ccd69d24d0ccbc4b5ce56872d917ad6acd4ed4"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
