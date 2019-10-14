class Helm3 < Formula
  desc "The Kubernetes package manager with version 3"
  homepage "https://helm.sh/"
  version "v3.0.0-beta.4"
  url "https://get.helm.sh/helm-#{version}-darwin-amd64.tar.gz"
  sha256 "511a7732799369996b249ee6c1c9106eb1a01ea7507054be0da513a910b8bd9c"

  # depends_on "cmake" => :build

  def install
    bin.install "helm" => "helm3"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test helm3`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
