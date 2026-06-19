class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.5/fclt-2.13.5-darwin-arm64"
      sha256 "9acf11915a21a5f158b54cdb326b218aee0d83c6e42a080cb6a97c5af04b69fb"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.5/fclt-2.13.5-darwin-x64"
      sha256 "9543104845f62c7550e77b4df5577da18a4ff18d8a568dbcde3aa6165458568c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.5/fclt-2.13.5-linux-x64"
    sha256 "1b51100c229a489a2817dbfb479d6c1731f06c4ec6a8e4ecb3957af202b12f8e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
