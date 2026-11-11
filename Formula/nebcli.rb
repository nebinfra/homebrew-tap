# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.4/nebcli_6.38.4_darwin_all.tar.gz"
    sha256 "45eeb8939e5a0496a2739c4437c17895d01230615d2e3f32e3e6935cb1c8ea85"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.4/nebcli_6.38.4_linux_arm64.tar.gz"
      sha256 "a11226fe7c09e6c5655d90e14c7a427c5e20d0fe441367412c99b1433fdc9d3a"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.4/nebcli_6.38.4_linux_amd64.tar.gz"
      sha256 "83883c5d2a6f4339dd9beec4d206c50de1116229b5dbf47c624c509adc266290"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
