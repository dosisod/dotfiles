from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys
from prompt_toolkit.styles import Style

from ptpython.layout import CompletionVisualisation

__all__ = ["configure"]


def configure(repl):
    repl.show_signature = True

    repl.show_docstring = False

    repl.show_meta_enter_message = True

    repl.completion_visualisation = CompletionVisualisation.POP_UP

    repl.completion_menu_scroll_offset = 0

    repl.show_line_numbers = False

    repl.show_status_bar = True

    repl.show_sidebar_help = True

    repl.swap_light_and_dark = False

    repl.highlight_matching_parenthesis = False

    repl.wrap_lines = True

    repl.enable_mouse_support = True

    repl.complete_while_typing = True

    repl.enable_fuzzy_completion = False
    repl.enable_dictionary_completion = False

    repl.vi_mode = True

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    repl.prompt_style = "classic"

    repl.insert_blank_line_after_output = False

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable auto suggestions. (Pressing right arrow will complete the input,
    # based on the history.)
    repl.enable_auto_suggest = False

    repl.enable_open_in_editor = True

    repl.enable_system_bindings = True

    repl.confirm_exit = False

    repl.enable_input_validation = True

    repl.use_code_colorscheme("gruvbox-dark")

    repl.color_depth = "DEPTH_24_BIT"  # True color.

    repl.min_brightness = 0.0  # Increase for dark terminal backgrounds.
    repl.max_brightness = 1.0  # Decrease for light terminal backgrounds.

    repl.enable_syntax_highlighting = True

    repl.vi_start_in_navigation_mode = False
    repl.vi_keep_last_used_mode = False

