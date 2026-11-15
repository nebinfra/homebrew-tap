# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.42.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.2/nebcli_6.42.2_darwin_all.tar.gz"
    sha256 "c35ee6c254972332c290e4af36f7a3e681da7613dc368b7d08cca33ea6f36793"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.2/nebcli_6.42.2_linux_arm64.tar.gz"
      sha256 "bbc04b56558777013e72dbff2b3436078b9ff4d72a118bf09c8b26504d5cd6d5"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.42.2/nebcli_6.42.2_linux_amd64.tar.gz"
      sha256 "a74d3016b70ea7a5ff22402287e823b2c0cc8f14f028a0608011e2dd5be5a2be"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
