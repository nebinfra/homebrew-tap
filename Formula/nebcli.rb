# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.14.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.14.0/nebcli_6.14.0_darwin_all.tar.gz"
    sha256 "09bd5ff7fb6b84df6a9b1b530924e99dc17fd75ebe18538ca5df1689153216fd"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.14.0/nebcli_6.14.0_linux_arm64.tar.gz"
      sha256 "76d19f78c35887819affc0b28a5a2c25719301e3dc5ff6bb677e5d0e229c9511"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.14.0/nebcli_6.14.0_linux_amd64.tar.gz"
      sha256 "9e6a27d02a49f21b6d21c06be279a50ab9849323fe8a63f014658a7481ec8423"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
