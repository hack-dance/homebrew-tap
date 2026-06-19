class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.12/fclt-2.8.12-darwin-arm64"
      sha256 "4111679587e1e9f66380251f0141575be04175d4c7637ad6b42d6fcb62e7adba"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.12/fclt-2.8.12-darwin-x64"
      sha256 "a4f9fadb452701b449b1f7a4d9878fbf32496373a3e4524f81c7710bd659045f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.12/fclt-2.8.12-linux-x64"
    sha256 "bd52f506f4aff3b889e3f554adc7764265df1dfc62cd661959def6fa203daf54"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
