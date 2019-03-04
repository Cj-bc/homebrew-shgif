class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.5.2"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "892cf4d4e654768c797b270e85058f2dcd9b4bb4bd392108de104ad248dd0305"

  depends_on "cj-bc/blib/blib"

  def install
    system "mv", "shgif.sh", "shgif"
    bin.install "shgif"
    prefix.install Dir["tests"]
  end

  def caveats; <<~EOS
    Please install dependencies by:
      $ blib install Cj-bc/libtar
      $ blib install Cj-bc/libfile
      $ blib install Cj-bc/shgif
  EOS
  end

  test do
    system "bats", "#{prefix}/tests/*"
  end
end
