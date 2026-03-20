class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.2.0/fclt-2.2.0-darwin-arm64"
      sha256 "f5cb8aaf2765eb5b1abc1c06326552631935d6e0f9cc62e82d14b0aad0ef2832"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.2.0/fclt-2.2.0-darwin-x64"
      sha256 "b94a4057ea6b6b2babbadafde13823016b9a4f06a557772d33f2b49054df70ca"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.2.0/fclt-2.2.0-linux-x64"
    sha256 "1107ff3aae1c134981db8685e3ecb744050ef63dec450feda040433612b17f6a"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
