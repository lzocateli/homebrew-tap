# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.1/pixelpointer-osx-arm64.tar.gz"
      sha256 "557f798078944928b05a7627a3d78f4b6ab1a76bbf0fb23cc8815d9338079531"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.1/pixelpointer-osx-x64.tar.gz"
      sha256 "36515362182d3984f891ae036ac08b5e58fe82f9defe6076f17b9936f611a342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.1/pixelpointer-linux-arm64.tar.gz"
      sha256 "d67f569954f9b84b28a4369cb77fd5cbe161c753e6f754ac4e3a1a3073de0c71"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.1/pixelpointer-linux-x64.tar.gz"
      sha256 "0209b472fbddf1e16f5c8564826dc2e8b67da2a490871e2e88d883e844295dc0"
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
