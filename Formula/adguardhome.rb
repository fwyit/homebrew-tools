class Adguardhome < Formula
  desc "Network-wide ads & trackers blocking DNS server"
  homepage "https://adguard.com/adguard-home.html"
  version "0.107.3"
  url "https://github.com/AdguardTeam/AdGuardHome/releases/download/v#{version}/AdGuardHome_darwin_arm64.zip"
  sha256 "c8f78826ee83dc347f5938ce84034a2782f80604c42a381b5d88c53a5e8d4798"
  license "GPL"
  conflicts_with "adguard", because: "No need to install cask project"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AdguardTeam/AdGuardHome/releases/download/v#{version}/AdGuardHome_darwin_arm64.zip"
      sha256 "c8f78826ee83dc347f5938ce84034a2782f80604c42a381b5d88c53a5e8d4798"
    else
      url "https://github.com/AdguardTeam/AdGuardHome/releases/download/v#{version}/AdGuardHome_darwin_amd64.zip"
      sha256 "c8f78826ee83dc347f5938ce84034a2782f80604c42a381b5d88c53a5e8d4798"
    end
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/adguard</string>
        <string>-c</string>
        <string>/Users/bj00060ml/etc/adguard.yml</string>
      </array>
      <key>RunAtLoad</key>
      <true />
      <key>KeepAlive</key>
      <true />
      <key>WorkingDirectory</key>
      <string>/Users/bj00060ml/bin</string>
      <key>StandardErrorPath</key>
      <string>/dev/null</string>
      <key>StandardOutPath</key>
      <string>/dev/null</string>
    </dict>
    </plist>
    EOS
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "AdGuardHome" => "adguard"
  end

  test do
    system "adguard", "--version"
  end
end
