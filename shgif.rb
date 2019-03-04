class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.5.3"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "c921a3297941566e86219d41654621b9be4f91bd9b95db0fb1eb27bf4230f65c"

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
