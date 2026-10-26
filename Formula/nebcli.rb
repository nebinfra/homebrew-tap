# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.29.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.29.0/nebcli_6.29.0_darwin_all.tar.gz"
    sha256 "1f2abd60c27ea57caa07a04e7fe7b2ba29f0c90efa122f0417e1fe9d4711ab09"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.29.0/nebcli_6.29.0_linux_arm64.tar.gz"
      sha256 "8a361ce2f24ce99619daab0d84c211b80b45bd06efa6b970900afb4b73fda24a"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.29.0/nebcli_6.29.0_linux_amd64.tar.gz"
      sha256 "47802a9d4081239b3abc9011723d311070aeed7e6e2bd40694c8c5935a990e19"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
