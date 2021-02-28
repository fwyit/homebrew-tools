class Coredns < Formula
  desc "dns本地工具"
  version "1.8.1"
  homepage "https://coredns.io/"
  url "https://github.com/coredns/coredns/releases/download/v#{version}/coredns_#{version}_darwin_amd64.tgz"
  sha256 "b816c5d7d2c5a92dbc543c3bce0218c4ecf3c110ca2f95c84e667798baa05d4f"

  # depends_on "cmake" => :build

  def install
    bin.install "coredns"
  end

  test do
    system "coredns -version"
  end
end
