class Ggr < Formula
  desc "Local terminal review surface for GitHub pull requests"
  homepage "https://github.com/ericbmerritt/local-review"
  url "https://github.com/ericbmerritt/local-review/archive/refs/tags/ggr-v0.1.0.tar.gz"
  sha256 "08bbb4a6a1c47ddf691f46e3986de00cc989d2891432ba3772ff1307e4eb6380"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/ericbmerritt/local-review.git", branch: "main"

  depends_on "rust" => :build
  depends_on "gh"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ggr")
  end

  test do
    assert_match "ggr", shell_output("#{bin}/ggr --version")
  end
end
