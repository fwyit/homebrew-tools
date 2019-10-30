cask 'taskpomodoro' do
  version '1.9.0-beta.2'
  sha256 '6e033b4d892418066ac13d473e1cc78bdd7f0784f755dbb5f27a4e9a3a336a1a'

  url "https://github.com/coddingtonbear/taskwarrior-pomodoro/releases/download/v#{version}/taskwarrior-pomodoro-#{version}.dmg"
  name 'TaskPomodoro'
  homepage 'https://github.com/coddingtonbear/taskwarrior-pomodoro'

  app 'Taskwarrior Pomodoro.app', target: 'TaskPomo.app'
end
