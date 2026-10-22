#!/usr/bin/env bash
set -euo pipefail
apt-get install -y build-essential
version=$(cat "sources/$BUILD_PROJECT/VERSION")
version=$(python3 /work/feed/ci/repository.py package-version "$DISTRIBUTION" "$SUITE" "$version" "$PACKAGE_RELEASE")
staging=$(mktemp -d)
mkdir -p "$staging/DEBIAN" "$staging/usr/bin" "$staging/usr/lib" "$staging/usr/include"
gcc sources/demo-app/src/app.c -ldemo-core -o "$staging/usr/bin/demo-app"
"$staging/usr/bin/demo-app" | tee packages/runtime-proof.txt
cat > "$staging/DEBIAN/control" <<EOF
Package: demo-app
Version: $version
Architecture: $ARCH
Maintainer: VOC Experiments <ci@example.invalid>
Description: Disposable canonical CI integration experiment
Depends: demo-core
EOF
dpkg-deb --root-owner-group --build "$staging" "packages/${BUILD_PROJECT}_${version}_${ARCH}.deb"
printf '%s\n' "$BUILD_PROJECT" > "packages/${BUILD_PROJECT}.packages"
