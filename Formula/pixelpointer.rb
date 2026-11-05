# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.5.0/pixelpointer-osx-arm64.tar.gz"
      sha256 "3c9a35e252ae97ff597a97082dc48b77a86f662bf0aa4bd1d0965d14a92d9379"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.5.0/pixelpointer-osx-x64.tar.gz"
      sha256 "b18edf02ba2fdbff86a7b82bbbc79f323d5f453d2d10332e1b1254e66b34c257"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.5.0/pixelpointer-linux-arm64.tar.gz"
      sha256 "292965a2164fe824a3035bd496fc1e2db2ac623e32f027202f5accbde4d79afb"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.5.0/pixelpointer-linux-x64.tar.gz"
      sha256 "594340c5eb8e85bed6a3d453f3cc3775fdf56eaf3aaa1abfcc2f0f0547a942b6"
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
