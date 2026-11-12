class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a37b1e7e9e8b82a1608f98ff5eba10225253f0ce72a15808dcbf7433dbd025e1"
    sha256 cellar: :any_skip_relocation, sequoia:       "33dcf1e4d97b26bb2ca5ae13b7d24b85087b5c3a3d222e01466071fc00e0b296"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cdc6fc4b9637a8114f1a89ebc7d142e0d49c68df1bd2a59673f68ce6b6af8f3a"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.1/kongctl_darwin_arm64.zip"
      sha256 "bd9e0b7cee403225f074124515cc37147f619a0303be5981bd65ff308922914f"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.1/kongctl_darwin_amd64.zip"
      sha256 "891d181a7204537235df23d095ecf23e4afc8b1b28367027960ad1463ee016ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.1/kongctl_linux_arm64.zip"
      sha256 "a77fe914b4008c9026d98d137298e77dfdfecf708f2d32983d1a3f78a79af0ee"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.1/kongctl_linux_amd64.zip"
      sha256 "078da81cf008730a2991bf8bfc2c6a1e5699b6538a503628e97922755aff8589"
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
