class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78beba9fe6308578fe271db55395ed737e5b65c79cf1782f0228a996b61bb9fa"
    sha256 cellar: :any_skip_relocation, sequoia:       "e9511f81d56d56afb0d39228aef0a6fc1ed97ec6c6946ffb5756c9d714146546"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bd49eddb82d24b69eea3c482d2957cbc94843d8f208b65e745130fe6225d2bb9"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.18.0/kongctl_darwin_arm64.zip"
      sha256 "e50709d18e5265c57c8b31041217c5045506b20ddce6350d1d4ca80aee68f1d2"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.18.0/kongctl_darwin_amd64.zip"
      sha256 "0ca981205cb7814ff6f848c2bdb8d1e0029c40f82eb84b9443f0d430de327cc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.18.0/kongctl_linux_arm64.zip"
      sha256 "cd43022e19394de80431045bba6e3783587f24e9277818aec2571423c95d413f"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.18.0/kongctl_linux_amd64.zip"
      sha256 "4649ceeb18ad41d1c67f8b4d208cfa71ced1c3c2b0d59a53eb7b83629a8e2479"
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
