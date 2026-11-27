# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.48.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.1/nebcli_6.48.1_darwin_all.tar.gz"
    sha256 "8869659d9ba0d7b74bc8466d02ba90f1c366b8cca9ddba902c11286d75671471"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.1/nebcli_6.48.1_linux_arm64.tar.gz"
      sha256 "5181a5734ede4bdb18e54af1ca9eb2dae4db9301703c7c15700cc8845730ed27"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.1/nebcli_6.48.1_linux_amd64.tar.gz"
      sha256 "347f9a4d860c99ea7504b9a72d57af0fece0d23713fafaefa5548a3d73e2f757"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
