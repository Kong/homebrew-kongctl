class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b106f0b6f79d6289b58da9926553ec1e8a0235b76a460463cbba4d4667f60e30"
    sha256 cellar: :any_skip_relocation, sequoia:       "60704a30c4677b8e61368f68c7c46cd03d30a4542070ccb9ceb71ad6b7904c30"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "99d4561253b3654cce175180a8f8be606befed516e7243062d0fa93f93877825"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.2/kongctl_darwin_arm64.zip"
      sha256 "9e846cb88b827efa1e9ed81cb3843fd03f8484aa8b8640fea5f739470f073ebd"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.2/kongctl_darwin_amd64.zip"
      sha256 "6a6329ac638172fd68c1b1ac4a4dceec24a26264e8ac4a720e03c4e2c12be63e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.2/kongctl_linux_arm64.zip"
      sha256 "deb72f19656b5567ae81b46ad4359d80d2b992b7b3a7d5cfa4abccd5c755f539"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.2/kongctl_linux_amd64.zip"
      sha256 "f5c6671948132eeaf3ab849007c961a7574c7b9351c05ec36dd1bc48ea1acd10"
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
