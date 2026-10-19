# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.25.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.1/nebcli_6.25.1_darwin_all.tar.gz"
    sha256 "e0b800d77ee5924754b3e5635cf01594739db4a98330ee6cfa81e257a1bdba94"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.1/nebcli_6.25.1_linux_arm64.tar.gz"
      sha256 "fec107f5c3ac4ab8b4672df20b9fc2955b29b9fe9776e65735b9a6f694f31426"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.25.1/nebcli_6.25.1_linux_amd64.tar.gz"
      sha256 "04ae1952d170fd0b83f25e1b6430a69294efabde47643c086e1e061e2e36afac"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
