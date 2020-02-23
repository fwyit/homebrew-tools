class Helm2< Formula
  desc "The Kubernetes package manager"
  homepage "https://helm.sh/"
  version "v2.13.1"
  url "https://get.helm.sh/helm-#{version}-darwin-amd64.tar.gz"
  sha256 "c9564c4133349b98a8c1dda42fdb6545f6e4bfdf0980cdfc38cf76d2f8e5e701"

  def install
    bin.install "tiller"
    bin.install "helm"
  end

  test do
    system "#{bin}/helm", "create", "foo"
    assert File.directory? "#{testpath}/foo/charts"

    version_output = shell_output("#{bin}/helm version --client 2>&1")
    assert_match "GitTreeState:\"clean\"", version_output
    assert_match stable.instance_variable_get(:@resource).instance_variable_get(:@specs)[:revision], version_output if build.stable?
  end
end
