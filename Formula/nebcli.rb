# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.36.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.36.0/nebcli_6.36.0_darwin_all.tar.gz"
    sha256 "27e9922cf5cfaa5d7238283eca6f2f909e4903980e01df53c36bf5fc8135309e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.36.0/nebcli_6.36.0_linux_arm64.tar.gz"
      sha256 "3127f7597115e8561203872a2bb3dc19777add07f47e545857bc6e092a57ee06"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.36.0/nebcli_6.36.0_linux_amd64.tar.gz"
      sha256 "1293fcbe6b12aaa83f35ed30a9c217d7e45d906c907e52e5da59019e35b1e92e"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
