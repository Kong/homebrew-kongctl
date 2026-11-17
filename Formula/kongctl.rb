class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d33782d2103c6e58253de44964fc6eda742ada589d52e270d3aff34aeb00ec2"
    sha256 cellar: :any_skip_relocation, sequoia:       "49dc086a47ae4f441aed1fbb4198803f88ff7c4312113a33c6bedb32d9277ae3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "64a156bc5c6e3e7a923320e8b31f2ce75b06bbd0348c4c9d96071e973a8b6186"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.3/kongctl_darwin_arm64.zip"
      sha256 "3d8527ffb028064172c2a4fb8ad811ed1e30ed10245ee43a459c4ca8027b97a4"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.3/kongctl_darwin_amd64.zip"
      sha256 "4e9d796bf01fec4937aaa06344155eaee04da5630274ae363c21352e6ba8f1c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.3/kongctl_linux_arm64.zip"
      sha256 "c5160805161e8c3eaf7576e1e502b13d4f986ebc5c085db0f04162aa7c8ee559"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.3/kongctl_linux_amd64.zip"
      sha256 "3f42b7c9abb57f5527905cf249b40dbca6caf912aa250541d675648117de36b6"
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
