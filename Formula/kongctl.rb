class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  url "https://github.com/Kong/kongctl/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "a86c09baa409fbe220c29a6f52f4fb98d473e4b1da1d4b935ccdc6cd766415a1"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X main.version=#{version}
      -X main.commit=86e156e0
      -X main.date=2026-09-02T16:47:12.720631851Z
    ]

    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    output = shell_output("#{bin}/kongctl version --full")
    assert_match version.to_s, output
    assert_match "86e156e0", output
    assert_match "__kongctl_debug", shell_output("#{bin}/kongctl completion bash")
  end
end
