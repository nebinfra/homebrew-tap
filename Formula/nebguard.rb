# typed: false
# frozen_string_literal: true

class Nebguard < Formula
  desc "nebguard command-line tool"
  homepage "https://github.com/nebinfra/nebguard-dist"
  version "5.23.3"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.3/nebguard_5.23.3_darwin_all.tar.gz"
    sha256 "b377f7a97030584191365f39bd898770248e238348dac1b9edc2407bdc118125"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.3/nebguard_5.23.3_linux_arm64.tar.gz"
      sha256 "be7c21446dc3eca93288f20c3e2439efb804d09e96501b7aa61727406a4e6617"
    else
      url "https://github.com/nebinfra/nebguard-dist/releases/download/v5.23.3/nebguard_5.23.3_linux_amd64.tar.gz"
      sha256 "24c4f27216687d730bd31da54e5ec63196ff0e79e9f07ad3229c7b7b576597ed"
    end
  end

  def install
    bin.install "nebguard"
  end

  test do
    system "#{bin}/nebguard", "version"
  end
end
