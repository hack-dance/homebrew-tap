class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.0/fclt-2.15.0-darwin-arm64"
      sha256 "d8d6feb4437091c8c7e6dfd21836ec8874bc6e7075bd67cf7ddc715b9e73b700"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.0/fclt-2.15.0-darwin-x64"
      sha256 "790c5b973ce31cc82bbf6b240da126baa930e5cc88c8abbdbfa2bed988de8be3"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.15.0/fclt-2.15.0-linux-x64"
    sha256 "b85547c542649a7ea2a644db5a8026b19bba41e48dc60e0f86351d68093cb3e4"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
