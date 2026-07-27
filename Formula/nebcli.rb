# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.12.4"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.4/nebcli_6.12.4_darwin_all.tar.gz"
    sha256 "0e20dae0e0531ee9d76dedf271cfc29db0ddb0f8817ae083f646f5a39710b7e8"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.4/nebcli_6.12.4_linux_arm64.tar.gz"
      sha256 "b222f764f237d1501d39f27f95d2384ad1ca16c2cb9128af4694ee8fec9c4e17"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.4/nebcli_6.12.4_linux_amd64.tar.gz"
      sha256 "a36f0e090d9c0c3ad53e27ef7f8dd2defc8092a8c10c9519f75fd899ce07a72f"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
