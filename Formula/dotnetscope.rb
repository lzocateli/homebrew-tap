# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Dotnetscope < Formula
  desc "Install, list, validate and remove .NET SDKs and runtimes"
  homepage "https://github.com/lzocateli/DotnetScope"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.4.0/dotnetscope-osx-arm64.tar.gz"
      sha256 "f1d7c048333726bb39b5ab7bc2b576c566435a99c899b63d12d8c41150828c7f"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.4.0/dotnetscope-osx-x64.tar.gz"
      sha256 "a5e709926c37d7e2a6ba2bae97cfbe73d81312d25953f9e9530810cd5ea34784"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.4.0/dotnetscope-linux-arm64.tar.gz"
      sha256 "592fabce16774de893f8a41868567bd40de3465e65908a43c6dd06f5b3af71e9"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.4.0/dotnetscope-linux-x64.tar.gz"
      sha256 "4aac01298d0030d30233633378c1d2b2fb36b8d6fe88bea27319ae26a4b52748"
    end
  end

  def install
    bin.install "dotnetscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnetscope --version")
  end
end
