class VdeLima < Formula
  desc "vmnet.framework support for unmodified rootless QEMU (with VDE)  "
  homepage "https://github.com/lima-vm/vde_vmnet"
  license "Apache License 2.0"
  head "https://github.com/lima-vm/vde_vmnet.git", tag: "v0.6.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    ENV.append "PREFIX", "/opt/vde"
    inreplace "Makefile", "git submodule", "#git submodule"
    system "git", "submodule", "update", "--init"
    system "make", "install", "--dry-run"
    system "make", "install"
    system "sudo", "make", "install"
  end

  test do
    system "false"
  end
end
