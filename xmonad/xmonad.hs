import XMonad
import XMonad.Config.Gnome

main = do
	xmonad $ gnomeConfig
		{ terminal = "gnome-terminal"
		, modMask = mod4Mask
		, borderWidth = 2
		}
