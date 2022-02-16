
class Chglog < Formula
  desc "chglog is a changelog management library and tool"
  version "0.1.2"
  homepage "https://github.com/goreleaser/chglog"
  url "https://github.com/goreleaser/chglog/releases/download/v#{version}/chglog_#{version}_darwin_amd64.tar.gz"
  sha256 "cf9641cac351ea503ee8b1c7bdb72ab4161460c1710ac6b00171904b49d19d1d"
  license "MIT"

  def install
    bin.install "chglog" 
  end

  test do
    system "chglog", "version"
  end
end
