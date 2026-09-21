# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.20.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.20.0/nebcli_6.20.0_darwin_all.tar.gz"
    sha256 "a2191f760a39ab030ceb185fa472be1bec87888f33da989be67f611b215e6873"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.20.0/nebcli_6.20.0_linux_arm64.tar.gz"
      sha256 "42e560a8573407a7719adc979a3896e4e3657ff50ee391edfa718e895360b001"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.20.0/nebcli_6.20.0_linux_amd64.tar.gz"
      sha256 "15bc834de57ad944ff089d04524cfad27d1024bde817ff8fda561fc84bd1936f"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
