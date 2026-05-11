class Siphon < Formula
  desc "TUI for taking database dumps across local + containerised DBs"
  homepage "https://github.com/takshakmudgal/siphon"
  url "https://github.com/takshakmudgal/siphon.git",
      tag:      "v0.1.0",
      revision: "HEAD"
  version "0.1.0"
  license "MIT"
  head "https://github.com/takshakmudgal/siphon.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      siphon can run all dump tools (pg_dump, mongodump, mysqldump, redis-cli)
      inside ephemeral Docker containers, so no client install is required —
      Docker just needs to be on PATH.

      Config:  ~/.siphon/config.toml  (chmod 600)
      Dumps:   ~/.siphon/backups/
    EOS
  end

  test do
    assert_match "siphon", shell_output("#{bin}/siphon --version")
  end
end
