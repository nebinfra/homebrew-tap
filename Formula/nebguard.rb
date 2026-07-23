# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.4/nebguard_5.23.4_darwin_all.tar.gz"
    sha256 "e363f159e28503dc2174e78c0cb4ea3ac23362cfd9b7dff0c5715a84f9f926b4"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.4/nebguard_5.23.4_linux_arm64.tar.gz"
      sha256 "58619af26555b08dc8c1897aad7125a37153d0b820105f96f27555092dd5b7dd"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.4/nebguard_5.23.4_linux_amd64.tar.gz"
      sha256 "9b45b35fca8230dc8f4426357214430b5a8211c69a3a840fa8052fef87770b2f"
    end
  end

  def install
    bin.install "nebguard"
  end

  test do
    system "#{bin}/nebguard", "version"
  end
end
