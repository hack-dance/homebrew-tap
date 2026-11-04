class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.0/fclt-2.34.0-darwin-arm64"
      sha256 "29a769985f5a47945050d4d77d517b4808cdf34d8dcd1e548fe914fb1df81af4"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.0/fclt-2.34.0-darwin-x64"
      sha256 "ce722171c0bab66e22e1a740912ac89d689a36c9c84d8395b8308799620951d5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.0/fclt-2.34.0-linux-x64"
    sha256 "40e259103cc5253c7c93e82587ae6c24262319926f7673fd0157895b7fa08983"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
