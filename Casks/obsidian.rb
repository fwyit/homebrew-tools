cask 'obsidian' do
  version '0.12.12'
  sha256 '1c7cf5ae0f49ade483cbda4ed27a02849a0b6978c70682b82f789e68827cbdc7'

  url "https://github.com/obsidianmd/obsidian-releases/releases/download/v#{version}/Obsidian-#{version}-universal.dmg"
  name 'obsidian'
  homepage 'https://obsidian.md/'

  app 'Obsidian.app'
end
