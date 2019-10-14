class Goproxy < Formula
  desc "golang实现的高性能多功能代理"
  homepage "https://github.com/snail007/goproxy"
  version "v8.3"
  url "https://github.com/snail007/goproxy/releases/download/#{version}/proxy-darwin-amd64.tar.gz"
  sha256 "88f17059acca4b4d46b0831d2966806351e2da72c3ec6d3f05f6198b49465e59"

  # depends_on "cmake" => :build

  def install
    sbin.install "proxy" => "goproxy"
    (etc/"goproxy").install "blocked"
    (etc/"goproxy").install "direct"
    (etc/"goproxy").install "hosts"
    (etc/"goproxy").install "only"
    (etc/"goproxy").install "resolve.rules"
    (etc/"goproxy").install "rewriter.rules"
    (etc/"goproxy").install "stop"
  end

  test do
    system "false"
  end
end
