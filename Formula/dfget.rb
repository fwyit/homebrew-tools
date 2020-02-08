class Dfget < Formula
  desc "阿里巴巴 蜻蜓P2P下载客户端"
  homepage "https://d7y.io/zh-cn/"
  version "0.4.3"
  url "https://github.com/dragonflyoss/Dragonfly/releases/download/v#{version}/df-client_#{version}_darwin_amd64.tar.gz"
  sha256 "8cadc59e373960f8f08a1b97d25e17ef753a672a84b5439e3e5afcd59ef5f074"

  def install
    system "pwd"
    bin.install "dfget"
    bin.install "dfdaemon"
  end

  test do
    system "false"
  end
end
