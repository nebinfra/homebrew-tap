# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.37.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.0/nebcli_6.37.0_darwin_all.tar.gz"
    sha256 "640e0745586d68557183668200bea1b6d046d4453e9d32ae41d254f42ea516b3"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.0/nebcli_6.37.0_linux_arm64.tar.gz"
      sha256 "515ba6fdd322cef3931ac831538090e959f77e7ce1befa6e83623c87de854e9f"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.37.0/nebcli_6.37.0_linux_amd64.tar.gz"
      sha256 "400e8625dabb4a652515773dd31d4072c9189b99135c694107b64f1ec9edb86c"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
