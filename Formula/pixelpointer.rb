# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.6.1/pixelpointer-osx-arm64.tar.gz"
      sha256 "81fcdd913d0a73985a4a50e6522a763e4ef0b46a94b094ec5f816aabf1167c11"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.6.1/pixelpointer-osx-x64.tar.gz"
      sha256 "091fa281d28a2562d66c66d93ca5bf1d970de30c67d027d6418e02d01957184e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.6.1/pixelpointer-linux-arm64.tar.gz"
      sha256 "839f169c0799182c4d5e481f51870beb4397a5814f57f765e32ab929396d87f7"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.6.1/pixelpointer-linux-x64.tar.gz"
      sha256 "1572f9fe2fbbe34919b17fec0f44589e783a609593a202e5fcfed53e39828c63"
    end
  end

  on_linux do
    depends_on "fontconfig"
  end

  def install
    # SDL3 e libSkiaSharp ficam ao lado do executavel; o comando e um link para libexec.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"pixelpointer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pixelpointer --version")
    assert_match "ok:", shell_output("#{bin}/pixelpointer selftest")
  end
end
