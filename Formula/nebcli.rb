# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.48.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.2/nebcli_6.48.2_darwin_all.tar.gz"
    sha256 "2e4c4a4435de0d5e5f5f6210b4719cb64f7bfa0c944fdaef895057deb728cced"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.2/nebcli_6.48.2_linux_arm64.tar.gz"
      sha256 "bbb7bf57338eefc2288caf17ce44f1ab021efedccebd40b70053043bb9c2ef05"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.2/nebcli_6.48.2_linux_amd64.tar.gz"
      sha256 "b82bd3001f97ab6cc4ea48b1c5d6010ff9de99ba74095cfd4ee3ca42b2e552dc"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
