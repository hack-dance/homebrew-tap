class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.7/fclt-2.34.7-darwin-arm64"
      sha256 "fe694675507aa59d4469df59a4fca6e39637e290b5175df7d466da0994cc468e"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.7/fclt-2.34.7-darwin-x64"
      sha256 "e1fa9c43b467f14578b863a5bd431554b521bf5562cda3fcfe46f431ae8e6489"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.7/fclt-2.34.7-linux-x64"
    sha256 "e16c085d2d9e33618e5429b4b385bd9d551418b967ee1a8cd426f55448657fc5"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
