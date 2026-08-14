# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.17.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.0/nebcli_6.17.0_darwin_all.tar.gz"
    sha256 "267a5e051ee926e95ad4d34f773d3b3108ad04ddd35050c0386ee5fb6b430864"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.0/nebcli_6.17.0_linux_arm64.tar.gz"
      sha256 "e8bf7747f933aeb3a3dd5e2dcde25ab78f8b7c1304ff6dd71694eba8b424d903"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.17.0/nebcli_6.17.0_linux_amd64.tar.gz"
      sha256 "18e114e57458fac6a3bfd4787c6dedbbc7f9d0c95ab0d74e1a89d93be7ca1a6f"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
