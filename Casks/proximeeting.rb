cask "proximeeting" do
  version "2.2.3"
  sha256 "45bdb506fd9989080d9b691e49caa71b083f75d12d09193e4dc0e50d113f12a4"

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
