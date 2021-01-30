Name:       hello-world
Version:    0.1
Release:    1
License:    GPL-3.0-only
BuildArch:  noarch
URL:        https://github.com/flyinggreenfrog/shell-scripts
Source:     https://github.com/flyinggreenfrog/shell-scripts/archive/shell-scripts-%{version}.tar.gz
Summary:    Hello world shell script

%description
This package provides a hello world shell script.

%prep
%setup -q -n shell-scripts-%{version}

%build

%install
mkdir -p %{buildroot}/usr/bin/
mkdir -p %{buildroot}/usr/share/shell-scripts/lib
install -m 444 lib/hello-world %{buildroot}/usr/share/shell-scripts/lib/hello-world
install -m 555 bin/hello-world %{buildroot}/usr/bin/hello-world

%files
%license LICENSE
%doc README.md
/usr/bin/hello-world
/usr/share/shell-scripts
