class SonicAudio < Formula
  desc "Simple library to speed up or slow down speech"
  homepage "https://github.com/waywardgeek/sonic"
  url "https://github.com/waywardgeek/sonic/archive/ba331411f17702e01f6c2d7016eefebaa695871f.tar.gz"
  version "20210523-0"
  sha256 "469a66b6b54bb825efdc4cbaef1bbd45f87ddc6ce9f73ce7b1060f26b33ec6a9"
  license "Apache-2.0"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"sonic", "-s", "2.0", test_fixtures("test.wav"), "out.wav"
  end
end
