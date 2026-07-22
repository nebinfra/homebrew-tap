# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.12.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.2/nebcli_6.12.2_darwin_all.tar.gz"
    sha256 "e940e97baa1f31f39b190256d7e758cc00abfc8c3f7c46b9ce441c1250461d46"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.2/nebcli_6.12.2_linux_arm64.tar.gz"
      sha256 "ce4f07722090f5d3b33756e744a7d18bfc8164d27b12d2106da7ee2ff2dd65e8"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.2/nebcli_6.12.2_linux_amd64.tar.gz"
      sha256 "92fd15170a3eeb91a435c958a0259ea6609658091383794644601b1db18bb852"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
