local function init()
	DarkRP.declareChatCommand({
		command = "tweet",
		description = "Send Tweet",
		delay = 1.5
	})
	if (SERVER) then
		DarkRP.defineChatCommand("tweet",function(ply,args)
			if args == "" then
				DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "mesaj", ""))
				return ""
			end
			local DoSay = function(text)
				if text == "" then
					DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "mesaj", ""))
					return
				end
				for k,v in pairs(player.GetAll()) do
					local col = team.GetColor(ply:Team())
					DarkRP.talkToPerson(v, col, "[TWEET] " .. ply:Nick(), Color(0, 128, 255, 255), text, ply)
				end
			end
			hook.Call("playerAdverted", nil, ply, args)
			return args, DoSay
		end,1.5)
	end
end
if (SERVER) then
	if (#player.GetAll() > 0) then
		init()
	else
		hook.Add("PlayerInitialSpawn","dfca-load",function()
			init()
		end)
	end
else
	hook.Add("InitPostEntity","dfca-load",function()
		init()
	end)
end
--- CREATED BY  WilliamVenner  EDITED BY LASTPLAYER ---