# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.6"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.6/nebcli_6.38.6_darwin_all.tar.gz"
    sha256 "1cdc13e38342634f99b6034fffd6c86ed4642ed4c79e59ad237323c454b2555e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.6/nebcli_6.38.6_linux_arm64.tar.gz"
      sha256 "c4f6cd991b58d40918f1e23b67297d3a3060c20cd97e88c51ceea3ec33ad816b"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.6/nebcli_6.38.6_linux_amd64.tar.gz"
      sha256 "f79c83738610ee35c673641d4d85c9f7c9c76fe2c7b1dc34c3c91966f868c09e"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
