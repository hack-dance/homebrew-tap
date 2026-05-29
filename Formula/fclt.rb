class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.5/fclt-2.8.5-darwin-arm64"
      sha256 "1230aa2bc4d659e1a523b2135fca0e7ed372b5f1e71016707f9373ce1a81ab90"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.5/fclt-2.8.5-darwin-x64"
      sha256 "6d5aa84fa797ae71338af9a2f167361bd5034c7b76b046b66bf7fd0e113f862e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.5/fclt-2.8.5-linux-x64"
    sha256 "6e6301c0761bd19d47c8ec846658a4df19275f597b98c90821574b23c4b6b765"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
