class Ejector < Formula
  desc "TUI that shows what's holding your external drive — and lets you fix it"
  homepage "https://github.com/takshakmudgal/ejector"
  url "https://github.com/takshakmudgal/ejector.git",
      tag:      "v0.1.1",
      revision: "1056f29ae56184180cdc945d32f07c3a7f43a415"
  version "0.1.1"
  license "MIT"
  head "https://github.com/takshakmudgal/ejector.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ejector", shell_output("#{bin}/ejector --version")
  end
end
