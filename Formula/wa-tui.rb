class WaTui < Formula
  desc "WhatsApp client in your terminal"
  homepage "https://github.com/takshakmudgal/wa-tui"
  url "https://github.com/takshakmudgal/wa-tui.git",
      tag:      "v0.1.0",
      revision: "HEAD"
  version "0.1.0"
  license "MIT"
  head "https://github.com/takshakmudgal/wa-tui.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      First run shows a QR — scan it from WhatsApp on your phone
      (Settings → Linked Devices → Link a Device).

      Session + history: ~/.wa-tui/
    EOS
  end

  test do
    assert_match "wa-tui", shell_output("#{bin}/wa-tui --version")
  end
end
