Name:       shell-scripts
Version:    0.1.1
Release:    1
License:    GPL-3.0-only
BuildArch:  noarch
Group:      Development/Tools/Other
URL:        https://github.com/flyinggreenfrog/shell-scripts
Source:     https://github.com/flyinggreenfrog/shell-scripts/releases/download/%{version}/shell-scripts-%{version}.tar.gz
Summary:    Shell scripts

%description
This package provides some shell scripts.

%prep
%setup -q -n shell-scripts-%{version}

%build

%install
mkdir -p %{buildroot}/usr/bin/
mkdir -p %{buildroot}/usr/share/shell-scripts/lib
install -m 555 usr/bin/t %{buildroot}/usr/bin/t
install -m 444 usr/share/shell-scripts/lib/base %{buildroot}/usr/share/shell-scripts/lib/base
install -m 444 usr/share/shell-scripts/lib/git %{buildroot}/usr/share/shell-scripts/lib/git
install -m 444 usr/share/shell-scripts/lib/sync %{buildroot}/usr/share/shell-scripts/lib/sync

%files
%license LICENSE
%doc README.md
/usr/bin/t
/usr/share/shell-scripts/lib/base
/usr/share/shell-scripts/lib/git
/usr/share/shell-scripts/lib/sync

%changelog
# see git history of URL
