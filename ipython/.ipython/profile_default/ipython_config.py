# Set vi keybindings
import sys

from prompt_toolkit.key_binding.vi_state import InputMode, ViState

#  import sys; sys.path.append('src')


def get_input_mode(self):
    if sys.version_info[0] == 3:
        # Decrease input flush timeout from 500ms to 10ms.
        from prompt_toolkit.application.current import get_app

        app = get_app()
        app.ttimeoutlen = 0.01

    return self._input_mode


def set_input_mode(self, mode):
    shape = {InputMode.NAVIGATION: 2, InputMode.REPLACE: 4}.get(mode, 6)
    cursor = "\x1b[{} q".format(shape)

    if hasattr(sys.stdout, "_cli"):
        write = sys.stdout._cli.output.write_raw
    else:
        write = sys.stdout.write

    write(cursor)
    sys.stdout.flush()

    self._input_mode = mode


ViState._input_mode = InputMode.INSERT
ViState.input_mode = property(get_input_mode, set_input_mode)

## If a command or file is given via the command-line, e.g. 'ipython foo.py',
#  start an interactive shell after executing the file or command.
c.TerminalIPythonApp.force_interact = True

## Extensions
#  c.TerminalIPythonApp.extensions = [
#      "line_profiler",
#      "memory_profiler",
#  ]


## Autoindent IPython code entered interactively.
c.InteractiveShell.autoindent = False


## Set the color scheme (NoColor, Neutral, Linux, or LightBG).
c.InteractiveShell.colors = "Neutral"


## Shortcut style to use at the prompt. 'vi' or 'emacs'.
c.TerminalInteractiveShell.editing_mode = "vi"

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = "vi"

## Enable vi (v) or Emacs (C-X C-E) shortcuts to open an external editor. This is
#  in addition to the F2 binding, which is always enabled.
c.TerminalInteractiveShell.extra_open_editor_shortcuts = True

# Nicer font color
c.TerminalInteractiveShell.highlighting_style = "monokai"
# changed highlight color
from IPython.core import ultratb

ultratb.VerboseTB.tb_highlight = "bg:ansired"


## Highlight matching brackets.
c.TerminalInteractiveShell.highlight_matching_brackets = True


## Display the current vi mode (when using vi editing mode).
c.TerminalInteractiveShell.prompt_includes_vi_mode = False


## Enable unicode completions, e.g. \alpha<tab> . Includes completion of latex
#  commands, unicode names, and expanding unicode characters back to latex
#  commands.
c.Completer.backslash_combining_completions = False


## Experimental: restrict time (in milliseconds) during which Jedi can compute
#  types. Set to 0 to stop computing types. Non-zero value lower than 100ms may
#  hurt performance by preventing jedi to build its cache.
c.Completer.jedi_compute_type_timeout = 100

## Experimental: Use Jedi to generate autocompletions. Default to True if jedi is
#  installed.
c.Completer.use_jedi = True

## Instruct the completer to omit private method names
#
#  Specifically, when completing on ``object.<tab>``.
#
#  When 2 [default]: all names that start with '_' will be excluded.
#
#  When 1: all 'magic' names (``__foo__``) will be excluded.
#
#  When 0: nothing will be excluded.
c.IPCompleter.omit__names = 1
