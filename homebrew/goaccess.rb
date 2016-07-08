# Original: https://github.com/Homebrew/homebrew-core/blob/b4b0791d0cbee92cc3bd25f1deb7065ab7d9e022/Formula/goaccess.rb
class Goaccess < Formula
  desc "Log analyzer and interactive viewer for the Apache Webserver"
  homepage "https://github.com/winebarrel/goaccess"
  url "https://github.com/winebarrel/goaccess/releases/download/v1.0.2/goaccess_1.0.2-2.tar.gz"
  sha256 "029a1b2c38c9f4a0390948b51ba95f9e90232184151c600f6666d7b33d39ecb0"

  option "with-geoip", "Enable IP location information using GeoIP"

  deprecated_option "enable-geoip" => "with-geoip"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "geoip" => :optional

  def install
    system "autoreconf", "-vfi"

    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-utf8
    ]

    args << "--enable-geoip" if build.with? "geoip"

    system "./configure", *args
    system "make", "install"
  end
end
