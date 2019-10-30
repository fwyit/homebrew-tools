cask 'hitfilm3' do
  version '3.1.0157'
  sha256 '07c70d34b3994d41d2576b6631ee7445439201f5c08a4bd2cbf93322da4c39b4'

  url "http://installers.fxhome.com/hitfilm-3-express/HitFilm3Express_#{version}.pkg"

  name 'HitFilm3Express'
  homepage 'https://fxhome.com/software-install/hitfilm-3-express'
  pkg "HitFilm3Express_#{version}.pkg"

  # app 'HitFilm3'
end
