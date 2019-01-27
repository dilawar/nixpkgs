{ stdenv, fetchFromGitHub, pantheon, pkgconfig, meson, ninja, vala
, gtk3, granite, networkmanager, networkmanagerapplet, wingpanel
, libgee, gobject-introspection, elementary-icon-theme, wrapGAppsHook }:

stdenv.mkDerivation rec {
  pname = "wingpanel-indicator-network";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "elementary";
    repo = pname;
    rev = version;
    sha256 = "0k039qqlpwhl34mdhwjqhp7bz8vi432p0zfxzcdhsjhglpk8srlw";
  };

  passthru = {
    updateScript = pantheon.updateScript {
      repoName = pname;
    };
  };

  nativeBuildInputs = [
    gobject-introspection
    meson
    ninja
    pkgconfig
    vala
    wrapGAppsHook
  ];

  buildInputs = [
    elementary-icon-theme
    granite
    gtk3
    libgee
    networkmanager
    networkmanagerapplet
    wingpanel
  ];

  PKG_CONFIG_WINGPANEL_2_0_INDICATORSDIR = "lib/wingpanel";

  meta = with stdenv.lib; {
    description = "Network Indicator for Wingpanel";
    homepage = https://github.com/elementary/wingpanel-indicator-network;
    license = licenses.lgpl21Plus;
    platforms = platforms.linux;
    maintainers = pantheon.maintainers;
  };
}