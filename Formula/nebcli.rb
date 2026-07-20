# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.12.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.1/nebcli_6.12.1_darwin_all.tar.gz"
    sha256 "3bade6bb760a95a13e75efe3467823bf1f71e85412489d10d32eeeea582e85a4"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.1/nebcli_6.12.1_linux_arm64.tar.gz"
      sha256 "272b1225e33feb302a46a6a909acf6c2bc3c8e5f75758dc34d8bf3fceb1531a3"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.12.1/nebcli_6.12.1_linux_amd64.tar.gz"
      sha256 "dec64ed6328aa2766edfa390af2c0c29aaeb3ee22ce5b34af62fc120b5e04368"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
