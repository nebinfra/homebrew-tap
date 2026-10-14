# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.23.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.23.0/nebcli_6.23.0_darwin_all.tar.gz"
    sha256 "4c87cb8f1102f3fdeb56eaf9089905df3f782a6fb9375fe5f283b50502c8afcd"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.23.0/nebcli_6.23.0_linux_arm64.tar.gz"
      sha256 "83cfcd134e2e9fb8059a7b405d345b9d047cae187497f757df51c8dce1dd17bb"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.23.0/nebcli_6.23.0_linux_amd64.tar.gz"
      sha256 "d263a34466d3477cac7e7f807cd7fed03f44c3dbfba9038d31142e49e10895f9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
