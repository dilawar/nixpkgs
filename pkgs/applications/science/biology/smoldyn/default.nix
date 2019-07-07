with import <nixpkgs> {};

stdenv.mkDerivation rec {

    name = "smoldyn-$version";
    version = 2.58;

    src = fetchgit {
        url = "https://github.com/ssandrews/Smoldyn-official";
        rev = "master";
    };

    buildInputs = [cmake];

    buildPhase = ''
        cmake .
    '';

    meta = with stdenv.lib; {
        homepage = "http://smoldyn.org";
    };
}
