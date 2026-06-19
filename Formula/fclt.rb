class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.1/fclt-2.13.1-darwin-arm64"
      sha256 "4d024ac1d4aff47426fcba4a1978128b957a9c759df8aa8b90392ea218db52fc"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.1/fclt-2.13.1-darwin-x64"
      sha256 "e9a890ed8c6499355112d42510218b68edbcc086102aa72e7f03c1efa4059350"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.1/fclt-2.13.1-linux-x64"
    sha256 "482e74dcde7a04a7068ff4e0e63fc479501d304364673f40b67bb93fff9f7efa"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
