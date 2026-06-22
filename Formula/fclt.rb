class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.13/fclt-2.17.13-darwin-arm64"
      sha256 "e7e10299b73a2997b5a2bc23c7c37e7201832b8d925d0e58dc8c1aa412d067a5"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.13/fclt-2.17.13-darwin-x64"
      sha256 "7f9d74a17eee97340de5d1c55841e22a0d546cbee3755c76ab5e1df1f6cf3730"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.13/fclt-2.17.13-linux-x64"
    sha256 "91e96b863373fa77c7cf2abb13979e850dff3471c236261e9ca9fa1d9200e2e6"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
