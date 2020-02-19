cask 'iqiyi-meeting' do
  version '2.9.1'
  sha256 'bf1366bbe47c432bb67ea1d8343b3fcf277743425819f499fee1a8f66483a6f7'

  url "http://hotchat-dl.iqiyi.com/qijupro_client_mac/qiju_conference.dmg"
  appcast 'http://conf.iqiyi.com/index.html#/download'
  name 'iqiyi'
  name 'qiju'
  name '奇聚会议'
  homepage 'http://conf.iqiyi.com/'
  app '奇聚会议.app', target: 'Qiju.app'


  # pkg "nmap-#{version}.mpkg",
  #     choices: [
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 0,
  #                },
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap.ncat',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 0,
  #                },
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap.ndiff',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 0,
  #                },
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap.nping',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 0,
  #                },
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap.nmap-update',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 0,
  #                },
  #                {
  #                  'choiceIdentifier' => 'org.insecure.nmap.zenmap',
  #                  'choiceAttribute'  => 'selected',
  #                  'attributeSetting' => 1,
  #                },
  #              ]

  # uninstall pkgutil: 'org.insecure.nmap.zenmap'

  # zap trash: [
  #              '~/Library/Saved Application State/org.insecure.Zenmap.savedState',
  #              '~/.zenmap',
  #            ]
end
