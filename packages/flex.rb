require 'package'

class Flex < Package
  description 'Flex (The Fast Lexical Analyzer) is a fast lexical analyser generator tool for generating programs that perform pattern-matching on text.'
  homepage 'https://www.gnu.org/software/flex/'
  version '2.6.4'
  source_url 'https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz'
  source_sha256 'e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995'

  depends_on 'm4'
  depends_on 'bison' => :build

  def self.build
    system "./configure", "--libdir=#{CREW_LIB_PREFIX}", "--with-pic", "--disable-static", "--enable-shared"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "check"
  end
end
