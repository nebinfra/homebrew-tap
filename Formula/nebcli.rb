# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.16.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.16.0/nebcli_6.16.0_darwin_all.tar.gz"
    sha256 "dcbf05c9fd0ffb094d764bde61c678190a1a3d61169e69b047da2c43cbbf013f"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.16.0/nebcli_6.16.0_linux_arm64.tar.gz"
      sha256 "46f9609998c3260f99cbda761a3d4004765e6c026d20a57d3f9799e214848bb2"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.16.0/nebcli_6.16.0_linux_amd64.tar.gz"
      sha256 "51d3fbcddad4d4663344f243a577f6def0fb5d49f8590b02da4c3dd6afc5ad40"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
