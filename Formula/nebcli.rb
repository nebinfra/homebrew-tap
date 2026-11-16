# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.43.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.2/nebcli_6.43.2_darwin_all.tar.gz"
    sha256 "29f69949914587537bc28ffcca5ead26c3ffc89645e1ea07cc29311ca1cff0b1"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.2/nebcli_6.43.2_linux_arm64.tar.gz"
      sha256 "4bf810ab7b2356a983351be56fd08c37bb6bb1b7cd1846e8106f9f057eab81d2"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.2/nebcli_6.43.2_linux_amd64.tar.gz"
      sha256 "36e0dfa07618cf37b71f6f6fe19bca15b7935e68ae1e655e802cf3bc23c3ced8"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
