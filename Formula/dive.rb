# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dive < Formula
  desc "A tool for exploring each layer in a docker image"
  homepage "https://github.com/wagoodman/dive"
  url "https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_darwin_amd64.tar.gz"
  version "0.6.0"
  sha256 "6c671106cd01831fa100a20f795a8c2e89ba4f2f401b5aaf6d4f11de2858ee95"
  # depends_on "cmake" => :build

  def install
    bin.install "dive"
  end

  test do
    system "dive --help"
  end
end
