import std/[strutils, unittest]
import cmd

proc echoCommand(ctx: var CmdPrompt, input: seq[string]): void =
  echo(strutils.join(input, " "))

proc fooCommand(ctx: var CmdPrompt, input: seq[string]): void =
  echo "foo!"

let cmds = [
  Command(name: "echo", desc: "repeats back a string", help:"echos a string back", exeCmd: echoCommand),
  Command(name: "foo", desc: "prints 'foo'", help: "using this to test multiple commands", exeCmd: fooCommand)
]

test "CmdPrompt basic functionality":
  var prompt = newCmdPrompt(commands=cmds, promptString="> ")
  expect EOFError:
    prompt.run()
