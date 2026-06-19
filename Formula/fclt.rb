class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.9/fclt-2.13.9-darwin-arm64"
      sha256 "e4bcc35a4d90ec1bd4dd408734dddb61168cf67ab9ec45035777bb600047ba58"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.9/fclt-2.13.9-darwin-x64"
      sha256 "28fe56ed8ffd75cbcb47b07e3ad5835ee27cd5e71eeafd4a884e20451789ba3f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.9/fclt-2.13.9-linux-x64"
    sha256 "737a4256570deacede724a24a9ade17c288caf2e012967680f7e286015579008"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
