class P11Kit < Formula
  desc "Library to load and enumerate PKCS#11 modules"
  homepage "https://p11-glue.github.io/p11-glue/p11-kit.html"
  url "https://github.com/p11-glue/p11-kit/releases/download/0.26.5/p11-kit-0.26.5.tar.xz"
  sha256 "f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7"
  license "BSD-3-Clause"
  compatibility_version 1
  head "https://github.com/p11-glue/p11-kit.git", branch: "master"

  bottle do
    rebuild 1
    sha256 arm64_monterey:  "a1c85ddc587d4b0e6ad38f7b58420ed0fc4a1ccdb038bee1451d9d81fc3fb434"
    sha256 arm64_big_sur:   "c8610976401ff3745b737973335cd2ec7a3113737aadc9e2a1243adf404f41a3"
    sha256 tahoe:           "dab5fa13833c7291e763b7151a1b9d60cec232017590908c66e4acdc4760a44c"
    sha256 monterey:        "46805ec48a06585f71e5acaa4e099c32696a2dd7700817882211abab75fa3f1d"
    sha256 big_sur:         "6db6726e6ba1314792648413bc991bd717380eb3ae325895750eab515ce5fa75"
    sha256 x86_64_linux:    "41dd8094535e5cb03c1c4e94290cee3047e79c07183cdccbb0f4f3cbe89d29db"
    sha256 x86_64_catalina: "dc5592e236946f8a3e57998214d13f1c0db7dab5bdd9602bb0c4a84dacf2d17a"
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "ca-certificates"
  depends_on "libtasn1"

  uses_from_macos "libffi"

  # meson test runs a server so needs network access
  allow_network_access! :build

  def install
    # https://bugs.freedesktop.org/show_bug.cgi?id=91602#c1
    ENV["FAKED_MODE"] = "1"

    args = %W[
      -Dsystem_config=#{etc}
      -Dmodule_config=#{etc}/pkcs11/modules
      -Dtrust_paths=#{etc}/ca-certificates/cert.pem
      -Dsystemd=disabled
    ]

    system "meson", "setup", "_build", *args, *std_meson_args
    system "meson", "compile", "-C", "_build", "--verbose"
    # This formula is used with crypto libraries, so let's run the test suite.
    system "meson", "test", "-C", "_build", "--timeout-multiplier=2"
    system "meson", "install", "-C", "_build"

    # HACK: Work around p11-kit: couldn't load module: .../lib/pkcs11/p11-kit-trust.so
    # Issue ref: https://github.com/p11-glue/p11-kit/issues/612
    (lib/"pkcs11").install_symlink "p11-kit-trust.dylib" => "p11-kit-trust.so" if OS.mac?
  end

  test do
    assert_match "library-manufacturer: PKCS#11 Kit", shell_output("#{bin}/p11-kit list-modules --verbose")
  end
end
