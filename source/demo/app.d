module demo;

import std.stdio;
import prohelp_cli;

version (ProhelpCliDemo) {
    private enum embeddedHelp = import("demo-help.sdl");
}

void main(string[] args) {
    auto config = InterceptConfig.fromContent(embeddedHelp, "demo-help.sdl");
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
    writeln("This binary is a CI/release smoke demo. Wire prohelp-cli into your own CLI for production.");
}
