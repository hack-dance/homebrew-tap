class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.6/fclt-2.30.6-darwin-arm64"
      sha256 "18bb9d01a759fe37ec36b846d0984255d2fda3272b48ee71abc0287ddcc72b9e"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.6/fclt-2.30.6-darwin-x64"
      sha256 "c3e2b68d2340e34477420106d6567181bb0c8e81af4ec40bc7389cb54de96f9b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.6/fclt-2.30.6-linux-x64"
    sha256 "b8377088f04a20cdad54d3290aa4f13d365add2e2bb77d7d387606b3bfd76bd9"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
