# Gerado por tools/scripts/New-HomebrewFormula.ps1 a partir do SHA256SUMS da release; nao edite.
class Pixelpointer < Formula
  desc "Screen zoom, annotation and recording for presentations"
  homepage "https://github.com/lzocateli/PixelPointer"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.2.1/pixelpointer-osx-arm64.tar.gz"
      sha256 "479f0c80e1ae353ad6d7fa8a0cd6624ab7024228d1153213c9998d7c84b9b6b8"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.2.1/pixelpointer-osx-x64.tar.gz"
      sha256 "e3a90ea881b916088173af733cae18cc9bea1f97c683be0129adbda8fac78e00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.2.1/pixelpointer-linux-arm64.tar.gz"
      sha256 "1938cf8c21ca78f8928d9c571ea8782b228f84da6bd39b7aef56bc0cbcab7cf7"
    end
    on_intel do
      url "https://github.com/lzocateli/PixelPointer/releases/download/v0.2.1/pixelpointer-linux-x64.tar.gz"
      sha256 "5c43f67273f02ae137796b87d1b9ce1f33e0587ff3919a7aa9bfa9159cf4475d"
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
