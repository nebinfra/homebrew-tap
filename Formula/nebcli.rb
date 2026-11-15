# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.43.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.1/nebcli_6.43.1_darwin_all.tar.gz"
    sha256 "2c0778eef411ff221b4cbfabc0fb9c389487450c74967a81e32e8abfacbad992"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.1/nebcli_6.43.1_linux_arm64.tar.gz"
      sha256 "7d37885b0f4d98ea99d3cb2cff1e7a3a61d5e850ad00805571e883d92e50dcab"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.43.1/nebcli_6.43.1_linux_amd64.tar.gz"
      sha256 "c13809937ec65b30c8e6361ba9c89d92c34e9aed98258f561a48254b3a95b345"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
