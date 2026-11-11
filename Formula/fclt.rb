class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.4/fclt-2.34.4-darwin-arm64"
      sha256 "3cd223e3c2a08a8f986ee33b83e4db063d0ef7558890ec84c47b735773e53c3b"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.4/fclt-2.34.4-darwin-x64"
      sha256 "1a3c7b4dd69bdba6e8cc0770230c4ca02a11cc2d5080531650a567d77a734acd"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.4/fclt-2.34.4-linux-x64"
    sha256 "d9e9addd4320448c74000f2014f5211317af5f952e071e333e4236b9638da46e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
