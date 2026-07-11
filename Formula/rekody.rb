class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "f54072d13b83a9e3202b87baf481d26cf875b819de35b52c5a6a3dc48f26f9b1"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "33b608368b576f1d9968190ad1e4edfd8445eab0e86ecc08f83df8b8fb32d083"
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