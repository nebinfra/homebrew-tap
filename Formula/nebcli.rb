# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.37.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.1/nebcli_6.37.1_darwin_all.tar.gz"
    sha256 "34909f26a81da6beec7b0cce7f41cf935894278cd17ea921e7dd71f0e6d44359"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.1/nebcli_6.37.1_linux_arm64.tar.gz"
      sha256 "7577a44215ebff801b48a3bb90e6fcc3f8f9a9bd500907c3a5fba5e4e6f54b1f"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.1/nebcli_6.37.1_linux_amd64.tar.gz"
      sha256 "5d93b40e57dea61b8ec47e0d21658974b71c9b6f817797a92948400522d8fda4"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
