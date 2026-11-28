# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.49.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.1/nebcli_6.49.1_darwin_all.tar.gz"
    sha256 "0fb67b8adaf5e753a7c508bc2ae426a379b6481d3cfe1fee33b5f03855534db5"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.1/nebcli_6.49.1_linux_arm64.tar.gz"
      sha256 "e5dae847720e0fa4a74f1364d4716558c7eb0ac901a0b80e8fecc373e69e1e22"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.49.1/nebcli_6.49.1_linux_amd64.tar.gz"
      sha256 "737239b71b48f6006cc1679198944c942d525092ac817733cd10efaa99f93fdf"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
