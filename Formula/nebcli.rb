# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.35.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.0/nebcli_6.35.0_darwin_all.tar.gz"
    sha256 "5204b560fc805f9632405b8c7a1c3739a8921ad0cf119a347930af37ee6aa111"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.0/nebcli_6.35.0_linux_arm64.tar.gz"
      sha256 "9f0c870ff69b8f30ed096003e1f134430aff3981c8c5abaf3f647be58349ada4"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.35.0/nebcli_6.35.0_linux_amd64.tar.gz"
      sha256 "4941fd0efe00c65e642fbf2ec71c29523ff3f26c1f7319b0a635aa519a125eca"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
