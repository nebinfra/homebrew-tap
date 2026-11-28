# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.51.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.51.0/nebcli_6.51.0_darwin_all.tar.gz"
    sha256 "b12a089b9c63fa413512fce5803dd38cf76053c3016d6d48afb358ee469a05da"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.51.0/nebcli_6.51.0_linux_arm64.tar.gz"
      sha256 "16cc1a2e2dd802a74ef9621beaf0e2b5c2693d014ce0ac207f6e1a09ca8561e0"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.51.0/nebcli_6.51.0_linux_amd64.tar.gz"
      sha256 "cf5044e741aad962a08d6fa106c1cd4b0a4cf9e4ec1fd8d1e64ad0ce279d3fee"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
