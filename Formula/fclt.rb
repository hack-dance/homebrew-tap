class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.2/fclt-2.8.2-darwin-arm64"
      sha256 "cc02f5d8d5b2559f325c8cc08b86b09f5cb0c9d0bc7a858631f620ba1a94edc5"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.2/fclt-2.8.2-darwin-x64"
      sha256 "5b45550fd7ef36a8ea99d724f2c537ee57c3ac7f0ecf5d1b6b45acb6f73f976f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.2/fclt-2.8.2-linux-x64"
    sha256 "092b85e09d913baa36a0b5b6f90d8b9bf56e293bd6ec8dbce890a87b191e5d45"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
