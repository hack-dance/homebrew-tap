class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.14/fclt-2.17.14-darwin-arm64"
      sha256 "16b166bf08446b3e709b02fda26ce0431914f1a129aba323b0d0606998bd93e3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.14/fclt-2.17.14-darwin-x64"
      sha256 "9380f39fb4dda11423373f5425ec2a207fc5413fe7a73fa2ec2f6ee8040b22e9"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.14/fclt-2.17.14-linux-x64"
    sha256 "963027ea7a301de8d2355fc09fda53ebe4342f3f710989cf0c87c55aef78ceee"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
