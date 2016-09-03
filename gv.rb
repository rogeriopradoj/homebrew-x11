class Gv < Formula
  homepage "https://www.gnu.org/s/gv/"
  url "https://ftpmirror.gnu.org/gv/gv-3.7.4.tar.gz"
  mirror "https://ftp.gnu.org/gnu/gv/gv-3.7.4.tar.gz"
  sha256 "2162b3b3a95481d3855b3c4e28f974617eef67824523e56e20b56f12fe201a61"

  bottle do
    rebuild 1
    sha256 "40a2910a4e9807b39f81d3340b828f01bb24405eec61fda91c3d213f09a1fdb1" => :el_capitan
    sha256 "b3ff44908bbfefc0111f3f9d4065ea9bfdf3f29bccbbef3c0f9bd6550ddca1b0" => :yosemite
    sha256 "ddd686cc8c9b2adb8292281ed2e5fae767c96c135cbe9bc255047fbbdab033cd" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "ghostscript" => "with-x11"
  depends_on :x11 => "2.7.2"

  skip_clean "share/gv/safe-gs-workdir"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-SIGCHLD-fallback"
    system "make", "install"
  end
end
