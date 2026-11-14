# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.42.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.0/nebcli_6.42.0_darwin_all.tar.gz"
    sha256 "585779810e35799594d353f08772359934f5ab2e21fc9d250da8bed401432066"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.0/nebcli_6.42.0_linux_arm64.tar.gz"
      sha256 "7c6ea64ce78e659cf1c77a91aa6defeca7a89661f6c2aba31f8750f98e4567c2"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.0/nebcli_6.42.0_linux_amd64.tar.gz"
      sha256 "95bb682a40533e9ff4130de2dbb6fcaa57d43e7a70fc0b55a8536033d39efb00"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
