# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.33.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.33.0/nebcli_6.33.0_darwin_all.tar.gz"
    sha256 "05a70ae986cf0d9d82060b4b929b9ad49b7a0aa355e7392bde0e56b46723102b"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.33.0/nebcli_6.33.0_linux_arm64.tar.gz"
      sha256 "6a38d5cab72c8c116eab5dcc68241cb7779bfe8e18c76021bd0ac8d664e7bd65"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.33.0/nebcli_6.33.0_linux_amd64.tar.gz"
      sha256 "6f65619549d91bccaf0af9ffcc4018138e0afdfbf9b66e18cbac13730092be9d"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
