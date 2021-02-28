# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Traefik < Formula
  desc "让部署微服务更加便捷而诞生的现代HTTP反向代理、负载均衡工具"
  homepage "https://traefik.cn/"
  version "2.4.5"
  url "https://github.com/traefik/traefik/releases/download/v#{version}/traefik_v#{version}_darwin_amd64.tar.gz"
  # url "http://localhost:8000/traefik_v#{version}_darwin_amd64.tar.gz"
  sha256 "1ce58964c312b9854bce93b00cbb5081fc54158225a8ef26955c0e1de346a095"

  # depends_on "cmake" => :build

  def install
    bin.install "traefik"
  end

  test do
    system "traefik version"
  end
end
