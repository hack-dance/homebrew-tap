class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.12/fclt-2.17.12-darwin-arm64"
      sha256 "7bba95d46e8f59e1132af17ac98b9025b9d47ce0812746e1f89429bc321e2c26"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.12/fclt-2.17.12-darwin-x64"
      sha256 "42789a06965f124056298862aa58f4b43c36650f45458f4edc82754b1e1b5e7e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.12/fclt-2.17.12-linux-x64"
    sha256 "e89d67b2b4c5b7aeb5f3b92ab576ba447f3020320e2f064cc658334c6fbf7894"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
