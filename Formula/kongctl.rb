class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9260f923b47eae1d4813769d9a4494a53ebd3f57333f0a36fdf521b0d8900a7f"
    sha256 cellar: :any_skip_relocation, sequoia:       "9d50d22234169be74ef7a199a4fc5c3ff5aec7b412506f0e82a0eab6e0c5b251"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "edbebc5791fbfffb2f783c17a00bddbe255c2470da1a9540aa428a79016e7e89"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.4/kongctl_darwin_arm64.zip"
      sha256 "d49eaacb6a01b54bb78a2d69237d23a2b819a564e1c624da4120ab5b720ca084"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.4/kongctl_darwin_amd64.zip"
      sha256 "dbc2bb6b5ae380b2b7f428700185f0a1793095cb9323d5fb86f1a32b03d108c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.4/kongctl_linux_arm64.zip"
      sha256 "7191b570a997c3a16ae540419a4e592f7d5a30634eb1f134f111f1244fc99860"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.28.4/kongctl_linux_amd64.zip"
      sha256 "6e7292ac339be757b36581d511f67f676c8cad87a00b42d0f3678679f25f403e"
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
