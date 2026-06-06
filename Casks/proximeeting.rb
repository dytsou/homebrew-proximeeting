cask "proximeeting" do
  version "1.3.3"
  sha256 "239323a9967a75e029a65db15dfbd254ee7c5da5cfd4d9a39fab4bddac444f53"

  url "https://github.com/dytsou/ProxiMeeting/releases/download/v#{version}/ProxiMeeting.zip"
  name "ProxiMeeting"
  desc "Menu bar app that shows your next calendar meeting"
  homepage "https://github.com/dytsou/ProxiMeeting"

  depends_on macos: ">= :ventura"

  app "ProxiMeeting.app"

  livecheck do
    url "https://github.com/dytsou/ProxiMeeting/releases/latest"
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Preferences/com.proximeeting.app.plist",
  ]
end
