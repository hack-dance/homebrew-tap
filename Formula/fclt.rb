class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.24.1/fclt-2.24.1-darwin-arm64"
      sha256 "63189a0746bd04caa7480dff7302f38ca66450b98371ce6e51ce7ddfddf1ce42"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.24.1/fclt-2.24.1-darwin-x64"
      sha256 "2ea568bbd1a1c7d9e8f7a4ce8357d4b61e22706bcd8fc3c8a89d2c4f1df982e0"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.24.1/fclt-2.24.1-linux-x64"
    sha256 "a717fca8481d450b5cab7b4e6d1e48655c2f08ab9e3fc49b83c5eade0a770566"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
