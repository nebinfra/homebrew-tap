# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.25.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.0/nebcli_6.25.0_darwin_all.tar.gz"
    sha256 "271a7380049f9978b22f697925234b7195f9fa6798925f0605cf4d01adad40d6"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.0/nebcli_6.25.0_linux_arm64.tar.gz"
      sha256 "bf606e43ed23ecaf3bbb01c5b081a5c1abfe026faf87499a327b4264a49a0bc2"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.0/nebcli_6.25.0_linux_amd64.tar.gz"
      sha256 "b290389d2235491376068d3d1566c024d146984335fd98a01ee90410e1e0dac1"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
