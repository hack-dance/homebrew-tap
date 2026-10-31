class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.33.0/fclt-2.33.0-darwin-arm64"
      sha256 "9d88625086bb987d3dcce4775e9d7707292424dde51a51fa8bc1d845b21b34a3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.33.0/fclt-2.33.0-darwin-x64"
      sha256 "fdb920f67753a6639f52f125c76cc05c016a3822d44f8a006dd9d8c503516cb3"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.33.0/fclt-2.33.0-linux-x64"
    sha256 "1dd43b4083cafa92fb1d737cd1399a66ca107c52c68427b8d336e6616a28582f"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
