# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Dotnetscope < Formula
  desc "Install, list, validate and remove .NET SDKs and runtimes"
  homepage "https://github.com/lzocateli/DotnetScope"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.1/dotnetscope-osx-arm64.tar.gz"
      sha256 "4ce4a4f0c9fc9b7e7ff9c4f2112b0ded132ebaaf54e4fddfe410c43fd25f7232"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.1/dotnetscope-osx-x64.tar.gz"
      sha256 "c15aa13c684229902291b0d410f0aa1b4f38d64a005c09abe0c4a826421847d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.1/dotnetscope-linux-arm64.tar.gz"
      sha256 "c46efd5b307d5d50b14015cc5083488fef6b83ddd5d19fe29cd8512c307e67aa"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.1/dotnetscope-linux-x64.tar.gz"
      sha256 "f39eb08ab060cad03b6e3e4f5ced952720a3921fab49a39c69416a798246105e"
    end
  end

  def install
    bin.install "dotnetscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnetscope --version")
  end
end
