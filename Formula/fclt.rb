class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.0/fclt-2.22.0-darwin-arm64"
      sha256 "a807bed5b807099b45122d8e4905ca85274b61abd5af96931abb52e929902942"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.0/fclt-2.22.0-darwin-x64"
      sha256 "3430ed21516a0f03f174be27d613431cf500c9a8c6d612c769f5913d2fbd8ab4"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.22.0/fclt-2.22.0-linux-x64"
    sha256 "648b9f0731400b394dce40423d0fd6c044f0dec0149489a7de68f26e59c2d111"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
