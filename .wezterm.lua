local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 1. WSL and Default Domain Setup
-- ========================================================================
-- This tells WezTerm to integrate with your WSL distribution.
-- IMPORTANT: Replace 'Ubuntu-22.04' with the exact name of your WSL distro.
-- Run 'wsl -l -v' in PowerShell to see the correct name.
config.wsl_domains = {
	{
		name = "WSL:archlinux", -- A unique name for this domain
		distribution = "archlinux", -- <== CHANGE THIS to your WSL distribution name
	},
}

-- Make WezTerm automatically connect to your WSL instance on startup.
config.default_domain = "WSL:archlinux" -- Must match the 'name' above

-- 2. Performance & Display Tweaks
-- ========================================================================
-- Set the default program to tmux inside WSL.
-- 'new -As0' means: 'new session, attach if exists (s0), or create s0'
config.default_prog = { "tmux", "new", "-As0" }

-- 1. Enable the WebGPU frontend to use the adapter setting
config.front_end = "WebGpu"

-- 2. Explicitly select the NVIDIA GeForce MX330 with Dx12
config.webgpu_preferred_adapter = {
	backend = "Dx12",
	device = 7446,
	device_type = "DiscreteGpu",
	name = "NVIDIA GeForce MX330",
	vendor = 4318,
}

-- Increase the maximum framerate (default is 60). Higher can make animations smoother.
config.max_fps = 120

-- Reduce the amount of scrollback lines if you want to save on memory,
-- but 10000 is a safe default. You can try a smaller number like 3200 for less memory usage.
config.scrollback_lines = 50000

-- A general configuration that typically provides good visual and speed balance.
-- Remove or change this if you prefer a different font or scheme.
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0
config.color_scheme = "Batman"
config.line_height = 1.0

-- 3. tmux specific UI adjustments
-- ========================================================================
-- Since you are using tmux for splits/tabs, you might want to hide WezTerm's UI elements.
config.hide_tab_bar_if_only_one_tab = true -- Hide WezTerm tabs if only one open (because you use tmux windows)
config.window_decorations = "RESIZE" -- Less distracting window frame
-- config.window_decorations = "NONE" -- Use this to completely hide the title bar (use hotkeys to move/close the window)

-- Optional: Adjust padding for a more compact look
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- 4. Keybinds (Optional but Recommended)
-- ========================================================================
-- If you use Neovim or other applications that listen for CTRL+A or CTRL+B,
-- you might want to disable WezTerm's default keybinds that conflict with tmux.
-- Since tmux's default leader is CTRL+B, this should be fine, but if you change
-- tmux's leader to CTRL+A, you'll want to adjust or disable conflicting WezTerm keys.

return config
