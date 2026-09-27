module prohelp_cli;

/**
 * CLI framework bridges for Prohelp.
 *
 * This package integrates progressive help (prohelp) with command-line routers
 * such as arsd.cli. Parsing and subcommand dispatch stay in the framework;
 * help navigation, budgets, locales, and TUI stay in Prohelp.
 *
 * Config Lifecycle Management (catalogued deprecated/expired/unknown keys) is exposed
 * via `prohelp_cli.config_keys` for CLI authors who load user/project config.
 *
 * See README.adoc and docs/explanation/arsd-cli-bridge.adoc.
 */

public import prohelp.intercept;
public import prohelp.config;
public import prohelp_cli.config_keys;
