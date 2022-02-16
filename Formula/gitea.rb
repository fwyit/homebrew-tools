# 参考项目： https://gitea.com/gitea/homebrew-gitea/src/branch/master/gitea-head.rb

class Gitea < Formula
  desc "Git with a cup of tea, painless self-hosted git service"
  homepage "https://gitea.io"
  version "1.16.1"
  arch = case Hardware::CPU.arch
    when :i386 then "386"
    when :x86_64 then "amd64"
    when :arm64 then "arm64"
    else
      raise "gitea: Unsupported system architecture #{Hardware::CPU.arch}"
    end
  os = OS.mac? ? "darwin-10.12" : "linux"
  @@file = "gitea-#{version}-#{os}-#{arch}"
  url "https://dl.gitea.io/gitea/#{version}/#{@@file}.xz"
  sha256 "791d8f6493a1cea3d95ae3983879eec30f7d41f56f5e5e6293df60c4ba4b3f8c"

  def install
    bin.install "#{@@file}" => "gitea"
  end

  test do
    system "gitea", "--version"
  end
end
