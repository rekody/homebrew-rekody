class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "84a9e6ba116899fdfab06ee21c4f9da76ce41b5b92fee31af786b2639a0535f5"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "a54adb67ba092c1b2b7cb047230d7a13dd736d8b9c4dde484287228c738ad128"
    end
  end

  def install
    bin.install "rekody"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rekody --version")
  end
end