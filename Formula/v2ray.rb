# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class V2ray < Formula
  desc "翻墙工具"
  homepage "https://github.com/v2ray/v2ray-core"
  url "https://github.com/v2ray/v2ray-core/releases/download/v4.18.2/v2ray-macos.zip"
  version "v4.18.2"
  sha256 ""
  # depends_on "cmake" => :build
  depends_on "gnupg" => :build

  def install
    system "pwd"
    bin.install "v2ray"
    bin.install "v2ctl"
  end

  test do
    system "false"
  end
end
