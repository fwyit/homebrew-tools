cask 'rime' do
  version '0.14.0'
  sha256 'e7bc74ed1f0447a48b8c86f3685d8c6d0640d39895e6e4550488beeb4f870926'

  url "https://dl.bintray.com/rime/squirrel/Squirrel-#{version}.zip"
  name 'rime'
  homepage 'https://rime.im/'

  pkg "Squirrel.pkg"

end
