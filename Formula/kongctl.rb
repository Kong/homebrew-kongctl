class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "69cfd0863b11e4b5aa49a0de6249bda5a65123124dcf3556b21bcbff45431707"
    sha256 cellar: :any_skip_relocation, sequoia:       "14a377c5a3c79b05431d602862984c365712e57e2d9b7d19adf300f7d45b470b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3d06ea8bfd679baf130d71d11f75db5e68443b655dfa4cda7f6c0fac339c02de"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.0/kongctl_darwin_arm64.zip"
      sha256 "1aebe5c93529b37991d469483aa5d5726481e76ab5364d46a75f6824c5471976"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.0/kongctl_darwin_amd64.zip"
      sha256 "7baf6da97dec2f737b58da712c376bf64767d8e2a036a8f7b4b8c868ac14eda6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.0/kongctl_linux_arm64.zip"
      sha256 "aa7ed503d04308242124e0759f43634ae94a6ab04c9225a1b7a977fefd7eccdd"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.0/kongctl_linux_amd64.zip"
      sha256 "960cec25730a13f791250c4f8e670921e923599963ae6832afba917a6afaa649"
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
