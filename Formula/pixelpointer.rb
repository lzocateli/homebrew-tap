# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.0/pixelpointer-osx-arm64.tar.gz"
      sha256 "69678135dcb1837efaef0b9200e045ad33e0b707a1236ec66bfd95f70aeb221d"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.0/pixelpointer-osx-x64.tar.gz"
      sha256 "7f0a5ef215a635721e80d639ecd713d02751f034402175318957edb60861db6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.0/pixelpointer-linux-arm64.tar.gz"
      sha256 "61909b106191602cecf6db7198276ec62c48e5e32891cc2c00efd45380470739"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.0/pixelpointer-linux-x64.tar.gz"
      sha256 "e0e1f0cbb4e97896f4ca3a221f101893a41060374e7c015011b3206cc9a1316f"
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
