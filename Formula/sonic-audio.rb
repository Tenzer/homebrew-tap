class SonicAudio < Formula
  desc "Simple library to speed up or slow down speech"
  homepage "https://github.com/waywardgeek/sonic"
  url "https://github.com/waywardgeek/sonic/archive/ba331411f17702e01f6c2d7016eefebaa695871f.tar.gz"
  version "20210523-0"
  sha256 "469a66b6b54bb825efdc4cbaef1bbd45f87ddc6ce9f73ce7b1060f26b33ec6a9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/sonic-audio-20210523-0"
    sha256 cellar: :any,                 catalina:     "89e00d9ac753897456e13b9617134d8352658cf2d88e4e8ac5449bddef89e8c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "04a9f03bc4f13b3ead503e0216ebe584eb1a00425c86c7e526367472306420ba"
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"sonic", "-s", "2.0", test_fixtures("test.wav"), "out.wav"
  end
end
