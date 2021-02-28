class AdguardDns < Formula
  desc "家用DNS广告去除商"
  version "0.105.1"
  homepage "https://adguard.com/adguard-home.html"
  url "https://github.com/AdguardTeam/AdGuardHome/releases/download/v#{version}/AdGuardHome_darwin_amd64.zip"
  sha256 "81d900fc962d7e567c7a24925dc52ca71e57b6fda4adb5ae64671aaf3787dd8b"

  # depends_on "cmake" => :build

  def install
    bin.install "AdGuardHome" => "adguard"
  end

  test do
    system "adguard --version"
  end
end
