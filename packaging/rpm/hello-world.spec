Name:       hello-world
Version:    0.1
Release:    1
License:    GPL-3.0-only
BuildArch:  noarch
URL:        https://github.com/flyinggreenfrog/shell-scripts
# https://github.com/<USER>/<REPO>/archive/<VERSION>.tar.gz
# contains <REPO>-<VERSION>/ as main folder
# I didn't find a direct download link from github to end in <REPO>-<VERSION>.tar.gz
# Hence specify only filename and download manually:
# wget --content-disposition https://github.com/<USER>/<REPO>/archive/<VERSION>.tar.gz
# gives <REPO>-<VERSION>.tar.gz
Source:     shell-scripts-%{version}.tar.gz
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
