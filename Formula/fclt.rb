class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.4/fclt-2.17.4-darwin-arm64"
      sha256 "8f65aa1c15e680e0819cc338035457affb86a6638f245b1c54a1fc196f92bb50"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.4/fclt-2.17.4-darwin-x64"
      sha256 "f58727ca7ea9ee394ae2af44b273adc5dff8226a355799a2d6a050464f732715"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.4/fclt-2.17.4-linux-x64"
    sha256 "c0a7764e109ff700f87cb4c40ec783b2ac16f8978b7c12c7e11920962ea53b37"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
