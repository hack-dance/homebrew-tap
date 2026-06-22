class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.8/fclt-2.17.8-darwin-arm64"
      sha256 "2cc00be42dad529f77ccf405c908209087fbf4272526a4b595d337158aed0fad"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.8/fclt-2.17.8-darwin-x64"
      sha256 "438fc1bbba49bddeef15eb12c2788d9998be98a419b99971ee36843945625f3b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.8/fclt-2.17.8-linux-x64"
    sha256 "7e6b07a3f2ad09cf5875e2b3c6efa29beccdfc91627e2743bc1600d892136786"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
