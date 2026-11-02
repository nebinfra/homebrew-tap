# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.34.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.34.0/nebcli_6.34.0_darwin_all.tar.gz"
    sha256 "de38a04121dea9772f70570305e4845ce616a30eb2ac9dfc74c273c49569d4fe"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.34.0/nebcli_6.34.0_linux_arm64.tar.gz"
      sha256 "5a573cbe855390155a39e492f8381cb26996e321deee0f10fc4fcd9f971c41aa"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.34.0/nebcli_6.34.0_linux_amd64.tar.gz"
      sha256 "ef52d9faacb659521cd621e5ce2301734b5a530021a68abd43f46ad6259a9475"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
