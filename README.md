# demo-app

Disposable canonical package-CI experiment. A tag activates this source; its JSON owns its matrix and hooks. No CMake integration is used.

Live validation: v1.0.0 is moved to this integration revision to retry activation after the coordinator Git-authentication fix.

## Sandbox credential setup

Configured on 22 October 2026: repository Actions secrets `PACKAGE_CAPTURE_APP_PRIVATE_KEY` and `PACKAGE_NOTIFY_APP_PRIVATE_KEY`, with their existing public client-ID variables. The coordinator App installation includes this source. Capture-reader and notify remain installed on `ci-coordinator` only; no coordinator private key or signing key belongs here.

[Expanded coordinator token verification](https://github.com/VOC-Experiments/ci-coordinator/actions/runs/39835348765) passed both token-minting steps. See the [live test matrix and setup order](https://github.com/VOC-Experiments/ci-coordinator/blob/main/docs/live-validation.md). Source participation starts only through its own valid version-tag notification. App installation selection must be saved before extending the coordinator allowlist.

## Own SDK development exports

The captured source hook exports only leaf files/symlinks from this recipe's SDK staging record and its own provides file, plus its own recipe. Shared include/lib directories and foreign provides records are excluded. Legitimate prerequisite development exports still import through the generic checksum-verified path.
