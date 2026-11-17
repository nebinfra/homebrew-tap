# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.44.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.44.0/nebcli_6.44.0_darwin_all.tar.gz"
    sha256 "263317e53598f4501a62fb747dc63ef2ef808821281d51986129343b6c5eb713"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.44.0/nebcli_6.44.0_linux_arm64.tar.gz"
      sha256 "9990f099a492468c55741f45c3405b2d069244de415c80b0625fa929abdc1a60"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.44.0/nebcli_6.44.0_linux_amd64.tar.gz"
      sha256 "e0cc61cf8b5e826ee19babece05d67703f406c713c9dde8b228e996b6d4c4db9"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
