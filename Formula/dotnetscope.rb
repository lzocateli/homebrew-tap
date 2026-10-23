# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Dotnetscope < Formula
  desc "Install, list, validate and remove .NET SDKs and runtimes"
  homepage "https://github.com/lzocateli/DotnetScope"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.0/dotnetscope-osx-arm64.tar.gz"
      sha256 "6f9c232b6ad5bbb4fd07b70d1d0aa3dc451118dcef411f8a77eedc36b32ab64c"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.0/dotnetscope-osx-x64.tar.gz"
      sha256 "6a58e85303b8717df8e58be10c4a34b690b3442f6bc062a173234dafdf0bdca1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.0/dotnetscope-linux-arm64.tar.gz"
      sha256 "680349120a914ff8e58c41b8bf91da87d36da8e2aba05ae6c14941ef442319fd"
    end
    on_intel do
      url "https://github.com/lzocateli/DotnetScope/releases/download/v0.5.0/dotnetscope-linux-x64.tar.gz"
      sha256 "0c499d43622277e61b5255ad187c5fcc7871e6998d5770eb738b954925379050"
    end
  end

  def install
    bin.install "dotnetscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnetscope --version")
  end
end
