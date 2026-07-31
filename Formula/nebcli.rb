# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.13.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.0/nebcli_6.13.0_darwin_all.tar.gz"
    sha256 "a54b3b702946b60ad7c306df184aebfae28d50d350db0f8e06c7344c802c2559"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.0/nebcli_6.13.0_linux_arm64.tar.gz"
      sha256 "aceeeb87d2fe3a18e34be2b949a2e621ee3c57a6f1b41d1d89a089bae38a6e88"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.13.0/nebcli_6.13.0_linux_amd64.tar.gz"
      sha256 "1a0eb6faf9dadcb9e905213d913f35d2208e672ba8e53dc8b8c330a15ce6e334"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
