class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.0/fclt-2.5.0-darwin-arm64"
      sha256 "0d78ef7a058fbf7258cdac2e7022b30150f5267cdad939832f1d86d21d507b59"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.0/fclt-2.5.0-darwin-x64"
      sha256 "6ec52f0cbccada1848b53512db73371dfae6afdbc3804148e0835df14db6e0e9"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.5.0/fclt-2.5.0-linux-x64"
    sha256 "a1b7adb2acbc29fba9a8ae9e72baa747d392ff99d9084955a0c7af3cc2e522e8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
