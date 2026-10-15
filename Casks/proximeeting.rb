cask "proximeeting" do
  version "2.2.3"
  sha256 "45bdb506fd9989080d9b691e49caa71b083f75d12d09193e4dc0e50d113f12a4"

  url "https://github.com/dytsou/ProxiMeeting/releases/download/v#{version}/ProxiMeeting.zip"
  name "ProxiMeeting"
  desc "Menu bar app that shows your next calendar meeting"
  homepage "https://github.com/dytsou/ProxiMeeting"

  depends_on macos: :ventura

  app "ProxiMeeting.app"

  # Quit on uninstall/upgrade so the .app can be replaced cleanly.
  uninstall quit: "com.proximeeting.app"

  # brew upgrade reopens with `open -b` + unsetenv_others; brew reinstall never
  # reopens. postflight_steps `run open` is sandboxed and hits kLSUnknownErr for
  # GUI launches — use legacy postflight (full user env) so the LSUIElement app
  # actually comes back after quit.
  postflight do
    system_command "/usr/bin/open", args: ["#{appdir}/ProxiMeeting.app"]
  end

  livecheck do
    url "https://github.com/dytsou/ProxiMeeting/releases/latest"
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Preferences/com.proximeeting.app.plist",
  ]
end
