module prohelp_cli;

/**
 * CLI framework bridges for Prohelp.
 *
 * This package integrates progressive help (prohelp) with command-line routers
 * such as arsd.cli. Parsing and subcommand dispatch stay in the framework;
 * help navigation, budgets, locales, and TUI stay in Prohelp.
 *
 * See README.adoc and docs/explanation/arsd-cli-bridge.adoc.
 */

public import prohelp.intercept;
public import prohelp.config;
