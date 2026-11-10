class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "75a4fd5f8cbe04075da801f5ee87288884163bb6425a3e697a2fb687bc6cd00c"
    sha256 cellar: :any_skip_relocation, sequoia:       "25b8ee7e773ab8f2c6fc8840a106d4e56cf0950f65b6e68b5ba3edd5a4d1e130"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d1a46cef33ba7c96617f68ed1ecb10b49f8699a6ed7d708fbd48c741e71a7e44"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.27.0/kongctl_darwin_arm64.zip"
      sha256 "7e57c84497e9047e7ba30a155e4bb6e6a51c62f38c40f8536e8ccb9538536c31"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.27.0/kongctl_darwin_amd64.zip"
      sha256 "086d98cca31e1218f5e26f39c2e2447a0d79d5aef89e64b72261da908d088527"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.27.0/kongctl_linux_arm64.zip"
      sha256 "9ec40636eda287bc364a21ade2e57ebccb1761788d4d0d214dad458cb1cd575e"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.27.0/kongctl_linux_amd64.zip"
      sha256 "abecbf83978a8e889bd9d1c448c66ca40db0d943aa044183877ed100abfb2951"
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
