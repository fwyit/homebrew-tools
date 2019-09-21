cask 'xquartz-beta' do
  version '2.7.11_rc2'
  sha256 '70ce780b169d6522be73c249fc7909ede9edc089b09f05deb1e6efa9a67862a1'

  # bintray.com/xquartz was verified as official when first introduced to the cask
  url "https://dl.bintray.com/xquartz/downloads/XQuartz-#{version}.dmg"
  # url "http://down1.iops.cc/XQuartz-2.7.11_rc2.dmg"
  appcast 'https://www.xquartz.org/releases/sparkle/release.xml'
  name 'XQuartz'
  homepage 'https://www.xquartz.org/'

  auto_updates true

  pkg 'XQuartz.pkg'

  uninstall quit:      'org.macosforge.xquartz.X11',
            launchctl: [
                         'org.macosforge.xquartz.startx',
                         'org.macosforge.xquartz.privileged_startx',
                       ],
            pkgutil:   'org.macosforge.xquartz.pkg',
            delete:    [
                         '/opt/X11',
                         '/private/etc/manpaths.d/40-XQuartz',
                         '/private/etc/paths.d/40-XQuartz',
                       ]

  zap trash: [
               '~/.Xauthority',
               '~/Library/Application Support/XQuartz',
               '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.macosforge.xquartz.x11.sfl*',
               '~/Library/Caches/org.macosforge.xquartz.X11',
               '~/Library/Cookies/org.macosforge.xquartz.X11.binarycookies',
               '~/Library/Logs/X11/org.macosforge.xquartz.log',
               '~/Library/Logs/X11/org.macosforge.xquartz.log.old',
               '~/Library/Preferences/org.macosforge.xquartz.X11.plist',
               '~/Library/Saved Application State/org.macosforge.xquartz.X11.savedState',
             ],
      rmdir: [
               '~/.fonts',
               '~/Library/Logs/X11',
             ]
end
