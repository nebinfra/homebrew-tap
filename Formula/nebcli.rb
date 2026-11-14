# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.39.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.39.0/nebcli_6.39.0_darwin_all.tar.gz"
    sha256 "5d066ec0516a0d019b93aa12452264476edcab2ec00f740501e3c417769a6320"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.39.0/nebcli_6.39.0_linux_arm64.tar.gz"
      sha256 "f5cc4030faef2bd6c39169cae42182f19dbd8e3422ab7b101c01f8c469cd7fdb"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.39.0/nebcli_6.39.0_linux_amd64.tar.gz"
      sha256 "7d0e1c42b2e3f918dca8780c3c04dc7a4823e4f55af6a035ade22bf3db0dc8b7"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
