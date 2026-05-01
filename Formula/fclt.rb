class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.4/fclt-2.7.4-darwin-arm64"
      sha256 "33b75caf7ccc2791d5adc2e7d10f8520e375fc4e115db886c77729493cd3e386"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.4/fclt-2.7.4-darwin-x64"
      sha256 "c63b88261a18b88c90faec650c986934c754dbe013db8f033fe525119c5f8802"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.4/fclt-2.7.4-linux-x64"
    sha256 "36381e40c6b3bcf3e0525e65cb25d4a0b16a734978aa024bd5c947363597149e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
