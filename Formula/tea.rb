class Tea < Formula
  desc "A command line tool to interact with Gitea servers"
  homepage "https://gitea.com/gitea/tea"
  version "0.8.0"
  @@file = "tea-#{version}-darwin-arm64"
  url "https://dl.gitea.io/tea/#{version}/#{@@file}.xz"

  os = OS.mac? ? "darwin" : "linux"
  arch = case Hardware::CPU.arch
        when :i386 then "386"
        when :x86_64 then "amd64"
        when :arm64 then "arm64"
        else
          raise "tea: Unsupported system architecture #{Hardware::CPU.arch}"
        end
  # @sha256 = %x[ curl -sL #{url}.sha256 ].split.first
  @sha256 = case "#{os}-#{arch}"
        when "linux-386" then "c006b38d6cbede7c3932bb762df1a06fa485e6c2af03d736bd3fa304a60376ba"   # binary
        when "linux-amd64" then "29976cc605f0da406efdc010d4a63ff225f990ebb49efe9f54ecf5c5796e771e"
        when "linux-arm64" then "f85754008200f4ce3a1de50f77eb72d4960fffd069d19c0655376357a70a5226" # binary
        when "darwin-amd64" then "8d9aaef2c9e851759a575892d5af8dd2130f0b9c5705189572a282f812126a48"
        when "darwin-arm64" then "50c14a8bee6df16483eb370dc5491e85db3a0f1a21c8d3790e0b4be0531cf6bd"
        else
          raise "tea: Unsupported system #{os}-#{arch}"
        end
  sha256 @sha256

  def install
    bin.install "#{@@file}" => "tea"
  end

  test do
    system "tea", "-v"
  end
end
