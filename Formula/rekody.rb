class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "20ce4eb2914444184a76726ea37c1dcd5f809db3a701cf83ecbb4f519eb6a896"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "57a844b06e7999aa2b490cfb8420bc839c0f9a6e9a00338a7b95486f06561c5b"
    end
  end

  def install
    bin.install "rekody"
    # On-device Apple Foundation Models cleanup helper, present only in the
    # Apple Silicon tarball (macOS 26+). Optional — rekody works without it.
    bin.install "rekody-fm" if File.exist?("rekody-fm")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rekody --version")
  end
end