#!/bin/bash
helpstr="$0 <tarball> (fedora|centos) <output-dir>"

if [ $# -ne  3 ]; then
  echo $helpstr
  exit 1
fi

tarball=$1
dist=""

case $2 in
  "fedora")
    dist="fedora-24-x86_64"
    ;;
  "centos")
    dist="epel-7-x86_64"
    ;;
  *)
    echo "Unknown dist $2"
    echo $helpstr
    exit 1
    ;;
esac

outdir=$3
if [ -f $outdir ]; then
  echo "$outdir is not a directory"
  exit 1
fi

if [ ! -e $outdir ]; then
  mkdir -p $outdir
fi

tmpdir=$(mktemp -d)

echo "Creating SRPM"

rpmbuild --define "_topdir  $tmpdir" -ts $tarball || exit 1

srpm=$tmpdir/SRPMS/*

echo "Building RPMS using mock"
/usr/bin/mock -r $dist --resultdir=$outdir --rebuild $srpm || exit 1

echo "Cleaning up"
rm -rf $tmpdir

echo "Created RPMs from $tarball in $outdir"
