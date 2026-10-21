class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9c2805b173672e4e804ae820fb9b7822e7341ed7883053372e45c57493115f8b"
    sha256 cellar: :any_skip_relocation, sequoia:       "7a1f78aa7a44728dfc7d8ef6b2d9a14391b480906c9b4479e20794d0df05c599"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2555bea7979738f788f8c16a18e1278780420bc060f58c3c3dbb5912a18f8ec7"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.21.0/kongctl_darwin_arm64.zip"
      sha256 "41d1a77ff246b5a164e99760318f49ff6914539125a11bdd67d5a504a71c4bd8"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.21.0/kongctl_darwin_amd64.zip"
      sha256 "24a21cae4992f0c7eebf4d4db2a19d880f3dcaaacfbdfc4900b2c168501723ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.21.0/kongctl_linux_arm64.zip"
      sha256 "572ac70b9c29608da980cc70587e1542bb33d620dbc9fb085dbdb4deafb9a78b"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.21.0/kongctl_linux_amd64.zip"
      sha256 "5619e5bb7727ab96fc508d894a45d0b11b86677d89f80a0112d25b0e8213b867"
    end
  end

  def install
    bin.install "kongctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kongctl version --full")
    assert_match "__kongctl_debug", shell_output("#{bin}/kongctl completion bash")
    assert_match "#compdef kongctl", shell_output("#{bin}/kongctl completion zsh")
  end
end
