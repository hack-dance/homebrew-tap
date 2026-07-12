class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.22.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.3/fclt-2.22.3-darwin-arm64"
      sha256 "eaf33ad87ef1d859866909fcfdd7ff94f6c236803d923c3e7084d7b4ce248ae1"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.3/fclt-2.22.3-darwin-x64"
      sha256 "f8072758b9a6f2bcb9b73cfcfd55d16856a3e113dc543016bf3aa572a0cd6cd5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.22.3/fclt-2.22.3-linux-x64"
    sha256 "18e0b99fc0fa097911e60a352a92b372599fcfaa8f83a7fe88560bb33a29eef3"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
