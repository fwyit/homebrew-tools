cask 'qiqu' do
  version '2.9.1'
  sha256 'bf1366bbe47c432bb67ea1d8343b3fcf277743425819f499fee1a8f66483a6f7'

  url "http://hotchat-dl.iqiyi.com/qijupro_client_mac/qiju_conference.dmg"
  appcast 'http://conf.iqiyi.com/index.html#/download'
  name 'QiJu'
  name '奇聚会议'
  homepage 'http://conf.iqiyi.com/'
  app '奇聚会议.app', target: 'Qiju.app'


end
