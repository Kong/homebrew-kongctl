class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f244f8cd3bb5bb1d1343a7937aae8034c079f92deb25a00cd8027ec675b688f0"
    sha256 cellar: :any_skip_relocation, sequoia:       "a88c71d030fbd129b167afe2fed09ef819f7a9201063d16cc24575aa604c3e4d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3fdb29d7749e87d60ec017ff360ab061e4a91dca59d235c9eff4eff165e05b7a"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.16.0/kongctl_darwin_arm64.zip"
      sha256 "562a5e71b5810fd417ead5c073622cb73c17359a59f406ccebb64054ce92a9e4"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.16.0/kongctl_darwin_amd64.zip"
      sha256 "a4ee23091b7f5e191a2026dc9dceef5eda8cff3130bcdbe008e48d622ff8b3f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.16.0/kongctl_linux_arm64.zip"
      sha256 "890e4c0eb935ee56982fd65f24a3a38cbb850cfb03fe0318e35f1f8965e9f8af"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.16.0/kongctl_linux_amd64.zip"
      sha256 "197e453dc9b5c15b6af73762cb5c44d1958ed17fd1dbea3eb61adf1f0e54ab99"
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
