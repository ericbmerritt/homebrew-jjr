class Ggr < Formula
  desc "Local terminal review surface for GitHub pull requests"
  homepage "https://github.com/ericbmerritt/local-review"
  url "https://github.com/ericbmerritt/local-review/archive/refs/tags/ggr-v0.1.0.tar.gz"
  # TODO: replace with the real sha256 once ggr-v0.1.0 is tagged. Run:
  #   curl -sL https://github.com/ericbmerritt/local-review/archive/refs/tags/ggr-v0.1.0.tar.gz | shasum -a 256
  # From ggr-v0.2.0 onward, the `release-brew-ggr` workflow in the source repo
  # updates `url` + `sha256` automatically on every ggr-v* tag.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
