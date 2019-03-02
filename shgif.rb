class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.5.0"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "8a9026835c2c0d18fe490fba65c4f1d27e75e954d259f901957df88a404c15b9"

  depends_on "Cj-bc/blib"

  def install
    system "mv", "shgif.sh", "shgif"
    bin.install "shgif"
    prefix.install Dir["lib"], Dir["tests"]

    system "blib", "install", "'Cj-bc/libtar'"
    system "blib", "install", "'Cj-bc/libfile'"
  end

  test do
    system "bats", "#{prefix}/tests/*"
  end
end
