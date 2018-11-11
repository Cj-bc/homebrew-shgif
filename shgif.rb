class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.3.0"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "b14a6bbf08aedc037cd16afe0e588a9076407c3ccfd38bff4d07f92fbf536e3d"

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
