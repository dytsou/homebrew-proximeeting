cask "proximeeting" do
  version "2.2.1"
  sha256 "6050e55e59d9665c054233252939ff9fceb82fbf2f1cb1715103d78563788d8d"

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
