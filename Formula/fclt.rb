class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.3/fclt-2.8.3-darwin-arm64"
      sha256 "9d80365f7a98d9bef83bf9227c5c58e4f1dd83236cf6202a9a93459bd1b23c35"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.3/fclt-2.8.3-darwin-x64"
      sha256 "f716a7bf02d3e7cff28b0c5615f9838794279283e7fd0026b8686290c71a3963"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.3/fclt-2.8.3-linux-x64"
    sha256 "2f165493022cb7c48919b6b47915292a76e80f28130ca77939032215daa805a0"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
