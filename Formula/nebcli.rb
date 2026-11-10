# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.2/nebcli_6.38.2_darwin_all.tar.gz"
    sha256 "290ecb0fcfa0fd46b48008a50e899cedebd2eb79912328e26142b2fa16a8886a"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.2/nebcli_6.38.2_linux_arm64.tar.gz"
      sha256 "63b407d725309b763e120b68fde0f9afad487bbef555e757aa4aa5be702ef500"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.2/nebcli_6.38.2_linux_amd64.tar.gz"
      sha256 "dd35e42d8e1fcbdccd07589f0d5be6798b17357d480a31af6810ec641a40c0f2"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
