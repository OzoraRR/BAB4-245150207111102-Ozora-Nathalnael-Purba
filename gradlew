#!/usr/bin/env sh
# Linux launcher for the pinned Gradle distribution. It verifies the official SHA-256.
set -eu
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROPERTIES="$APP_HOME/gradle/wrapper/gradle-wrapper.properties"
DISTRIBUTION_URL=$(sed -n 's/^distributionUrl=//p' "$PROPERTIES" | sed 's/\\:/:/g')
EXPECTED_SHA=$(sed -n 's/^distributionSha256Sum=//p' "$PROPERTIES")
ARCHIVE=${DISTRIBUTION_URL##*/}
DIST_NAME=${ARCHIVE%-bin.zip}
GRADLE_BASE=${GRADLE_USER_HOME:-"${HOME:-$APP_HOME}/.gradle"}/wrapper/dists/bab4
GRADLE_HOME="$GRADLE_BASE/$DIST_NAME"

if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
    command -v curl >/dev/null 2>&1 || { echo "curl is required to download Gradle." >&2; exit 1; }
    command -v unzip >/dev/null 2>&1 || { echo "unzip is required to extract Gradle." >&2; exit 1; }
    command -v sha256sum >/dev/null 2>&1 || { echo "sha256sum is required to verify Gradle." >&2; exit 1; }
    mkdir -p "$GRADLE_BASE"
    TEMP_DIR="$GRADLE_BASE/.download-$$"
    mkdir -p "$TEMP_DIR"
    trap 'rm -rf "$TEMP_DIR"' EXIT HUP INT TERM
    echo "Downloading Gradle $DIST_NAME on first run..."
    curl --fail --location --silent --show-error --retry 3 "$DISTRIBUTION_URL" -o "$TEMP_DIR/$ARCHIVE"
    printf '%s  %s\n' "$EXPECTED_SHA" "$TEMP_DIR/$ARCHIVE" | sha256sum --check --status || {
        echo "Gradle distribution checksum did not match; download was removed." >&2
        exit 1
    }
    unzip -q "$TEMP_DIR/$ARCHIVE" -d "$TEMP_DIR"
    mv "$TEMP_DIR/$DIST_NAME" "$GRADLE_HOME"
    rm -rf "$TEMP_DIR"
    trap - EXIT HUP INT TERM
fi
exec "$GRADLE_HOME/bin/gradle" -p "$APP_HOME" "$@"
