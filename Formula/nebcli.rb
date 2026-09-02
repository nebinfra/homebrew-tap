# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.19.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.19.0/nebcli_6.19.0_darwin_all.tar.gz"
    sha256 "3d512be887e86dea3e044ef64854cb597c221da192ee5939313b0f666596636e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.19.0/nebcli_6.19.0_linux_arm64.tar.gz"
      sha256 "beeefeb4fc390a06c09419499785cca1d36eeedbbbb4ae17b6c2d52ca8a739c1"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.19.0/nebcli_6.19.0_linux_amd64.tar.gz"
      sha256 "799ecbbfc68c2939e17107a5335dd139902be49189793ae6bddd08bc4500ef1e"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
