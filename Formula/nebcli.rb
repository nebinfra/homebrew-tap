# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.49.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.0/nebcli_6.49.0_darwin_all.tar.gz"
    sha256 "01308f5757464d838c64191885a7d43367fc37022481e283b0a04c32d3d54fa1"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.0/nebcli_6.49.0_linux_arm64.tar.gz"
      sha256 "c2864be9b0628b6fbd136f13eb4dc91838223aaebd3a1bc554f98ad8b08c76cc"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.0/nebcli_6.49.0_linux_amd64.tar.gz"
      sha256 "5d8b32ee20032dbcfd08ae4829beb3ac2675cd09db24d54eb43366de774eebd8"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
