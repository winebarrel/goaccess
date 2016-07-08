Name:		goaccess
Version:	1.0.2
Release:	2%{?dist}
Summary:	Real-time web log analyzer and interactive viewer

Group:		Applications/Utilities
License:	MIT
URL:		https://goaccess.io
Source0:	http://tar.goaccess.io/goaccess-%{version}.tar.gz

BuildRequires:	ncurses-devel GeoIP-devel
Requires:	ncurses GeoIP

%description
GoAccess was designed to be a fast, terminal-based log analyzer. Its core idea is to quickly analyze and view web server statistics in real time without needing to use your browser (great if you want to do a quick analysis of your access log via SSH, or if you simply love working in the terminal).

%prep
%setup -q

%build
%configure --enable-geoip --enable-utf8
make %{?_smp_mflags}

%install
%make_install

%files
%doc COPYING README AUTHORS TODO
%{_bindir}/%{name}
%{_mandir}/man1/%{name}.1*
%{_sysconfdir}/%{name}.conf
%{_defaultdocdir}/%{name}/*
