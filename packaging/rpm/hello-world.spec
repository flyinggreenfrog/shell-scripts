Name:       hello-world
Version:    0.1.1
Release:    1
License:    GPL-3.0-only
BuildArch:  noarch
Group:      Development/Tools/Other
URL:        https://github.com/flyinggreenfrog/shell-scripts
Source:     https://github.com/flyinggreenfrog/shell-scripts/releases/download/%{version}/shell-scripts-%{version}.tar.gz
Summary:    Hello world shell script

%description
This package provides a hello world shell script.

%prep
%setup -q -n shell-scripts-%{version}

%build

%install
mkdir -p %{buildroot}/usr/bin/
mkdir -p %{buildroot}/usr/share/shell-scripts/lib
install -m 555 usr/bin/hello-world %{buildroot}/usr/bin/hello-world
install -m 444 usr/share/shell-scripts/lib/hello-world %{buildroot}/usr/share/shell-scripts/lib/hello-world

%files
%license LICENSE
%doc README.md
/usr/bin/hello-world
%dir /usr/share/shell-scripts
%dir /usr/share/shell-scripts/lib
/usr/share/shell-scripts/lib/hello-world

%changelog
# see git history of URL
