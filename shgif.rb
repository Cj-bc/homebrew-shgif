class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.4.0"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "2908e7055b2a16bb0579af613e2c2742a60463a2e7854daec08bc49209900d6e"

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
