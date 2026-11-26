# typed: false
# frozen_string_literal: true

class Nebcli < Formula
  desc "nebcli command-line tool"
  homepage "https://github.com/nebinfra/nebcli-dist"
  version "6.46.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.0/nebcli_6.46.0_darwin_all.tar.gz"
    sha256 "cb1bbb1e72a51c182c2f2a5df916928ad0aa9b48ab87c8a656fcfeae9d723e2e"
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.0/nebcli_6.46.0_linux_arm64.tar.gz"
      sha256 "c58c1215d6d8184774365d991aed1674e86c15cc6d48ca4fc61a9ea5f573b013"
    else
      url "https://github.com/nebinfra/nebcli-dist/releases/download/v6.46.0/nebcli_6.46.0_linux_amd64.tar.gz"
      sha256 "117ec96093ec55ebf5bc8c093330c78368280add2b04e2ec30676a421b60672d"
    end
  end

  def install
    bin.install "nebcli"
  end

  test do
    system "#{bin}/nebcli", "version"
  end
end
