# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.18.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.1/nebcli_6.18.1_darwin_all.tar.gz"
    sha256 "2b4d51fb3ea64a704805c1fe208244dcacb86aa179cc2e2b5d6364e5de49fccd"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.1/nebcli_6.18.1_linux_arm64.tar.gz"
      sha256 "baaa1cd81332d39830afcc9927cbc1d2cb6ade8d2648dcb1cea10f6e6957b4f7"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.18.1/nebcli_6.18.1_linux_amd64.tar.gz"
      sha256 "1756c6b33e7386356cdf7a6b2d2f64be1db2343146ede33db0ddeab630add464"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
