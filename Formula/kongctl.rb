class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d0eb887dc41a60064315208f9604805a64459f758a2755796a9e6c2f6758fada"
    sha256 cellar: :any_skip_relocation, sequoia:       "591929a229d617caf6a3a6b7b2346505b02f1ca8a5e78d59c9b2fa367e5ea79a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7f35f4c6343a2e170b4d35a98c7eacb03961e69f92bd6db2c65edea62ef1417c"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.0/kongctl_darwin_arm64.zip"
      sha256 "d07b3c0ac931362515c5574b016a70b533befe0a67cb13931292fe672743e695"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.0/kongctl_darwin_amd64.zip"
      sha256 "66fe50955640913931b890a4ef5d0b9c24f110220e5e5d84de055d1a0f825415"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.0/kongctl_linux_arm64.zip"
      sha256 "a82580b2b614e84e7f64449c9b099475953d723151e6c09f5dc3c5f8ea53e4f2"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.0/kongctl_linux_amd64.zip"
      sha256 "22a25efad003f1b5b9d4689389018f7683084d63c516dabc38ee1b1ee9c8cefe"
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
