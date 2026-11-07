class Proxylink < Formula
  desc "将 singbox/Xray 的节点链接解析用 Go 语言实现。"
  homepage "https://github.com/Fanju6/Proxylink"
  license "GPL-3.0"
  version "0.0.1"
  head "https://github.com/Fanju6/Proxylink.git", revision: "44929c0984944870297c260dc43a4aa9262f9e1c"

  depends_on "go" => :build

  deny_network_access!

  def fetch
    cd "Proxylink" do
      system "go", "mod", "download"
    end
  end

  def install
    cd "Proxylink" do
      system "go", "build",
             "-trimpath",
             "-ldflags=-s -w",
             "-o", bin/"proxylink",
             "."
    end
  end

  test do
    system "false"
  end
end
