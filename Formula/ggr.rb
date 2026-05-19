class Ggr < Formula
  desc "Local terminal review surface for GitHub pull requests"
  homepage "https://github.com/ericbmerritt/local-review"
  url "https://github.com/ericbmerritt/local-review/archive/refs/tags/ggr-v0.1.1.tar.gz"
  sha256 "a5ba794c2f335a3a3391fb6c5571a7d46a44a7d2078bea3f41c90db0e9896fe2"
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
