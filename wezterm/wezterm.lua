local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

return {
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	enable_tab_bar = false,
	font_size = 14.0,
	font = wezterm.font("JetBrains Mono"),
	-- window_background_opacity = 0.8,
	window_decorations = "RESIZE",
}
