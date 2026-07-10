class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.20.1/fclt-2.20.1-darwin-arm64"
      sha256 "81fde0b62a95f5c082a4361be58d1341cb1d3f5e80dc7af850186ce652a80d29"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.20.1/fclt-2.20.1-darwin-x64"
      sha256 "290bcd145e9a3a2172462a8d37f79b9dad432db43eb45d553ab95cec6b16aab2"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.20.1/fclt-2.20.1-linux-x64"
    sha256 "932ec7cf3faa8a960c2f572a7a641e3cb998355c4df591494b18bda8666a6046"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
