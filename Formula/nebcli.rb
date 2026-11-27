# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.48.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.0/nebcli_6.48.0_darwin_all.tar.gz"
    sha256 "dbef80a384b536bb5f5d517482a47ab40bc1db1c6ac3832e7cd77f20641df77c"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.0/nebcli_6.48.0_linux_arm64.tar.gz"
      sha256 "7451a34e79d2219ddf81f4f2e473cc26771cf6b93c5ec49a6d653ec8f5e58dfe"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.48.0/nebcli_6.48.0_linux_amd64.tar.gz"
      sha256 "b2235976f9b73993d6b09877ea0741fcde5f90d6bba23e5f5e52f648008a924c"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
