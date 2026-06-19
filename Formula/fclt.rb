class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.12.0/fclt-2.12.0-darwin-arm64"
      sha256 "0ba02f73e9abd5443f9cf251389a8dddcdeeeb9837cb9a822dae70e5b86c6ef1"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.12.0/fclt-2.12.0-darwin-x64"
      sha256 "7a3d5fbc154f8ef17ac0a74245959b5a74e3b1a717b752cc081d8907bb6831fe"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.12.0/fclt-2.12.0-linux-x64"
    sha256 "cffdf88c52b44a5ee17d7f087a74298add757222b03f84d84605f48e85e5060c"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
