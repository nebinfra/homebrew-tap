# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.30.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.30.0/nebcli_6.30.0_darwin_all.tar.gz"
    sha256 "3319c43f27175f4b38045c31a399783da9b52ec4c8f18360dad551806f528695"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.30.0/nebcli_6.30.0_linux_arm64.tar.gz"
      sha256 "ea67530352855552511d44c2dcbfe960d616b88f0a752299c492a1a4626854a3"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.30.0/nebcli_6.30.0_linux_amd64.tar.gz"
      sha256 "657a50f1d6a968d07446a92af7a37dad8ef5c8bfab0b4872522c3c8362367e04"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
