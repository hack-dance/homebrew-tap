class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.4/fclt-2.8.4-darwin-arm64"
      sha256 "ebc5161a0eaadb6013f4cf079cceea90ffecc9866009ce42c26988b9ffb2f6df"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.4/fclt-2.8.4-darwin-x64"
      sha256 "02957325f445422fa1101669b3437b670aa5069d7b93a3746ac36f80647406b2"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.4/fclt-2.8.4-linux-x64"
    sha256 "81939ee90cb3db506f9844f608c0f9dc764ce62e3ae771418a6b70288f41352d"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
