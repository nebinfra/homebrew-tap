# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.2/nebguard_5.23.2_darwin_all.tar.gz"
    sha256 "26154c5da3d578264f3486462b9511a6b39c9e3fc9ac9320e1c2b4844e625fb4"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.2/nebguard_5.23.2_linux_arm64.tar.gz"
      sha256 "17b95d8d785ef38e44dee5031460eefa2930905dc4ad1c56d9bc3660cbb1a1d9"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.2/nebguard_5.23.2_linux_amd64.tar.gz"
      sha256 "e369f490ae7d2b29d2f5659d7cc964d6c1d613e2f4ccd82a5f197a29c85d3817"
    end
  end

  def install
    bin.install "nebguard"
  end

  test do
    system "#{bin}/nebguard", "version"
  end
end
