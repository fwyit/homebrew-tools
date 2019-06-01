# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RancherRio < Formula
  desc "使用rancher-rio K8微Paas架构"
  homepage "https://rio.io"
  url "https://github.com/rancher/rio/releases/download/v0.1.1-rc3/rio-darwin-amd64"
  version "v0.1.1-rc3"
  sha256 "75598f4a9946cdf14974d9fd55cb9dc08c7226f708dca686a887301374ed128f"

  bottle :unneeded

  def install
    system "mv rio-darwin-amd64 rio"
    bin.install "rio"
  end

  test do
    system "rio -v"
  end
end
