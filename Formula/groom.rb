class Groom < Formula
  desc "Mac health + cleanup TUI — vitals, dotfiles, CLI orphans, uninstaller, caches, drives, services, ports"
  homepage "https://github.com/takshakmudgal/groom"
  url "https://github.com/takshakmudgal/groom.git",
      tag:      "v0.1.0",
      revision: "12eeb0bb44b11391a0a07018ec84e629c2b9805d"
  version "0.1.0"
  license "MIT"
  head "https://github.com/takshakmudgal/groom.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      groom keeps a Mac honest — vitals, dotfiles, CLI tool orphans, the
      full app uninstaller, caches, dev-artifact purge, the Downloads
      installer scrub, disk explorer, system maintenance, diagnostics,
      external drive ejector, LaunchAgents, and listening ports — every
      destructive action routes through the Finder Trash.

      Run:
        groom
    EOS
  end

  test do
    assert_match "groom", shell_output("#{bin}/groom --version")
  end
end
