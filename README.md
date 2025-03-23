## Deps

- fish
- fd
keybindings associated with a command
- TASK: Find a way to figure out the UI model a given window is in
- FEAT: Default to nowrap
- FEAT: Traditional keybindings
- FEAT: TAB accept completions
- FEAT: Command palette
- FEAT: No sticky diagnostics on horizontal scroll
- BUG: Macros not working

- brew install ghostscript basictex tectonic

## Todo

- BUG: copilot not starting automatically in markdown files
- BUG: marksman exiting unexpectedly
  > [ERROR][2025-03-21 19:02:56] ...p/_transport.lua:36 "rpc" "/Users/isaacspiegel/.local/share/src/mason/bin/marksman" "stderr" "[19:02:56 INF] <LSP Entry> Starting Marksman LSP server: {}\n"
  > [ERROR][2025-03-21 19:02:56] ...p/_transport.lua:36 "rpc" "/Users/isaacspiegel/.local/share/src/mason/bin/marksman" "stderr" '[19:02:56 INF] <Folder> Loading folder documents: {"uri": "file:///Users/isaacspiegel/Documents/repos/spivim"}\n'
  > [ERROR][2025-03-21 19:06:35] ...p/_transport.lua:36 "rpc" "/Users/isaacspiegel/.local/share/src/mason/bin/marksman" "stderr" "Unhandled exception: "
  > [ERROR][2025-03-21 19:06:35] ...p/_transport.lua:36 "rpc" "/Users/isaacspiegel/.local/share/src/mason/bin/marksman" "stderr" "System.AggregateException: One or more errors occurred. (MailboxProcessor.PostAndAsyncReply timed out.)\n ---> System.TimeoutException: MailboxProcessor.PostAndAsyncReply timed out.\n   at <StartupCode$FSharp-Core>.$<Mailbox.PostAndAsyncReply@497-1.Invoke>(FSharpOption`1 res) in D:\\a\\_work\\1\\s\\src\\FSharp.Core\\mailbox.fs:line 498\n   at Microsoft.FSharp.Control.AsyncPrimitives.CallThenInvokeNoHijackCheck[a,b](AsyncActivation`1 ctxt, b result1, FSharpFunc`2 userCode) in D:\\a\\_work\\1\\s\\src\\FSharp.Core\\async.fs:line 528\n   at Microsoft.FSharp.Control.Trampoline.Execute(FSharpFunc`2 firstAction) in D:\\a\\_work\\1\\s\\src\\FSharp.Core\\async.fs:line 112\n   --- End of inner exception stack trace ---\n   at Ionide.LanguageServerProtocol.Server.startWithSetup[client](FSharpFunc`2 setupRequestHandlings, Stream input, Stream output, FSharpFunc`2 clientCreator, FSharpFunc`2 customizeRpc) in /Users/runner/work/marksman/marksman/LanguageServerProtocol/LanguageServerProtocol.fs:line 205\n   at Ionide.LanguageServerProtocol.Server.start@309-2.Invoke(FSharpFunc`2 customizeRpc)\n   at Marksman.Program.startLSP(Int32 verbosity, Boolean waitForDebugger) in /Users/runner/work/marksman/marksman/Marksman/Program.fs:line 57\n   at <Marksman.Program.lspCommand@86.Invoke>(Tuple`2 tupledArg)\n   at <FSharp.SystemCommandLine.CommandBuilders.SetHandlerInt@207-2.Invoke>(InvocationContext ctx)\n   at System.CommandLine.Invocation.AnonymousCommandHandler.Invoke(InvocationContext)\n   at System.CommandLine.Invocation.InvocationPipeline.<>c__DisplayClass4_0.<<BuildInvocationChain>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass17_0.<<UseParseErrorReporting>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass12_0.<<UseHelp>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass22_0.<<UseVersionOption>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass19_0.<<UseTypoCorrections>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c.<<UseSuggestDirective>b__18_0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass16_0.<<UseParseDirective>b__0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c.<<RegisterWithDotnetSuggest>b__5_0>d.MoveNext()\n--- End of stack trace from previous location ---\n   at System.CommandLine.Builder.CommandLineBuilderExtensions.<>c__DisplayClass8_0.<<UseExceptionHandler>b__0>d.MoveNext()\n"
- BUG: Completions details showing when details is same as title
- BUG: Disable auto-pairs
- BUG: inspector doesn't always work
- BUG: Can't drag edgy windows
- BUG: Fix using f/F
- TASK: Evaluate neo-tree vs
- TASK: Find way to figure out

