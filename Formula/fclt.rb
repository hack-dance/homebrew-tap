class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.35.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.35.1/fclt-2.35.1-darwin-arm64"
      sha256 "2a77d1a6f5729ea52f31fef10fe758ed823be7ac94f77a99574911a6a20e76e8"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.35.1/fclt-2.35.1-darwin-x64"
      sha256 "d206992acfd50b5dc31317dbbc60f0bc4ee42d7bcd317caf1d514ed825392e4e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.35.1/fclt-2.35.1-linux-x64"
    sha256 "43a12d7b3abd5dc17626de012d1f2b4850fcaeed00df59060abff64bfa280df9"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
