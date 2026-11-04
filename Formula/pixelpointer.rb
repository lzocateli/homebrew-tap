# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.1/pixelpointer-osx-arm64.tar.gz"
      sha256 "9abe5c1ae00690432747d1b0fda765d0a8d372bdf9fc3f45a5b7921bc08e5d55"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.1/pixelpointer-osx-x64.tar.gz"
      sha256 "438f97bcfd4ea7ea14cfc4a4f1d136dc0d2b16fb6547353892fb9cd4cc11b168"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.1/pixelpointer-linux-arm64.tar.gz"
      sha256 "38cb0dd3e8bfc5994b6316e862f90d6a34e632f91c634120b874105ea9a8c809"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.3.1/pixelpointer-linux-x64.tar.gz"
      sha256 "1053451b85d92df6e972a17d4a083638aa20b01d61860ff843e37e5ea62d5c40"
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
