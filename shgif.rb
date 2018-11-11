class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.4.3"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "da49bfb947293ac74ddec3464c032c81de9129a005c57927b42f48531445645f"

  def install
    system 'vim +\'%s#\$( cd "\${BASH_SOURCE\[0\]%\/\*}" && pwd )#' + prefix + '#g\' +w! +q shgif.sh'
    system "mv", "shgif.sh", "shgif"
    bin.install "shgif"
    prefix.install Dir["lib"], Dir["deps"], Dir["tests"]
  end

  test do
    system "bats", "#{prefix}/tests/*"
  end
end
