# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.22.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.22.0/nebcli_6.22.0_darwin_all.tar.gz"
    sha256 "4a63e0acdc418fe025d58d191ffc31732dadab60659fdd715394fe91c2526d12"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.22.0/nebcli_6.22.0_linux_arm64.tar.gz"
      sha256 "4d995c6007d085ec7a0e55608bd3d0e48e3751a85d8511270ad06c4f79fd203e"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.22.0/nebcli_6.22.0_linux_amd64.tar.gz"
      sha256 "78c5de21489455cd973e2f860d9bc06f8149a5e3c0fefb7e297b06441d18cb3f"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
