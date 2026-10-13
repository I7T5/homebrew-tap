cask "edmund" do
  version "0.8.2"
  sha256 "8e27c8bcc36f2a326cba0a481ea4b83331c0c2905c3b7c0f73c4d1878dfe4a21"

  url "https://github.com/I7T5/Edmund/releases/download/v#{version}/Edmund-#{version}.dmg"
  name "Edmund"
  desc "Native Markdown editor with live preview"
  homepage "https://github.com/I7T5/Edmund"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Edmund.app"

  zap trash: [
    "~/Library/Application Scripts/com.i7t5.edmund",
    "~/Library/Application Scripts/com.i7t5.edmund.quicklook",
    "~/Library/Application Support/Edmund",
    "~/Library/Caches/com.i7t5.edmund",
    "~/Library/Containers/com.i7t5.edmund",
    "~/Library/Containers/com.i7t5.edmund.quicklook",
    "~/Library/HTTPStorages/com.i7t5.edmund",
    "~/Library/HTTPStorages/com.i7t5.edmund.binarycookies",
    "~/Library/Preferences/com.i7t5.edmund.plist",
    "~/Library/Saved Application State/com.i7t5.edmund.savedState",
    "~/Library/WebKit/com.i7t5.edmund",
  ]

  caveats <<~EOS
    Edmund is not notarized, so macOS blocks the first launch.
    Allow it in System Settings → Privacy & Security → Open Anyway, or run:
      xattr -dr com.apple.quarantine #{appdir}/Edmund.app
  EOS
end
