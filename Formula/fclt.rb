class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.25.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.3/fclt-2.25.3-darwin-arm64"
      sha256 "df509f8a79d385595cd2fbd3aa82e65f2e529c738c13f604d02227bd37869353"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.3/fclt-2.25.3-darwin-x64"
      sha256 "8090e123dcdfc3271bb62de0d56030adecc0a8acb012725cdf505386d5be3b90"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.25.3/fclt-2.25.3-linux-x64"
    sha256 "7df339bbdb6528f2fbdba2693a601368b98513096168edd50bf638300354be7f"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
