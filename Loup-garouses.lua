--[         Оборотни         ]--
--[  Модуль создан Athesdrake#0000  ]--
--[  переведен Deff83  ]--

transparence = 0.75 --[[transparence des zones de textes]] --À Changer par un chiffre entre 0 et 1 (0 = transparent, 1 = opaque)

changeLesNoms = {
	voyante =    {"Ясновидящая", "La"},
	loup_garou = {"Оборотень", "Le"}, -- mettez "$" aux endroits où il faut un "s" au pluriel. (ne fonctionne que pour ce rôle)
	villageois = {"Селянин", "Le"},
	sorciere =   {"Ведьма", "La"},
	cupidon =    {"Амур", "Le"},
	chasseur =   {"Охотник", "Le"},
	salvateur =  {"Cпаситель", "Le"},
	voleur =     {"Вор", "Le"},
	costaud =    {"Качек", "Le"}
}

function main()
--vars:
	play = true
	speak = false
	TIME = 0
	mapName = "<VP>Оборотни<BL> | <N>Время: <V>%ds</V><BL> | <N>Мышь: <V>%d<N>/<V>%d<N> (<PT>%d<N>, <R>%d<N>)<BL> | <N>Создатель: <BV>Athesdrake#0000\n"
--ids:
	idHaut = 1
	idRole = 2
	idChoser = 3
	idTimer = 4
	idPlay = 5
	idLovers = 6
	idChat = 7
--tables:
	task = {}
	players = {}
	plNbr = {}
	want2Play = {}
	jeu = {}
	roles = {"Ясновидящая", "Оборотень", "Селянин", "Ведьма", "Амур", "Охотник", "Cпаситель", "Вор", "Качек"}
	game = {}
		game[6] = {1,2,2,1}
		game[7] = {1,2,2,1,1}
		game[8] = {1,2,2,1,1,1}
		game[9] = {1,2,2,1,1,1,1}
	T = {
		events = {
			night = " Наступает ночь, вся деревня засыпает.",
			thief = " %s %s просыпается, крадет кого-то и засыпает. Проверьте свою карту после поворота!!!",
			cupid = " %s %s просыпается, выбирает двух любовников и засыпает.",
			lovers = " Влюбленные просыпаются, узнают друг друга, целуются и засыпают.",
			seer = " %s %s просыпается, видит чье-то лицо и засыпает.",
			saving = " %s %s просыпается, защищает кого-то и засыпает.",
			werewolf = " %s просыпаются, выбирают свою жертву и засыпают.",
			witch = " %s %s просыпается, выбирается из мертвых или убивает кого-то и засыпает.",
			vote = " Выберите, кого сжечь на костре!",
			hunter = " %s %s выбирай цель!",
		},
		win = "%s выиграли!"
	}
--sytème:
	for pl in pairs(tfm.get.room.playerList) do
		eventNewPlayer(pl)
	end
	for k, v in pairs({"start", "t"}) do
		system.disableChatCommandDisplay(v, true)
	end
end

function eventNewPlayer(name)
	ui.addPopup(idPlay, 1, "<p align='center'>Ты хочешь играть в Оборотни?", name, 350, 175, nil, true)
	players[name] = {isPlaying = false, play = false}
	tfm.lg.map()
end

function eventPlayerLeft(name)
	if players[name].isPlaying then
		for k, v in pairs(plNbr) do
			if v==name then
				table.remove(plNbr, k)
				break
			end
		end
		players[name].isPlaying = false
		local txt = tfm.lg.dead(name, "<ROSE>"..name.."</ROSE> вышел из комнаты. Это был один "..roles[players[name].jeu.role].." !")
		ui.msg(txt)
		if tfm.lg.win() then
			for k, v in ipairs(task) do
				task[k].finish = true
			end
			tfm.lg.task(3, "win")
		end
	end
	tfm.lg.map()
end

function eventNewGame() tfm.lg.map() end

function eventChatCommand(name, cmd)
	if cmd=="start" and play then
		if (not pcall(setRolesNames)) then
                        -- Звучит абсолютно понятно (нет) (ilyamikheevcoder)
			error("<R>Таблица \'Изменения\' одержимые!</R>")
		end
		if #want2Play>5 then
			task = {}
			play = false
			jeu = {roles={0,0,0,0,0,0,0,0,0}}
			local r = {}
			if game[#want2Play]~=nil then
				for k, v in pairs(game[#want2Play]) do
					r[k] = v
				end
			else
				r = {1,3,2,1,1,1,1,1,1}
				r[2] = #want2Play/4
				r[3] = #want2Play-(r[2]+7)
			end
			math.randomseed(os.time())
			for i=1, #want2Play do
				local pl = nil
				repeat
					pl = want2Play[math.random(#want2Play)]
				until players[pl].isPlaying==false
				local ran = 0
				local objectif = "Убей всех оборотней!"
				repeat
					ran = math.random(#r)
				until r[ran]~=0
				if ran==2 then
					objectif = "Убей всех жителей деревни!"
				end
				r[ran] = r[ran] - 1
				table.insert(plNbr, pl)
				jeu.roles[ran] = jeu.roles[ran] + 1
				players[pl].jeu = {}
				players[pl].jeu.role = ran
				players[pl].isPlaying = true
				ui.role(pl, roles[ran], objectif)
			end
			tfm.lg.tour("ini")
		else
			ui.msg("Не хватает игроков!\nНеобходимо минимум <J>6</J> игроков!")
		end
	end
	if string.lower(cmd:sub(0,1))=="t" and speak and players[name].jeu.role~=nil and players[name].jeu.role==2 and players[name].mort then
		jeu.chat = "["..name.."] "..((cmd:sub(3)):gsub("&lt;"..".-".."&gt;", "")):gsub("%c", "").."\n"..jeu.chat
		for k, v in pairs(plNbr) do
			if players[v].jeu.role==2 then
				ui.chat(v)
			end
		end
	end
end

function eventTextAreaCallback(id, name, call)
	if call:sub(1,5)=="steal" then
		players[name].choose = true
		players[name].jeu.role = players[call:sub(6)].jeu.role
		players[call:sub(6)].jeu.role = 1
		ui.role(name, roles[players[name].jeu.role], players[name].jeu.role==2 and "Убей всех Жителей!!" or "Убей всех Оборотней!")
		ui.role(call:sub(6), "Селянин", "Убей всех Оборотней!")
	end
	if call:sub(1,6)=="lovers" then
		name2 = call:sub(7)
		local nbr = (players[name].amour[1]==nil and 1) or (players[name].amour[2]==nil and 2) or nil
		if nbr~=nil and players[name].amour[1]~=name2 then
			players[name].amour[nbr] = name2
			players[name].jeu.texte = string.gsub(players[name].jeu.texte, "%s"..name2, " "..name2.."("..nbr..")")
			ui.choser(players[name].jeu.texte, name)
		end
	end
	if call:sub(1,4)=="seer" then
		ui.choser(call:sub(5).." являе(ю)тся "..roles[players[call:sub(5)].jeu.role], name)
	end
	if call:sub(1,6)=="saving" then
		players[name].lastProtect = call:sub(7)
		players[call:sub(7)].isProtect = true
		ui.choser("Ты защищаешь "..call:sub(7).." на ночь!", name)
	end
	if call:sub(1,8)=="werewolf" then
		local name2 = call:sub(9)
		if jeu.vote[name2]==nil then
			jeu.vote[name2] = 1
		else
			jeu.vote[name2] = jeu.vote[name2] + 1
		end
		jeu.txt = jeu.txt:gsub(name2.."%(".."%d".."%)", name2.."("..tostring(jeu.vote[name2])..")")
		if players[name].vote~=nil then
			jeu.vote[players[name].vote] = jeu.vote[players[name].vote] - 1
			jeu.txt = jeu.txt:gsub(players[name].vote.."%(".."%d".."%)", players[name].vote.."("..jeu.vote[players[name].vote]..")")
		end
		players[name].vote = name2
		for k, v in pairs(plNbr) do
			if players[v].jeu.role==2 and players[v].mort then
				ui.choser(jeu.txt, v)
			end
		end
	end
	if call:sub(1,4)=="vote" then
		local name2 = call:sub(5)
		if jeu.vote[name2]==nil then
			jeu.vote[name2] = 1
		else
			jeu.vote[name2] = jeu.vote[name2] + 1
		end
		--jeu.txt = jeu.txt:gsub(name.."%(%d%)%→%S+", name.."("..(jeu.vote[name] and jeu.vote[name] or "0")..")→"..name2 )
		--jeu.txt = jeu.txt:gsub(name2.."%(%d%)", name2.."("..tostring(jeu.vote[name2])..")")
		if players[name].vote and jeu.vote[players[name].vote]  then
			jeu.vote[players[name].vote] = jeu.vote[players[name].vote] - 1
		end
		players[name].vote = name2
		for k,v in pairs(plNbr) do
			if players[v].mort then
				jeu.txtVote[v] = string.format("<a href='event:vote%s'>%s</a>(%d)→%s\n", v, v, jeu.vote[v] and jeu.vote[v] or 0, players[v].vote and players[v].vote or "никто")
			end
		end
		local txt = ""
		for k,v in pairs(jeu.txtVote) do txt = txt..v end
		for k, v in pairs(plNbr) do
			if players[v].mort then
				ui.choser(txt, v, false, true)
			else
				ui.choser(txt, v, true, true)
			end
		end
	end
	if call:sub(1,4)=="kill" then
		players[name].kill = call:sub(5)
		table.insert(jeu.mort, call:sub(5))
		ui.choser(call:sub(5).." пей свое зелье и умри в болезненных муках!", name)
	end
	if call:sub(1,4)=="hunt" then
		jeu.mort[1] = call:sub(5)
		ui.choser("ты стреляешь "..call:sub(5).." в голове", name)
	end
end

function eventPopupAnswer(id, name, ans)
	if id==idPlay and ans=="yes" then
		if (not play) then
			ui.addPopup(idPlay, 0, "Ты должен ждать следующей части, чтобы играть", name, 350, 175, nil, true)
		end
		players[name].play = true
		players[name].mort = true
		table.insert(want2Play, name)
		tfm.lg.map()
	end
	if id==idChoser then
		if ans=="yes" then
			ressu = true
			players[name].rez = ""
		else
			ui.addPopup(idTimer, 1, "Хочешь убить кого-нибудь?", name, 350, 175, nil, true)
		end
	end
	if id==idTimer then
		local txt = ""
		for k, v in pairs(plNbr) do
			if players[v].mort then
				txt = txt.."<a href='event:kill"..v.."'>"..v.."</a>\n"
			end
		end
		players[name].txt = txt
		ui.addTextArea(idChoser, txt, name, 620, 110, 180, nil, 0x8C3232, 0x131A2A, transparence, true)
	end
end

function eventLoop(t1, t2)
	for k, v in ipairs(task) do
		local tbl = task[k]
		TIME = math.ceil(os.difftime(tbl.time,os.time())/1000)
		tfm.lg.map()
		if tbl.timer then
			ui.addTextArea(idTimer, TIME, all, 740, 45, nil, nil, 0, 0, 0, true)
		end
		if tbl.time<=os.time() or tbl.finish then
			ui.removeTextArea(idTimer)
			if tbl.txtArea then
				ui.removeTextArea(tbl.id, tbl.name)
			end
			if (not tbl.finish) then
				tfm.lg.tour(tbl.tour, tbl.last, tbl.name)
			end
			table.remove(task, k)
		end
	end
end

function setRolesNames()
	if changeLesNoms~=nil and type(changeLesNoms)=="table" then
		local tbl = changeLesNoms
		T.events.seer = string.format(T.events.seer, tbl.voyante~=nil and (tbl.voyante~=nil and (tbl.voyante[2]~=nil and tbl.voyante[2] or "La")) or "La", tbl.voyante[1]~=nil and tbl.voyante[1] or "Ясновидящая" or "Ясновидящая")
		T.events.werewolf = string.format(T.events.werewolf, tbl.loup_garou~=nil and (tbl.loup_garou[1]~=nil and tbl.loup_garou[1]:gsub("%$", "s") or "Оборотень") or "Оборотень")
		T.events.witch = string.format(T.events.witch, tbl.sorciere~=nil and (tbl.sorciere~=nil and (tbl.sorciere[2]~=nil and tbl.sorciere[2] or "La")) or "La", tbl.sorciere[1]~=nil and tbl.sorciere[1] or "Ведьма" or "Ведьма")
		T.events.cupid = string.format(T.events.cupid, tbl.cupidon~=nil and (tbl.cupidon~=nil and (tbl.cupidon[2]~=nil and tbl.cupidon[2] or "Le")) or "Le", tbl.cupidon[1]~=nil and tbl.cupidon[1] or "Амур" or "Амур")
		T.events.hunter = string.format(T.events.hunter, tbl.chasseur~=nil and (tbl.chasseur~=nil and (tbl.chasseur[2]~=nil and tbl.chasseur[2] or "Le")) or "Le", tbl.chasseur[1]~=nil and tbl.chasseur[1] or "Охотник" or "Охотник")
		T.events.saving = string.format(T.events.saving, tbl.salvateur~=nil and (tbl.salvateur~=nil and (tbl.salvateur[2]~=nil and tbl.salvateur[2] or "Le")) or "Le", tbl.salvateur[1]~=nil and tbl.salvateur[1] or "Cпаситель" or "Cпаситель")
		T.events.thief = string.format(T.events.thief, tbl.voleur~=nil and (tbl.voleur~=nil and (tbl.voleur[2]~=nil and tbl.voleur[2] or "Le")) or "Le", tbl.voleur[1]~=nil and tbl.voleur[1] or "Вор" or "Вор")
		
		roles[1] = tbl.voyante~=nil and (tbl.voyante[1]~=nil and tbl.voyante[1] or roles[1]) or roles[1]
		roles[2] = tbl.loup_garou~=nil and (tbl.loup_garou[1]~=nil and tbl.loup_garou[1]:gsub("%$", "") or roles[2]) or roles[2]
		roles[3] = tbl.villageois~=nil and (tbl.villageois[1]~=nil and tbl.villageois[1] or roles[3]) or roles[3]
		roles[4] = tbl.sorciere~=nil and (tbl.sorciere[1]~=nil and tbl.sorciere[1] or roles[4]) or roles[4]
		roles[5] = tbl.cupidon~=nil and (tbl.cupidon[1]~=nil and tbl.cupidon[1] or roles[5]) or roles[5]
		roles[6] = tbl.chasseur~=nil and (tbl.chasseur[1]~=nil and tbl.chasseur[1] or roles[6]) or roles[6]
		roles[7] = tbl.salvateur~=nil and (tbl.salvateur[1]~=nil and tbl.salvateur[1] or roles[7]) or roles[7]
		roles[8] = tbl.voleur~=nil and (tbl.voleur[1]~=nil and tbl.voleur[1] or roles[8]) or roles[8]
		roles[9] = tbl.costaud~=nil and (tbl.costaud[1]~=nil and tbl.costaud[1] or roles[9]) or roles[9]
	end
end

function findKey(value, tbl)
	for k,v in next, tbl do
		if value==v then
			return k
		end
	end
	return false
end

function nbrSouris()
	local nbr = 0
	for k,v in pairs(tfm.get.room.playerList) do
		nbr = nbr +1
	end
	return nbr
end

ui.msg = function(txt)
	ui.addTextArea(idHaut, "<p align='center'>"..txt.."</p>", name, 15, 28, 770, nil, 0x8C3232, 0x131A2A, transparence, true)
end

ui.role = function(name, role, obj)
	ui.addTextArea(idRole, "<font size='16' color='#131a2a'>Ты: </font><font size='16'>"..role.."</font>\n<p align='center'><font size='8'><b>"..(obj==name and ("Ты был: "..roles[players[name].jeu.role]) or " цель: "..obj), name, 15, 350, 220, 50, 0x8C3232, 0x131A2A, transparence, true)
end

ui.choser = function(txt, name, bool, display)
	ui.addTextArea(idChoser, (bool and txt:gsub("href", "color") or txt), name, (display and 560 or 670), 86, (display and 225 or 115), nil, 0x8C3232, 0x131A2A, transparence, true)
end

ui.chat = function(name)
	ui.addTextArea(idChat, "<J>!t сообщение</J><BL> для разговора с оборотнями </BL>\n"..jeu.chat, name, 15, 86, 200, 228, 0x8c3232, 0x131a2a, tonumber(transparence)/1.5, true)
end

tfm.lg = {
	dead = function(name, mort)
		local role, txt, hunter, cos = players[name].jeu.role, mort, players[name].jeu.role==6, players[name].jeu.role==9
		if cos and players[name].life==nil then
			players[name].life = 1
			return	txt, false;
		end
		players[name].mort = false
		jeu.roles[role] = jeu.roles[role] - 1
		ui.role(name, "Мертв", name)
		if jeu.amour~=nil and jeu.amour[1]~=nil then
			local tbl = jeu.amour
			if (name==tbl[1] and players[tbl[2]].mort) or (name==tbl[2] and players[tbl[1]].mort) then
				local name2 = name==tbl[1] and tbl[2] or tbl[1]
				tfm.lg.dead(name2)
				txt = txt.."\n"..name2.." умирает от горя, потеряв любимого. "..name2.." был "..roles[players[name2].jeu.role].." !"
			end
		end
		return txt, hunter
	end,

	plDead = function()
		local nbr = 0
		for k,v in pairs(plNbr) do
			if (not players[v].mort) then
				nbr = nbr +1
			end
		end
		return nbr
	end,

	tour = function(tour, lastTour, name)
		if lastTour~=nil then
			if lastTour=="thief" then
				if players[name] and players[name].choose==nil then
					jeu.roles[8] = 0
					jeu.roles[3] = jeu.roles[3] + 1
				end
			end
			if lastTour=="cupid" then
				if players[name].amour[2]==nil then
					tour = "daily"
				else
					jeu.amour = {}
					jeu.amour[1] = players[name].amour[1]
					jeu.amour[2] = players[name].amour[2]
					jeu.roles[5] = 0
					jeu.roles[3] = jeu.roles[3] + 1
					ui.role(name, "Селянин", "Убей всех оборотней!")
				end
			end
			if lastTour=="witch" then
				ui.addPopup(idTimer,2,"",name,1e7,1e7)
				ui.addPopup(idChoser,2,"",name,1e7,1e7)
			end
			if lastTour=="werewolf" then
				speak = true
				local last = 0
				local mort = ""
				for k, v in pairs(jeu.vote) do
					if v~=nil and v~="" and v>last then
						last = v
						mort = k
					end
				end
				if mort=="" then
					jeu.mort = {}
				else
					jeu.mort = {mort}
				end
				jeu.vote = {}
			end
			if lastTour=="vote" then
				local last = 0
				local mort = ""
				local tbl = {}
				local nbr = 0
				for k, v in pairs(plNbr) do
					if players[v].mort then
						nbr = nbr + 1
					end
				end
				for k,v in pairs(jeu.vote) do
					if v~=nil and v~="" and v>last then
						last = v
						mort = k
						tbl = {k}
					elseif v==last then
						table.insert(tbl, k)
					end
				end
				if mort=="" then
					jeu.mort = {}
				elseif #tbl>1 and (#plNbr%2)~=0 then
					if nbr==2 then
						jeu.mort = {mort}
					else
						tour = "vote"
					end
				else
					jeu.mort = {mort}
				end
				jeu.vote = {}
			end
		end
		if tour~=nil then
			if tour=="ini" then
				jeu.mort = {""}
				jeu.amour = {""}
				jeu.vote = {""}
				jeu.chat = ""
				for k, v in pairs(plNbr) do
					players[v].mort = true
				end
				tfm.lg.task(2, "night")
			end
			if tour=="night" then
				for _, pl in pairs(plNbr) do
					players[pl].isProtect = false
				end
				ui.msg(T.events[tour])
				tfm.lg.task(2, "thief", tour)
			end
			if tour=="thief" then
				if jeu.roles[8]==1 then
					local txt = "Выберите, кого украсть:"
					local pl = ""
					for k, v in pairs(plNbr) do
						if players[v].jeu.role==8 and players[v].mort then
							pl = v
						elseif players[v].mort then
							txt = txt.."\n<a href='event:steal"..v.."'>"..v.."</a>"
						end
					end
					ui.choser(txt, pl)
					ui.msg(T.events[tour])
					tfm.lg.task(10, "cupid", tour, true, true, idChoser, pl)
				else
					tour = "cupid"
				end
			end
			if tour=="cupid" then
				if jeu.roles[5]==1 then
					local txt = "Выберите двух влюблённых:"
					local pl = ""
					for k, v in pairs(plNbr) do
						if players[v].mort then
							txt = txt.."\n<a href='event:lovers"..v.."'> "..v.."</a>"
							if players[v].jeu.role==5 then
								pl = v
								players[v].amour = {}
							end
						end
					end
					players[pl].jeu.texte = txt
					ui.choser(txt, pl)
					ui.msg(T.events[tour])
					tfm.lg.task(20, "lovers", tour, true, true, idChoser, pl)
				else
					tour = "daily"
				end
			end
			if tour=="lovers" then
				for i=1, 2 do
					ui.addTextArea(idLovers, "<font size='12' color='#131a2a'>Твоя любовь: "..jeu.amour[i], jeu.amour[i==1 and 2 or 1], 6, 322, nil, 20, 0x8C3232, 0x131A2A, transparence, true)
				end
				ui.msg(T.events[tour])
				tfm.lg.task(10, "daily", tour, true)
			end
			if tour=="daily" then
				if jeu.roles[1]==1 or jeu.roles[7]==1 then
					local txt2 = "Выберите, кого защитить:"
					local txt = "Выберите, кого раскрыть:"
					local pl, pl2, msg
					for k, v in pairs(plNbr) do
						if players[v].mort then
							if players[v].jeu.role==1 then
								pl = v
							else
								txt = txt.."\n<a href='event:seer"..v.."'>"..v.."</a>"
							end
							txt2 = txt2.."\n<a href='event:saving"..v.."'>"..v.."</a>"
							if players[v].jeu.role==7 then
								pl2 = v
							end
						end
					end
					if pl and pl2 then
						msg = T.events.seer.."\n"..T.events.saving
						ui.choser(txt, pl)
						ui.choser(txt2, pl2)
					elseif pl then
						msg = T.events.seer
						ui.choser(txt, pl)
					else
						msg = T.events.saving
						ui.choser(txt2, pl2)
					end
					ui.msg(msg)
					tfm.lg.task(20, "werewolf", tour, true, true, idChoser)
				else
					tour = "werewolf"
				end
			end
			if tour=="werewolf" then
				jeu.mort = {}
				speak = true
				for k, v in pairs(plNbr) do
					players[v].vote = nil
				end
				local werewolf, txt = {}, "Выберите, кого съесть:"
				for k, v in pairs(plNbr) do
					if players[v].jeu.role==2 and players[v].mort then
						table.insert(werewolf, v)
					elseif players[v].mort then
						txt = txt.."\n<a href='event:werewolf"..v.."'>"..v.."(0)</a>"
					end
				end
				jeu.txt = txt
				for k, v in pairs(plNbr) do
					if players[v].jeu.role==2 and players[v].mort then
						ui.choser(txt, v)
						ui.chat(v)
					end
				end
				ui.msg(T.events[tour])
				tfm.lg.task(45, "witch", tour, true, true, idChoser)
			end
			if tour=="witch" then
				if jeu.roles[4]==1 then
					for k, v in pairs(plNbr) do
						if players[v].jeu.role==4 then
							if jeu.mort[1]~=nil and players[v].rez==nil then
								ui.addPopup(idChoser, 1, "Хочешь ли ты вернуть к жизни <VI>"..jeu.mort[1].."</VI>?", v, 350, 175, nil, true)
							elseif players[v].kill==nil then
								ui.addPopup(idTimer, 1, "Хочешь убить кого-то?", v, 350, 175, nil, true)
							else
								tour = "dead"
								break;
							end
							ui.msg(T.events[tour])
							tfm.lg.task(15, "dead", tour, true, true, idChoser, v)	
						end
					end
				else
					tour = "dead"
				end
			end
			if tour=="vote" then
				jeu.txtVote, jeu.mort = {}, {}
				for k, v in pairs(plNbr) do
					players[v].vote = nil
				end
				local txt = ""
				for k, v in pairs(plNbr) do
					if players[v].mort then
						jeu.txtVote[v] = string.format("<a href='event:vote%s'>%s</a>(%d)→%s\n", v, v, jeu.vote[v] and jeu.vote[v] or 0, "никто")
					end
				end
				for k,v in pairs(jeu.txtVote) do txt = txt..v end
				for k, v in pairs(plNbr) do
					if players[v].mort then
						ui.choser(txt, v, false, true)
					else
						ui.choser(txt, v, true, true)
					end
				end
				ui.msg(T.events[tour])
				tfm.lg.task(10*(#plNbr-tfm.lg.plDead()), "bucher", tour, true, true, idChoser)
			end
			if tour=="dead" then
				local txt, hunter = "Деревня просыпается, "
				if jeu.mort==nil or ressu or jeu.mort[1]==nil or jeu.mort=={} then
					txt = txt.."без жертв!"
					ressu = false
					ui.msg(txt)
					tfm.lg.task(15, tfm.lg.win() and "win" or "vote", tour)
				else
					for k, v in pairs(jeu.mort) do
						if (not players[v].isProtect) then
							txt, hunter = tfm.lg.dead(v, txt.."без <ROSE>"..v.."</ROSE> ,он(а) был "..roles[players[v].jeu.role].."!!\n")
						end
					end
					jeu.mort = {}
					ui.msg(txt)
					if hunter then
						tfm.lg.task(15, tfm.lg.win() and "win" or "hunter", "mort")
					else
						tfm.lg.task(15, tfm.lg.win() and "win" or "vote", tour)
					end
				end
			end
			if tour=="bucher" then
				local txt, hunter = "Жители деревни сожгли "
				if jeu.mort[1]==nil then
					txt = "Никто не идет на костер !"
				else
					for k, v in pairs(jeu.mort) do
						txt, hunter = tfm.lg.dead(v, tostring(txt).."<ROSE>"..v.."</ROSE> ,он(а) был "..tostring(roles[players[v].jeu.role]).."!!\n")
					end
					jeu.mort = {}
					ui.msg(txt)
					if hunter then
						tfm.lg.task(15, tfm.lg.win() and "win" or "hunter", "feu")
					else
						tfm.lg.task(15, tfm.lg.win() and "win" or "night", tour)
					end
				end
			end
			if tour=="win" then
				local txt = "ERROR"
				if tfm.lg.win()=="no" then
					txt = "Никто не выжил !"
				else
					local tbl = {}
					txt = T.win:format(tfm.lg.win()).."\n Браво <ROSE>"
					for k, v in pairs(plNbr) do
						if players[v].mort then
							table.insert(tbl, v)
						end
					end
					for k, v in pairs(tbl) do
						if k==#tbl then
							txt = txt..v.."</ROSE>!"
						elseif k==#tbl-1 then
							txt = txt..v.."</ROSE> и <ROSE>"
						else
							txt = txt..v.."</ROSE>, <ROSE>"
						end
					end
				end
				ui.msg(txt)
			end
			if tour=="hunter" then
				local txt, pl = "Выбери человека, которого хочешь убить:"
				for k, v in pairs(plNbr) do
					if players[v].jeu.role==6 then
						pl = v
					elseif players[v].mort then
						txt = txt.."\n<a href='event:hunt"..v.."'>"..v.."</a>"
					end
				end
				ui.choser(txt, pl)
				ui.msg("Охотник, в своих последних вздохах, стреляет в человека по своему выбору!")
				tfm.lg.task(15, "deadHunt", lastTour, true, true, idChoser, pl)
			end
			if tour=="deadHunt" then
				if jeu.mort[1]==nil then
					ui.msg(name.." ни в кого не стрелял")
				else
					ui.msg(tfm.lg.dead(jeu.mort[1], name.." выстрелил "..jeu.mort[1].." ,он(а) был "..roles[players[jeu.mort[1]].jeu.role]))
				end
				tfm.lg.task(15, tfm.lg.win() and "win" or (lastTour=="feu" and "night" or "vote"))
			end
		end
	end,

	task = function(time, tour, lastTour, timer, txtArea, id, name)
		table.insert(task, {time = os.time()+time*1000, tour = tour, timer = timer==nil and false or timer, txtArea = txtArea==nil and false or txtArea, id = id, name = name, last = lastTour})
	end,

	map = function()
		local nbr = #plNbr
		if play then nbr=#want2Play end
		ui.setMapName(string.format(mapName, TIME, nbr, nbrSouris(), nbr-tfm.lg.plDead(), tfm.lg.plDead()))
	end,

	win = function()
		tfm.lg.map()
		if jeu.roles[2]==#plNbr-tfm.lg.plDead() then
			return "Оборотни";
		elseif jeu.roles[2]==0 then
			return "Жители";
		elseif #plNbr-tfm.lg.plDead()==2 then
			for k, v in pairs(plNbr) do
				if jeu.amour[1]==v and players[v].mort then
					return "Влюбленные";
				end
			end
		elseif #plNbr-tfm.lg.plDead()==0 then
			return "no";
		else
			return false;
		end
	end
}

badPrint = print
print=function( ... )
	local tbl, self, i = {}, {}, 1
	self.wType=function(var)
		return (type(var)=="number" and "J" or (type(var)=="string" and "VP" or (type(var)=="boolean" and "BV" or (type(var)=="table" and "VI" or "R"))))
	end
	self.pTable=function(tbl1)
		local txt = ""
		for k,v in next, tbl1 do
			txt = txt..("<%s>"..(type(v)=="table" and tostring(k) or tostring(v)).."</%s>"):format(self.wType(v), self.wType(v))
			if type(v)=="table" then
				txt = txt..self.pTable(v)
			end
			txt = txt.."<R>, </R>"
		end
		txt = txt:sub(0, #txt-9)
		return "={"..txt.."}"
	end

	for k,v in next, {...} do
		tbl[i] = ("<%s>"..tostring(v).."</%s>"):format(self.wType(v), self.wType(v))
		if type(v)=="table" then
			tbl[i] = tbl[i]..self.pTable(v)
		end
		i = i+1
	end
	badPrint(table.concat(tbl, "<R>, </R>"))
end

main()
