from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy

mod = "mod4"
terminal = "urxvtc"
browser = "brave"

keys = [
    # Switch between windows
    Key([mod], "h",
        lazy.layout.left(), desc="Move focus to left"),

    Key([mod], "l",
        lazy.layout.right(), desc="Move focus to right"),

    Key([mod], "j",
        lazy.layout.down(), desc="Move focus down"),

    Key([mod], "k",
        lazy.layout.up(), desc="Move focus up"),

    # Move windows
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(), desc="Move window to the left"),

    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(), desc="Move window to the right"),

    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(), desc="Move window down"),

    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows
    Key([mod, "control"], "h",
        lazy.layout.grow_left(), desc="Grow window to the left"),

    Key([mod, "control"], "l",
        lazy.layout.grow_right(), desc="Grow window to the right"),

    Key([mod, "control"], "j",
        lazy.layout.grow_down(), desc="Grow window down"),

    Key([mod, "control"], "k",
        lazy.layout.grow_up(), desc="Grow window up"),

    # Launch Utilities
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn("dmenu_run"), desc="Launch Dmenu"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Browser"),
    Key([mod, "shift"], "s", lazy.spawn("xfce4-screenshooter -f -c -s docs/syncthing/"), desc="Spawn screenshoter"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Restart and kill WM
    Key([mod, "shift"], "Insert", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "End", lazy.shutdown(), desc="Shutdown Qtile"),

    KeyChord([mod], "p", [
        Key([], "p", lazy.spawn("passmenu"), desc='Retrieve passwords with dmenu'),
        Key([], "m", lazy.spawn("musp-all"), desc='Music!'),
        Key([mod], "m", lazy.spawn("musp"), desc='Music!'),
        Key([], "y", lazy.spawn("manpdf"), desc="Man pages with pdfs!"),
    ]),
]

group_name = [
        ("Vim"),
        ("Web"),
        ("Res"),
        ("File"),
        ("RSS"),
        ("Talk"),
        ("Void"),
        ("Media"),
        ("Games"),
        ]

groups = [Group(name) for name in group_name]

for i, (name) in enumerate(group_name, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))

    keys.append(Key([mod, "shift"], str(i),
        lazy.window.togroup(name, switch_group=True)))


layout_config = {
        "margin": 4,
        "border_width": 1,
        "border_focus": "de5356",
        "border_normal": "1a1a1d",
        }

layouts = [
    layout.MonadTall(**layout_config),
    layout.Max(**layout_config),
    layout.Floating(**layout_config),
]

widget_defaults = dict(
    font="Jetbrains Mono",
    fontsize=12,
    padding=3,
    background="1a1a1d",
    foreground="e4dcf5",
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active="c5cdd9",
                    borderwidth=2,
                    inactive='88909f',
                    highlight_method='line',
                    disable_drag=True,
                    highlight_color=['1a1a1d', '1a1a1d'],
                    hide_unused=True,
                    this_current_screen_border='de5356',
                    urgent_border='1a1a1d',
                    urgent_text='e4dcf5'),

                widget.Spacer(length=bar.STRETCH),
                widget.Wallpaper(directory="~/img/wallpaper/",
                    wallpaper_command=['feh', '--bg-fill', '--no-fehbg'],
                    random_selection=True,
                    label="Change Wallpaper",
                    markup=False),
                widget.Spacer(length=3),
                widget.Systray(),
                widget.Clock(format='%d/%m %H:%M'),
                widget.CurrentLayoutIcon(scale=0.8),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.toggle_floating())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='pinentry-gtk-2'),

])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True
wmname = "Qtile"
