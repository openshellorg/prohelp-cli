module demo;

import std.stdio;
import prohelp_cli;

version (ProhelpCliDemo) {
    private enum embeddedHelp = import("demo-help.sdl");
}

void main(string[] args) {
    auto config = InterceptConfig.fromContent(embeddedHelp, "demo-help.sdl");
    if (args.length >= 2 && args[1] == "check-config") {
        // Paths assume `dub run` from the package root with a sibling config-lifecycle checkout.
        import std.file : readText;
        try {
            auto catalog = Catalog.loadJson(readText(
                "../config-lifecycle/fixtures/example-catalog.json"));
            auto sample = readText("../config-lifecycle/fixtures/sample.npmrc");
            auto n = reportConfigKeyFindings(sample, "sample.npmrc", catalog);
            writeln("prohelp-cli-demo: check-config emitted ", n, " alert(s).");
        } catch (Exception e) {
            stderr.writeln("prohelp-cli-demo: check-config skipped: ", e.msg);
            stderr.writeln("Run from prohelp-cli package root with sibling config-lifecycle.");
        }
        return;
    }
    if (args.length < 2) {
        // Default into help so the demo is useful when run bare
        intercept([args.length ? args[0] : "prohelp-cli-demo", "?"], config);
        return;
    }
    if (intercept(args, config)) {
        return;
    }
    writeln("prohelp-cli-demo: not a help trigger.");
    writeln("Try:  prohelp-cli-demo ?");
    writeln("      prohelp-cli-demo check-config");
    writeln("This binary is a CI/release smoke demo. Wire prohelp-cli into your own CLI for production.");
}
