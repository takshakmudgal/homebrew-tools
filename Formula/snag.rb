class Snag < Formula
  desc "IDM-style downloader for videos, files, and torrents (with Chrome extension)"
  homepage "https://github.com/takshakmudgal/snag"
  url "https://github.com/takshakmudgal/snag.git",
      tag:      "v0.1.0",
      revision: "f7590c0c485822fefefffd7a61e2adf74593104e"
  version "0.1.0"
  license "MIT"
  head "https://github.com/takshakmudgal/snag.git", branch: "main"

  depends_on "rust" => :build
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      For magnet:/torrent downloads, also install aria2:
        brew install aria2

      To pair with the Chrome extension after install:
        snag install-host --extension-id <your-extension-id>
    EOS
  end

  test do
    assert_match "snag", shell_output("#{bin}/snag --version")
  end
end
