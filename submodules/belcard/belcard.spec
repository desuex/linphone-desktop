# -*- rpm-spec -*-

## rpmbuild options
# These 2 lines are here because we can build the RPM for flexisip, in which
# case we prefix the entire installation so that we don't break compatibility
# with the user's libs.
# To compile with bc prefix, use rpmbuild -ba --with bc [SPEC]
%define                 pkg_name        belcard

# re-define some directories for older RPMBuild versions which don't. This messes up the doc/ dir
# taken from https://fedoraproject.org/wiki/Packaging:RPMMacros?rd=Packaging/RPMMacros
%define _datarootdir       %{_prefix}/share
%define _datadir           %{_datarootdir}
%define _docdir            %{_datadir}/doc

%define build_number 0



Name:           %{pkg_name}
Version:        1.0.2
Release:        %{build_number}%{?dist}
Summary:        Belcard is a C++ library to manipulate VCard standard format.

Group:          Applications/Communications
License:        GPL
URL:            http://www.linphone.org
Source0:        %{name}-%{version}-%{build_number}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-buildroot

%description

Belcard is a C++ library to manipulate VCard standard format

%package devel
Summary:       Development libraries for belcard
Group:         Development/Libraries
Requires:      %{name} = %{version}-%{release}

%description    devel
Libraries and headers required to develop software with belcard

%if 0%{?rhel} && 0%{?rhel} <= 7
%global cmake_name cmake3
%define ctest_name ctest3
%else
%global cmake_name cmake
%define ctest_name ctest
%endif

%prep
%setup -n %{name}-%{version}-%build_number

%build
%{expand:%%%cmake_name} . -DCMAKE_INSTALL_LIBDIR:PATH=%{_libdir} -DCMAKE_PREFIX_PATH:PATH=%{_prefix}
make %{?_smp_mflags}

%install
make install DESTDIR=%{buildroot}

%check
%{ctest_name} -V %{?_smp_mflags}

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig


%files
%defattr(-,root,root)
%doc AUTHORS ChangeLog COPYING NEWS README.md
%{_libdir}/*.so.*

%files devel
%defattr(-,root,root)
%{_includedir}/belcard
%{_libdir}/libbelcard.a
%{_libdir}/libbelcard.so
%{_datadir}/Belcard/cmake/BelcardConfig.cmake
%{_datadir}/Belcard/cmake/BelcardTargets-noconfig.cmake
%{_datadir}/Belcard/cmake/BelcardTargets.cmake
%{_datadir}/belcard_tester/vcards/*
%{_bindir}/*

%changelog
* Wed Jul 19 2017 jehan.monnier <jehan.monnier@linphone.org>
- Initial RPM release.
