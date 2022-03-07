class Kaf < Formula
  desc "Modern CLI for Apache Kafka, written in Go."
  homepage "https://github.com/birdayz/kaf"
  version "0.1.44"
  license "Apache-2.0"

  os = OS.mac? ? "Darwin" : "Linux"
  arch = 
    case Hardware::CPU.arch
    when :x86_64 then "x86_64"
    when :arm64 then "arm64"
    else
      raise "kaf: Unsupported system architecture #{Hardware::CPU.arch}"
    end
      
  url "https://github.com/birdayz/kaf/releases/download/v#{version}/kaf_#{version}_#{os}_#{arch}.tar.gz"

  @@sha256 = 
    case "#{os}_#{arch}"
    when "Darwin_arm64" then  "4817d6c465a56b377551839c7c0af0a33438f6a97676679cf12811a8a9630737"
    when "Linux_x86_64" then  "a1b37bc455f1e8e274790e2b9081686f0fa18fbbdaa5812a7e22fbf43962e8ca"
    when "Linux_arm64" then  "b810ee73d8fa6e055a05d0e9b478c45cc8d70d57c3cf5a38c983941af4fc5f86"
    when "Darwin_x86_64" then  "e91066f650acdfb3a5f49b76dd5dfa0c028af5b68cccf77c8f22b658d79e7adc"
    end

  sha256 @@sha256

  def install
    bin.install "kaf"
  end

  test do
    system "kaf", "-version"
  end
end
