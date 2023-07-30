local NoMoreDarkness = RegisterMod("No More Curse of Darkness!", 1)
local COD_MASK = LevelCurse.CURSE_OF_DARKNESS

function NoMoreDarkness:OnNewFloor()
	local bitMask = Game():GetLevel():GetCurses()

	if COD_MASK & bitMask == COD_MASK then -- if Curse of Darkness is found within the total curses, then
		Game():GetLevel():RemoveCurses(COD_MASK)
	end
end

function NoMoreDarkness:OnGameStart(isContinued)
	if isContinued then -- if an existing run was continued, do the check for the curse
		NoMoreDarkness:OnNewFloor()
	end
end

NoMoreDarkness:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, NoMoreDarkness.OnNewFloor)
NoMoreDarkness:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, NoMoreDarkness.OnGameStart)