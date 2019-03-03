class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.5.1"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "6191eafc607b6780c81db7ee94eccfd20e80d437b2600ae0b813c6f308d9a78c"

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
