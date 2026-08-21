# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.18.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.0/nebcli_6.18.0_darwin_all.tar.gz"
    sha256 "dd2c7b38cb14b21fe2fb06bbd97486c2ba6b47dcbb428f9656591c48df1b9299"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.0/nebcli_6.18.0_linux_arm64.tar.gz"
      sha256 "7b2627015ccddc7125c621990cda62d34b6da6d1f5e085f64e9cba26b08daf3d"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.0/nebcli_6.18.0_linux_amd64.tar.gz"
      sha256 "6d5870473a5a2da4eb631f6477189653f5504ef519c84892626fcfd6b658eb99"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
