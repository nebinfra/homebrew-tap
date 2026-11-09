# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.0/nebcli_6.38.0_darwin_all.tar.gz"
    sha256 "3b13b6af135f4dff37dfdd56c0d782f995d54271f83ee900a972f384cd4bc756"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.0/nebcli_6.38.0_linux_arm64.tar.gz"
      sha256 "aa72c7a5a144aab0629e0a38ae22e691338631c0913d0360faa9d8916aef7185"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.0/nebcli_6.38.0_linux_amd64.tar.gz"
      sha256 "4034f344090ec0b2a12d75a60f81130d60f8dd3dfa9dd124fc09ee5b81709dc2"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
