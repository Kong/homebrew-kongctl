# Release ownership

This tap publishes package definitions, not executables. `Kong/kongctl` owns
compilation, Apple signing/notarization, bottle packaging, registry publication,
and verification of the final downloads. Apple credentials remain only there.

- The cask installs upstream release ZIPs and keeps its direct-main update path.
- The formula installs upstream binaries without a Go dependency. Matching
  bottles come from the public `ghcr.io/kong/kongctl/kongctl` package. When a
  bottle is unavailable, the formula installs the platform's upstream ZIP.
- `brew install --formula kong/kongctl/kongctl` and the existing cask command
  remain unchanged. Cask-to-formula switching still requires uninstalling the
  cask first because both expose the same `kongctl` command.
- Existing 1.15.0 bottle URLs/checksums and the cask remain unchanged. This
  migration does not retrofit Apple signatures onto old releases or bottles.

## Automated metadata publication

After publishing and verifying all three bottles, the upstream release opens
a formula-only `release/kongctl-VERSION` PR. Tap CI checks installation from
the public bottles, prebuilt ZIP fallback, cask migration, and formula upgrade.
The upstream workflow waits for these checks and dispatches `publish.yml`
with the exact tested head SHA. That workflow validates and merges only the
formula PR. It does not build bottles, upload packages, or access signing keys.
No routine manual PR merge is required; failed checks leave a visible open PR.

`publish.yml` intentionally rejects the old source-building release PRs.
Coordinate this tap change with the upstream release-workflow change before
starting another release. Merge the tap change first, then the upstream PR;
do not release during the interval. Installation of existing versions remains
available throughout.

The old `brew pr-pull` publisher and bottle CI artifacts are retired. Retry a
failed upstream publisher using artifacts from the original upstream run.
Never replace already-published bottle bytes to make a retry pass. Registry
access, attestations, and partial-publication investigation belong upstream.
