class Helm3 < Formula
  desc "The Kubernetes package manager with version 3"
  homepage "https://helm.sh/"
  version "v3.1.1"
  url "https://get.helm.sh/helm-#{version}-darwin-amd64.tar.gz"
  sha256 "2ce00e6c44ba18fbcbec21c493476e919128710d480789bb35bd228ae695cd66"

  # depends_on "cmake" => :build
  # conflicts_with "helm2", :because => "helm2 and helm3 is uncompatibal"

  def install
    bin.install "helm" => "helm"
  end

  test do
    system "false"
  end
end
