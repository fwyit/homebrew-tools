cask 'xylink' do
  version '2.27.8.52292'
  sha256 'f121f73e098767afc4964d2e432de9611b6e0c9e07f79c011b71902bdd62e114'

  url "http://cdn.xylink.com/as/150130/new/NemoDesktop-#{version}.pkg"
  appcast 'https://www.xylink.com/download'
  # name 'NemoDesktop'
  name 'XYLink'
  name '小鱼直播'

  homepage 'https://www.xylink.com/'

  pkg "NemoDesktop-#{version}.pkg"

  uninstall pkgutil: 'com.ainemo.NemoDesktop'
  zap trash: [
               '~/Library/Application Support/com.ainemo.NemoDesktop',
               '~/Library/Preferences/com.ainemo.NemoDesktop.plist',
               '~/Library/Saved\ Application\ State/com.ainemo.NemoDesktop.savedState'
             ]
end