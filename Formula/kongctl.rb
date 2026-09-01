class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  url "https://github.com/Kong/kongctl/archive/refs/tags/v1.14.0.tar.gz"
  sha256 "7f92ebe97b355f239cc9d2cf11159c001b21d322cd85d0fda36ffcfb207c8a43"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X main.version=#{version}
      -X main.commit=b3808868
      -X main.date=2026-08-31T15:58:41Z
    ]

    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    output = shell_output("#{bin}/kongctl version --full")
    assert_match version.to_s, output
    assert_match "b3808868", output
    assert_match "__kongctl_debug", shell_output("#{bin}/kongctl completion bash")
  end
end
