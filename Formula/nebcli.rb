# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.27.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.27.0/nebcli_6.27.0_darwin_all.tar.gz"
    sha256 "23203c29ab3abef69118beae18c70d941a83c96c663a27d4b63f9ce518f22340"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.27.0/nebcli_6.27.0_linux_arm64.tar.gz"
      sha256 "594883802611a8cc527351767f7abb006bca6b7e599048e8d5a9e923d01df316"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.27.0/nebcli_6.27.0_linux_amd64.tar.gz"
      sha256 "1cc53b13a99b0da4794ed6b60327cdaa8a7015cfe3180cdd50e157d3f644e2bf"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
