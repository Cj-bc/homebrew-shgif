class Shgif < Formula
  desc "a Shell GIF animation viewer"
  homepage "https://github.com/Cj-bc/shgif.git"
  version "1.2.0"
  url "https://github.com/Cj-bc/shgif/archive/v#{version}.tar.gz"
  sha256 "93dd25abb2a3294295e6a3e8c6cd6772dfe45f32604b2603b3a2992d81ea27c2"

  def install
    system 'vim', '+\'%s#\$( cd "\${BASH_SOURCE\[0\]%\/\*}" && pwd )#' + prefix + '#g', '+w!', '+q', 'shgif.sh'
    system "mv", "shgif.sh", "shgif"
    bin.install "shgif"
    prefix.install Dir["lib"], Dir["deps"], Dir["tests"]
  end

  test do
    system "bats", "#{prefix}/tests/*"
  end
end
