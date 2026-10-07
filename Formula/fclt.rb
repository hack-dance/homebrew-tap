class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.1/fclt-2.32.1-darwin-arm64"
      sha256 "92810c272cfa274ecfe7a722002239d245f8c737a693e706f6bce362cfc6dbca"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.1/fclt-2.32.1-darwin-x64"
      sha256 "51ebb549f43e5fafaeaf0c1fe58919f3b1c0d31b73a5947590eff3128c7a1418"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.1/fclt-2.32.1-linux-x64"
    sha256 "69525ed77d61b28d8497b128a5f3c00da27e413aeca2b6886f844ea4141ff2c2"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
