# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.25.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.3/nebcli_6.25.3_darwin_all.tar.gz"
    sha256 "5faeeb637279acb3deadaa9c7b01e006ce3728da37caa350be197dcdf3ef869f"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.3/nebcli_6.25.3_linux_arm64.tar.gz"
      sha256 "72f162aa1e2c2e09f3a46fca13274ecc75c633f7381a3ca419f5c691bfa02c3d"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.3/nebcli_6.25.3_linux_amd64.tar.gz"
      sha256 "e8fb7bbaf74449d649c6f90422cfec690b1b417ab3e62166247b9bc001171a33"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
