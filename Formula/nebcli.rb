# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.41.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.41.1/nebcli_6.41.1_darwin_all.tar.gz"
    sha256 "0c48161a69acd4565f4565fb661ca30b185ba878ae73fb8d9f98c4af6bb8bfab"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.41.1/nebcli_6.41.1_linux_arm64.tar.gz"
      sha256 "1ac06f2ab0f8e66473d005d77185440111870b8fd0479d0b541ec97506d60816"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.41.1/nebcli_6.41.1_linux_amd64.tar.gz"
      sha256 "63a92974370c8acc1d66aea29da2e8310b69a25f9c066461ef475a0fb638d9ba"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
