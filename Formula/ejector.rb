class Ejector < Formula
  desc "TUI that shows what's holding your external drive — and lets you fix it"
  homepage "https://github.com/takshakmudgal/ejector"
  url "https://github.com/takshakmudgal/ejector.git",
      tag:      "v0.1.0",
      revision: "HEAD"
  version "0.1.0"
  license "MIT"
  head "https://github.com/takshakmudgal/ejector.git", branch: "main"

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ejector", shell_output("#{bin}/ejector --version")
  end
end
