class Karmada < Formula
  desc "Open, Multi-Cloud, Multi-Cluster Kubernetes Orchestration"
  homepage "https://github.com/karmada-io/karmada"
  version "1.0.2"
  url "http://down.loc/github/karmada-io/karmada/releases/download/v#{version}/kubectl-karmada-darwin-arm64.tgz"
  sha256 "9af2b1aa9452d6d6342df6b1174112e48cebf19aca699779f59548de0f5cc912"
  license ""

  def install
    bin.install "kubectl-karmada"
  end

  test do
    system "kubectl-karmada", "version"
  end
end
