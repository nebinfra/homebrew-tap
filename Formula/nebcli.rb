# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.12.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.3/nebcli_6.12.3_darwin_all.tar.gz"
    sha256 "1e9393db161b0d456d3bd5ba1e9c66f02d64b9424d9e7746a85bf4f90d370872"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.3/nebcli_6.12.3_linux_arm64.tar.gz"
      sha256 "a5e69db775456fac2977cb647416b0fffed7af27a087dd051ad96428057c9367"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.3/nebcli_6.12.3_linux_amd64.tar.gz"
      sha256 "d3ebf73e8a9a934e327081401d96cdd0e8231f6d005c2a02cf9ce7705eb2850c"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
