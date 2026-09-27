module prohelp_cli.config_keys;

/**
 * Config Lifecycle Management bridge for CLI apps using prohelp-cli.
 *
 * Re-exports openshellorg/config-lifecycle and provides a small helper
 * to scan key=value config text and print protocol alerts to stderr.
 */

public import config_lifecycle;

import std.stdio : stderr;

/// Classify keys from config text and write alerts for deprecated/expired/unknown.
/// Returns the number of alerts emitted.
size_t reportConfigKeyFindings(
    string configText,
    string sourcePath,
    Catalog catalog,
) {
    auto found = parseKeyValueFile(configText, sourcePath);
    auto findings = catalog.classify(found);
    size_t alerts;
    foreach (f; findings) {
        if (f.needsAlert) {
            stderr.writeln(f.alertLine);
            alerts++;
        }
    }
    return alerts;
}
