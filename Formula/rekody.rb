class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "ace637b80b90e0f322def87b74a448cce8d696ca95d09d381d658d34f33ce19f"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "39aa98872b34c62ea292fd0693fd04d9ad770c48fb67d42e0d49fee16fc51483"
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