class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  url "https://github.com/Kong/kongctl/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "a86c09baa409fbe220c29a6f52f4fb98d473e4b1da1d4b935ccdc6cd766415a1"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3e18596078db821cf0abf30ee7137e5342f303639a923cf128df645a19c8d1da"
    sha256 cellar: :any_skip_relocation, sequoia:       "09937ae65d2231741a927c27c8457345aab0148b72f5c53a98859b233c4b961a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "63b3a8ca14d79de6ed02f585c3661b22fb29f211be15db24bfcf59ab7ae1e94c"
  end

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
    assert_match "#compdef kongctl", shell_output("#{bin}/kongctl completion zsh")
  end
end
