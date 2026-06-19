class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.14.0/fclt-2.14.0-darwin-arm64"
      sha256 "ddd286f365b4df8793a4e4eca0162cffc56ef2c93bd12cbb205147d5eb21f47e"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.14.0/fclt-2.14.0-darwin-x64"
      sha256 "73db7a9d8d3843835d7f7661a402aa77749d81b1f36fdb9c3bc4c8bbd7e99745"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.14.0/fclt-2.14.0-linux-x64"
    sha256 "2cd8bf5c62adb55c6afb47af9123d444027f3b38142d0063302e077702232a42"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
