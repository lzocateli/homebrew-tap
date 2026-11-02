# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.2/pixelpointer-osx-arm64.tar.gz"
      sha256 "3f9589ef2fd957f5542e2f55eeb7d78460cd1b831c291250dea8cc567207d959"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.2/pixelpointer-osx-x64.tar.gz"
      sha256 "3afd4181ddcb70a68c39ff859197e2c2a7728b444db5a3feb88a07680953be47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.2/pixelpointer-linux-arm64.tar.gz"
      sha256 "880d703ac4025d5325cc45b9d284cce646220f5d9a78f12890c5de621a3e8123"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.1.2/pixelpointer-linux-x64.tar.gz"
      sha256 "f3dc11b97b2423aef23d59736febe5899c41268567b9d6540ec37e2e1125cee6"
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
