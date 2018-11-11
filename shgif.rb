class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.4.1"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "2da9291603cfc856b731cc972642b9d111a8833e63e56a549edb1d35e963027b"

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
