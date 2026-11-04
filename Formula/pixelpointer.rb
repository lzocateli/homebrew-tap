# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.0/pixelpointer-osx-arm64.tar.gz"
      sha256 "63303d4a37996a3af5855eabbf326512507374528f83fc88bbf9834384d0d141"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.0/pixelpointer-osx-x64.tar.gz"
      sha256 "65a6005d795d85450b1958f3990afefbdd3e3353474bda4ef33bc1a92fe1b9a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.0/pixelpointer-linux-arm64.tar.gz"
      sha256 "488b63ddab05952be4bdb689d72e11a4445d14c20cbb526486072e9936b85176"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.0/pixelpointer-linux-x64.tar.gz"
      sha256 "66f937e88babe792fa4619d12320034069087f2f2e30bc95118984403cb7a533"
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
