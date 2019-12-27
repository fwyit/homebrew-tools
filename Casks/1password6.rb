cask '1password6' do
  version '6.8.6'
  sha256 '8a2e922d3fbf0cafcf530301b1d5db315fc37fb5ac5c732feecbc0b6190a47d9'

  url "https://c.1password.com/dist/1P/mac4/1Password-#{version}.zip"
  appcast "https://app-updates.agilebits.com/product_history/OPM4"
  name '1Password #{version.major}'
  homepage 'https://1password.com/'

  auto_updates true
  depends_on macos: '>= :sierra'

  app "1Password #{version.major}.app"

  zap trash: [
               "~/Library/Application Scripts/2BUA8C4S2C.com.agilebits.onepassword#{version.major}-helper",
               "~/Library/Containers/2BUA8C4S2C.com.agilebits.onepassword#{version.major}-helper",
               '~/Library/Group Containers/2BUA8C4S2C.com.agilebits',
               '~/Library/Logs/1Password',
               "~/Library/Preferences/com.agilebits.onepassword#{version.major}.plist",
             ]
end
