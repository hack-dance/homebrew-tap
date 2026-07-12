class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.22.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.2/fclt-2.22.2-darwin-arm64"
      sha256 "41b21afb815cd94f1ca50d07e4c58e6476c5581c50fcdbe172a1e7824dc9d2b4"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.2/fclt-2.22.2-darwin-x64"
      sha256 "641871f82389cf8e68f4e8f0f187bb17b61435a920ad61cd1f5874f1d32ea566"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.22.2/fclt-2.22.2-linux-x64"
    sha256 "4b87558f706fadb8513cb659834b0e1ffbd062b3fa4b6fff4b5e5aba6d2b88c7"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
