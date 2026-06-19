class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.7/fclt-2.8.7-darwin-arm64"
      sha256 "b3ab2fd0f9d31db5179c11c135e2fbae9739ee3a85de3ca5692224b6f5667524"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.7/fclt-2.8.7-darwin-x64"
      sha256 "5063610d2ba92681692ee699abe6e50a28cdd504fa71ba3d2fa56839eccb22d8"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.7/fclt-2.8.7-linux-x64"
    sha256 "7371fdb62d6a945006353f98998b4b07f1c19f57628035237e042514145bfa18"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
