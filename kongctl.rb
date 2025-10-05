# typed: false
# frozen_string_literal: true

class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/kong/kongctl"

  disable! date: "2025-10-05", because: :deprecated_upstream, replacement: "kongctl (cask)"

  def install
    odie "The kongctl formula is deprecated. Install the cask instead: brew install --cask kong/kongctl/kongctl"
  end
end
