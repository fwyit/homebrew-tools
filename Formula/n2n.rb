class N2n < Formula
  desc "自建p2p网络 edge/supernode"
  homepage "https://github.com/meyerd/n2n"
  version   "2.1"
  url "https://github.com/meyerd/n2n.git",
    :using    => :git,
    :tag      => "master",
    :revision => 'e4d8c144d68cff0176c342b801cefe69b453c076'


  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "openssl" => :build

  def install
    pre = "n2n_v2"
    system "pwd"
    system "cmake", "-B", *pre, *pre
    system "make", "-C", *pre

    bin.install "n2n_v2/n2n_test" => "n2n_test" 
    bin.install "n2n_v2/edge" => "edge" 
    bin.install "n2n_v2/supernode" => "supernode" 
  end

  test do
    system "false"
  end
end
