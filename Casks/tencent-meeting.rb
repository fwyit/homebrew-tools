cask 'tencent-meeting' do

  version '1.1.6.413'
  sha256 'a2aa92a4362c83a59c14793078ba37df1626f51bff210ac9838b40b7888a35b5'

  url "https://down.qq.com/download/#{version}.publish_release.dmg"
  appcast 'https://meeting.tencent.com/download-mac.html'
  name 'Meeting'
  name '腾讯会议'
  homepage 'https://meeting.qq.com/'

  auto_updates true

  app 'Meeting.app'

  # zap trash: [
  #              '~/Library/Application Support/iTerm',
  #              '~/Library/Application Support/iTerm2',
  #              '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.googlecode.iterm2.sfl*',
  #              '~/Library/Caches/com.googlecode.iterm2',
  #              '~/Library/Preferences/com.googlecode.iterm2.plist',
  #              '~/Library/Saved Application State/com.googlecode.iterm2.savedState',
  #            ]
end
