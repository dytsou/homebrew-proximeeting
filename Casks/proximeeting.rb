cask "proximeeting" do
  version "2.2.2"
  sha256 "01b8896ff0ac1cd236fa34766ee00710bec95d6d2081eee0e50f64879c2086b5"

  url "https://github.com/dytsou/ProxiMeeting/releases/download/v#{version}/ProxiMeeting.zip"
  name "ProxiMeeting"
  desc "Menu bar app that shows your next calendar meeting"
  homepage "https://github.com/dytsou/ProxiMeeting"

  depends_on macos: :ventura

  app "ProxiMeeting.app"

  # Quit on uninstall/upgrade so Homebrew can reopen the new binary (`open -b`).
  uninstall quit: "com.proximeeting.app"

  livecheck do
    url "https://github.com/dytsou/ProxiMeeting/releases/latest"
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Preferences/com.proximeeting.app.plist",
  ]
end
