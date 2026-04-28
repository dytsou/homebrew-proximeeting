cask "nextmeeting" do
  version "1.3.3"
  sha256 "117c14996b61fdd8bfd7930f3e8c9356459558802ef047c637c7f5902189cf09"

  url "https://github.com/dytsou/NextMeeting/releases/download/v#{version}/NextMeeting.zip"
  name "NextMeeting"
  desc "Menu bar app that shows your next calendar meeting"
  homepage "https://github.com/dytsou/NextMeeting"

  depends_on macos: ">= :ventura"

  app "NextMeeting.app"

  livecheck do
    url "https://github.com/dytsou/NextMeeting/releases/latest"
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Preferences/com.nextmeeting.app.plist",
  ]
end
