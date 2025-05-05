import os
HOME = os.environ["HOME"]
CURSOR_PATH = os.path.join(HOME, ".qutebrowser", "cursor.swift")

unbind = [
    "<Alt-1>",
    "<Alt-2>",
    "<Alt-3>",
    "<Alt-4>",
    "<Alt-5>",
    "<Alt-6>",
    "<Alt-7>",
    "<Alt-8>",
    "<Alt-9>",
    "<Ctrl-s>",
    "<Ctrl-w>",
    "d",
    "H",
    "J",
    "K",
    "L",
]

keymap = {
    "<Ctrl-1>": "tab-focus 1",
    "<Ctrl-2>": "tab-focus 2",
    "<Ctrl-3>": "tab-focus 3",
    "<Ctrl-4>": "tab-focus 4",
    "<Ctrl-5>": "tab-focus 5",
    "<Ctrl-6>": "tab-focus 6",
    "<Ctrl-7>": "tab-focus 7",
    "<Ctrl-8>": "tab-focus 8",
    "<Ctrl-9>": "tab-focus 9",
    "<Ctrl-0>": "tab-focus -1",
    "<Ctrl-h>": "tab-prev",
    "<Ctrl-l>": "tab-next",
    "<Ctrl-j>": "forward",
    "<Ctrl-k>": "back",
    "<F12>": "devtools",
    "<Ctrl-c>": "stop",
    "<Ctrl-f>": "hint all hover",
    "<Ctrl-m>": "hint video spawn mpv {hint-url} --keep-open=yes --geometry=80%+200+200",
    "<Ctrl-y>": "hint links yank",
    "<Ctrl-Shift-f>": "spawn firefox {url}",
    "<Ctrl-g>": "jseval -q document.activeElement.blur()",
    "<Ctrl-Shift-g>": "click-element css body",
    "<Ctrl-q>": "tab-close",
    "<Ctrl-d>": "cmd-run-with-count 15 scroll down",
    "<Ctrl-u>": "cmd-run-with-count 15 scroll up",
    "<Ctrl-w>h": "devtools-focus",
    "<Ctrl-w>j": "devtools-focus",
    "<Ctrl-w>k": "devtools-focus",
    "<Ctrl-w>l": "devtools-focus",
    "\\c": f"spawn swift {CURSOR_PATH} center",
    "\\h": f"spawn swift {CURSOR_PATH} left",
    "\\j": f"spawn swift {CURSOR_PATH} down",
    "\\k": f"spawn swift {CURSOR_PATH} up",
    "\\l": f"spawn swift {CURSOR_PATH} right",
    "\\\\": f"spawn swift {CURSOR_PATH} click",
}

# A joke really. Just using keymaps to quickly jump to new pages. Since it is
# still way quicker than qutebrowser's quickmark, why not name it really quick
# mark?
# Rules here: the lhs provided here is actually the suffix. Prefixing it with
# <Space> should open the link in a new tab whilst prefixing it with a comma
# should open the link in the current window.
really_quick_marks = {
    "gh": "https://github.com",
    "zh": "https://zhihu.com",
    "bl": "https://shaobin-jiang.github.io/blog",
    "ds": "https://chat.deepseek.com",
}

for unbind_lhs in unbind:
    config.unbind(unbind_lhs)

for lhs, rhs in keymap.items():
    config.bind(lhs, rhs)

for suffix, url in really_quick_marks.items():
    config.bind(f"<Space>{suffix}", f"open -t {url}")
    config.bind(f",{suffix}", f"open {url}")
