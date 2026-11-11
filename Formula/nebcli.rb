# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.38.7"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.7/nebcli_6.38.7_darwin_all.tar.gz"
    sha256 "b4c0e2fd14faf725ad3b8feac1955f1cd00afacdabb08388a6f1ec2ec901cdd4"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.7/nebcli_6.38.7_linux_arm64.tar.gz"
      sha256 "6d98b55d65725e863473e58a73783fdc04f13e8a558ad71d972e826ceb75dee0"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.38.7/nebcli_6.38.7_linux_amd64.tar.gz"
      sha256 "b66fc8923850ed4389002ac2f28d076fe328749813528e22936a7c45f9222c96"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
