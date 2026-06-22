class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.9/fclt-2.17.9-darwin-arm64"
      sha256 "b3cbe21b68185a01df12f24418f1feef48036f64471897a56e3f81dc3c4db56b"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.9/fclt-2.17.9-darwin-x64"
      sha256 "cb28b0120b3b74614b15ba502d187700c5db1b51d2632bdbcc33b2462dae72d0"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.9/fclt-2.17.9-linux-x64"
    sha256 "0c5d0fc0a087240820e9e496e66e10ef639d937356fa671df72fe98625ca9e05"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
