--[         Оборотни         ]--
--[  Модуль создан Athesdrake#0000  ]--
--[  переведен и дополнен Deff83  ]--
--[  дизайн Deff83  ]--

---------------------- PROPERTIES ----------------------
--adm = "<admin nickname with hash>"
adm = "Deff83#0000" --[[админ]] -- если в поле указан недействительный игрок, запускать игру могут все
point_god_start = 10--god points

roles = {"Ясновидящая", "Оборотень", "Селянин", "Ведьма", "Амур", "Охотник", "Cпаситель", "Вор", "Качек", "бог"}
color_roles = {"#ff00ff", "#ffff00", "#ffcc00", "#ff0ff0", "#f5000f", "#ffffcc", "#ccff57", "#972721", "#456789", "#20B2AA"}
colorInfor = {"#aaaa00", "#00cc00", "#cc0000", "#777777", "#ffff00", "#ff33ff"} --info, add pl, no add pl, left new pl, WIN, admin
color_side = {"#00ff00", "#ff0000"}

changeLesNoms = {
	voyante =    {"Ясновидящая", nil},
	loup_garou = {"Оборотень", nil}, -- mettez "$" aux endroits où il faut un "s" au pluriel. (ne fonctionne que pour ce rôle)
	villageois = {"Селянин", nil},
	sorciere =   {"Ведьма", nil},
	cupidon =    {"Амур", nil},
	chasseur =   {"Охотник", nil},
	salvateur =  {"Cпаситель", nil},
	voleur =     {"Вор", nil},
	costaud =    {"Качек", nil},
	god =        {"Бог", nil}
}

------------------ ADVANCED PROPERTIES -----------------
-- WARNING
bool_auto_start = true
map = "@7704872"
smesh = 50

transparence = 0.75 --[[прозрачность текста]] -- от 0 (полностью невидимый) до 1 (полностью видимый)
testing = false --[[режим тестового запуска]] -- нет минимума игроков, всех убъет в начале игры

--------------------- DO NOT TOUCH ---------------------
--------------------- GAME  STATES ---------------------

fontxSize = 10
maxCountfontxSize=12
fontxSizeMin=8

massinfo = {}
massinfoplus = {}-----mouseinfo plus
--".."<font color='"..color_roles[1].."'>".."
--</font>

tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame(map)

tp_player = {{250, 600}, {1200, 500}, {250, 250}} --prison, boiler, god
zap = false

-----rule
function show_rule(pl)
	ui.addPopup(-10000, 0, "<p align='center'><font size='30px' color='#ffff00'>Конкурс \"Оборотни\"</font><br><font size='14px'><font color='#00FFFF'>автор Athesdrake#0000 редакция и улучшение Deff83#0000 и Ilyamikheev#4068</font><br><font size='12px'>Вы должны убить всех ".."<font color='"..color_side[1].."'>".."жителей</font> деревни, если вы ".."<font color='"..color_roles[2].."'>".."оборотень</font> или убить всех ".."<font color='"..color_side[2].."'>".."оборотней</font>, если вы сельский ".."<font color='"..color_side[1].."'>".."житель</font>. Для этого ".."<font color='"..color_roles[2].."'>".."оборотни</font> могут назначить жертву ночью и сожрать ее. Днем деревня голосует за то, чтобы посадить кого-нибудь на костер. Его личность будет раскрыта. В игре необходимо догадаться, кто является оборотнем среди ".."<font color='"..color_roles[3].."'>".."жителей</font>.<br>".."<font color='"..color_roles[3].."'>".."Житель деревни.</font> Он не имеет никакой власти, но играет важную роль в голосовании.<br>".."<font color='"..color_roles[2].."'>".."Оборотень.</font> Ночью превращается в оборотня, чтобы пожрать жертву.<br>".."<font color='"..color_roles[1].."'>".."Ясновидящая.</font> Каждую ночь она видит сквозь свой волшебный шар истинную личность мыши по своему выбору.<br>".."<font color='"..color_roles[4].."'>".."Ведьма.</font> Она владеет двумя зельями. Первая позволяет ему, оказавшись в части, воскресить мышь, которого съели волки. Вторая позволяет ему, также оказавшись в части, убить мышь по своему выбору.<br>".."<font color='"..color_roles[6].."'>".."Охотник.</font> Это вполне нормальный персонаж, за исключением того, что, когда он умирает, он может убить мышь по своему выбору.<br>".."<font color='"..color_roles[8].."'>".."Вор.</font> В начале игры он меняет свою карту на чужую. (он станет простым жителем).<br><font color='#888888'>Маленькая девочка.</font> Эта роль не ставится. <font size='8px'>(я не вижу, как это сделать, чтобы закодировать эту роль :/ )</font>.<br>".."<font color='"..color_roles[7].."'>".."Спаситель.</font> Он может каждую ночь защищать кого-то по своему выбору. Он не может выбрать одну и ту же мышь две ночи подряд (но может защитить себя).</font></font></p>", pl, 100, 30, 600, true)
end

ui.addTextArea(-66000, "<a href='event:help'>help", nil, 725, 27, 50, 20, 1, 0x0000ff, 0.7,true)

show_rule(nil)

	--massinfo[#massinfo+1] = "<font color='"..colorInfor[1].."'>".."Init game".."</font>"

function main()
--god
	mouse_choose_vos = ""
	point_god = point_god_start + 1
--start timer
	time = 0
	time_auto = 0
--info
	massinfo[#massinfo+1] = "<font color='"..colorInfor[1].."'>".."Init game".."</font>"
--vars:
	play = true
	speak = false
	TIME = 0
	mapName = "<VP>Оборотни<BL> | <N>Время: <V>%ds</V><BL> | <N>Мышь: <V>%d<N>/<V>%d<N> (<PT>%d<N>, <R>%d<N>)<BL> | <N>Создатели: <BV>Athesdrake#0000 и Deff83#0000\n"
--ids:
	idHaut = 1
	idRole = 2
	idChoser = 3
	idTimer = 4
	idPlay = 5
	idLovers = 6
	idChat = 7
	idStartButton = 8
	idWantGog = -75130
	idGodWChoose = -75520
	idGodWPol = -75580
--tables:
	task = {}
	players = {}
	plNbr = {}
	want2Play = {}
	jeu = {}
	game = {}
		--roles = {"Ясновидящая", "Оборотень", "Селянин", "Ведьма", "Амур", "Охотник", "Cпаситель", "Вор", "Качек", "Бог"}
		game[3]  = {0, 1, 0, 0, 1, 0, 0, 0, 0, 1}
		game[4]  = {0, 1, 0, 0, 1, 0, 0, 1, 0, 1}
		game[5]  = {1, 2, 2, 0, 0, 0, 0, 0, 0, 0}
		game[6]  = {1, 2, 2, 1, 0, 0, 0, 0, 0, 0}
		game[7]  = {1, 2, 2, 1, 1, 0, 0, 0, 0, 0}
		game[8]  = {1, 2, 2, 1, 1, 1, 0, 0, 0, 0}
		game[9]  = {1, 2, 2, 1, 1, 1, 1, 0, 0, 0}
		game[10] = {1, 2, 2, 1, 1, 1, 1, 1, 0, 0}
		game[11] = {1, 2, 2, 1, 1, 1, 1, 1, 1, 0}
		game[12] = {1, 2, 2, 1, 1, 1, 1, 1, 1, 1}
		
	T = {
		events = {
			night = " Наступает ночь, вся деревня засыпает.",
			thief = "".."<font color='"..color_roles[8].."'>".." %s %s</font> просыпается, крадет кого-то и засыпает. Проверьте свою карту после поворота!!!",
			cupid = "".."<font color='"..color_roles[5].."'>".." %s %s</font> просыпается, выбирает двух любовников и засыпает.",
			lovers = " Влюбленные просыпаются, узнают друг друга, целуются и засыпают.",
			seer = "".."<font color='"..color_roles[1].."'>".." %s %s</font> просыпается, видит чью-то роль и засыпает.",
			saving = "".."<font color='"..color_roles[7].."'>".." %s %s</font> просыпается, защищает кого-то и засыпает.",
			werewolf = "".."<font color='"..color_roles[2].."'>".." %s</font> просыпаются, выбирают свою жертву и засыпают.",
			witch = "".."<font color='"..color_roles[4].."'>".." %s %s</font> просыпается, выбирается из мертвых или убивает кого-то и засыпает.",
			vote = " Выберите, кого сжечь на костре!",
			hunter = "".."<font color='"..color_roles[6].."'>".." %s %s</font> выбирай цель!",
			god = "".."<font color='"..color_roles[10].."'>".." %s %s</font> выбирай действие!",
		},
		win = "%s выиграли!"
	}
--sytème:
	for pl in pairs(tfm.get.room.playerList) do
		--if pl == adm then
			initPlayer(pl)
		--end
		
	end
	startPanel()
end

function startPanel()
	admin = nil
	for pl in pairs(tfm.get.room.playerList) do
		if pl == adm then
			admin = adm
		end
		
	end
	for k, v in pairs({"start", "t"}) do
		system.disableChatCommandDisplay(v, true)
	end
	for i=2, 7 do
		ui.removeTextArea(i)
	end
	ui.addTextArea(idStartButton, '<a href="event:start">Запустить</a>', admin, 720, 370, 65, 20, 0x005500, 0x00FF00, transparence, true)
end

function isContains(table, element)
    for p, val in pairs(table) do
         if val == element then
        
            return true
        end
    end
    return false
end

function isContainsMap(table, element)
    for p, val in pairs(table) do
         if p == element then
        
            return true
        end
    end
    return false
end

function countmapa(massiv)
    i=0
    for p, x in pairs(massiv) do
        i=i+1
    end
    return i
end


function initPlayer(name)
	ui.addPopup(idPlay, 1, "<p align='center'>Ты хочешь играть в Оборотни?", name, 350, 175, nil, true)
	players[name] = {isPlaying = false, play = false}
	tfm.lg.map()
	ui.addTextArea(-66000, "<a href='event:help'>help", nil, 725, 27, 50, 20, 1, 0x0000ff, 0.7,true)
end

function eventPlayerDied(nick)
    tfm.exec.respawnPlayer(nick)
end

function addPhysicObjectAll()
	tfm.exec.addPhysicObject(0, 1228, 435, {type=8, width=380, height=28})--the cover of the boiler
	tfm.exec.addPhysicObject(1, 385, 587, {type=10, width=20, height=150})--door of prison
	tfm.exec.addPhysicObject(2, 385, 215, {type=1, width=20, height=150})--door of god
end

function eventNewPlayer(name)
	if name == adm then
		ui.addTextArea(-58100, "<a href='event:adminpanel'>Admin panel", adm, 320-smesh, 720, 100, nil, 0x000001, 0xFFFFFF, 0.7, false)
	end

	if zap then
		addPhysicObjectAll()
	end
    tfm.exec.setNameColor(name, colornick[1])
	if play and name == adm then--admin new player, game not start
		ui.removeTextArea(idStartButton, nil)
		admin = adm
		ui.addTextArea(idStartButton, '<a href="event:start">Запустить</a>', admin, 720, 370, 65, 20, 0x005500, 0x00FF00, transparence, true)
	end
	initPlayer(name)
	show_rule(name)
    tfm.exec.respawnPlayer (name)	
	massinfo[#massinfo+1] = "<font color='"..colorInfor[4].."'>["..name.."]:".."Присоединился к игре!</font>"
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
		local txt = tfm.lg.dead(name, "<ROSE>"..name.."</ROSE> вышел из комнаты. Это был один ".."<font color='"..color_roles[players[name].jeu.role].."'>"..roles[players[name].jeu.role].."</font> !")
		--ui.msg(txt)
		massinfo[#massinfo+1] = txt
		if tfm.lg.win() then
			for k, v in ipairs(task) do
				task[k].finish = true
			end
			tfm.lg.task(3, "win")
		end
	end
	if play then
		if players[name] ~= nil then
			players[name] = nil
		end
		local i = 0
		for k, v in pairs(want2Play) do
			if v == name then
				i = k
			end
		end
		if i ~= 0 then
			table.remove(want2Play, i)
		end
		if name == adm then--left adm
			startPanel()
		end
	end
	tfm.lg.map()
	massinfo[#massinfo+1] = "<font color='"..colorInfor[4].."'>["..name.."]:".."Покинул игру!</font>"
end

function eventNewGame() tfm.lg.map() end

function gameInit()
	if (not pcall(setRolesNames)) then
            -- Звучит абсолютно понятно (нет) (ilyamikheevcoder)
			error("<R>Таблица \'Изменения\' одержимые!</R>")
	end
	if #want2Play>2 or testing then
		zap = true
		addPhysicObjectAll()
		massinfo[#massinfo+1] = "<font color='"..colorInfor[1].."'>".."Start game".."</font>"
		ui.removeTextArea(idStartButton, nil)
		task = {}
		play = false
		jeu = {roles={0,0,0,0,0,0,0,0,0,0}}
		local r = {}
		if game[#want2Play]~=nil then
			print("start init map"..#want2Play)
			for k, v in pairs(game[#want2Play]) do
				r[k] = v
			end
		else
			print("no start init map")
			r = {1,3,2,1,1,1,1,1,1,1}				--{"Ясновидящая", "Оборотень", "Селянин", "Ведьма", "Амур", "Охотник", "Cпаситель", "Вор", "Качек"}
			r[2] = #want2Play/4
			r[3] = #want2Play-(r[2]+10)
		end
		
		math.randomseed(os.time())
        if not testing then
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
		else
			for k, v in pairs(want2Play) do
				players[v].play = true
				players[v].mort = true
			end
		end
		tfm.lg.tour("ini")
	else
		massinfo[#massinfo+1] = "<font color='"..colorInfor[1].."'>".."Fail start game (".."still need "..(3-#want2Play).." mice"..")</font>"
		ui.msg("Не хватает игроков!\nНеобходимо минимум <J>3</J> игрока!")
		want2Play_not_enouth()
	end
end


function want2Play_not_enouth()
	for k,v in pairs(tfm.get.room.playerList) do
		if isContains(want2Play, k)==false and players[k]~=nil and players[k].isPlaying==false then
			ui.addPopup(idPlay, 1, "<p align='center'>Ты хочешь играть в Оборотни?", k, 350, 175, nil, true)
			players[k] = {isPlaying = false, play = false}
			tfm.lg.map()
		end
	end
end

function eventChatCommand(name, cmd)
	if cmd=="start" and play then
		
	end
	--if string.lower(cmd:sub(0,1))=="t" and speak and players[name].jeu.role~=nil and players[name].jeu.role==2 and players[name].mort then
		-- jeu.chat = "["..name.."] "..((cmd:sub(3)):gsub("&lt;"..".-".."&gt;", "")):gsub("%c", "").."\n"..jeu.chat
		-- for k, v in pairs(plNbr) do
			-- if players[v].jeu.role==2 then
				-- ui.chat(v)
			-- else
				-- ui.removeTextArea(idChat, v)
			-- end
		-- end
	-- end
end

function getSwitch(boolt)
	if boolt then
		return "вкл"
	else
		return "выкл"
	end
end

function eventTextAreaCallback(id, name, call)
	
	if call == "help" then
		show_rule(name)
	end
	
	if call == "adminpanel" then
		ui.addTextArea(-58100, "<a href='event:adminmessage'>Написать сообщение в чат</a><br><a href='event:bool_auto_start'>Автостарт:"..getSwitch(bool_auto_start).."</a><br><br><a href='event:adminchange_close'>Close</a>", adm, 100, 150, 600, nil, 1, 1, 1, true)
	end
	
	if call == "adminmessage" then
		ui.addTextArea(-58100, "<a href='event:adminpanel'>Admin panel", adm, 320-smesh, 720, 100, nil, 0x000001, 0xFFFFFF, 0.7, false)
		ui.addPopup(-58100, 2, "<p align='center'>Введите сообщение!", adm, 200, 200, 400, true)
	end
	if call == "adminchange_close" then
		ui.addTextArea(-58100, "<a href='event:adminpanel'>Admin panel", adm, 320-smesh, 720, 100, nil, 0x000001, 0xFFFFFF, 0.7, false)
	end
	
	if call == "bool_auto_start" then
		bool_auto_start = not bool_auto_start
		if bool_auto_start then
			time = 0
			time_auto = 0
		end
		ui.addTextArea(-58100, "<a href='event:adminmessage'>Написать сообщение в чат</a><br><a href='event:bool_auto_start'>Автостарт:"..getSwitch(bool_auto_start).."</a><br><br><a href='event:adminchange_close'>Close</a>", adm, 100, 150, 600, nil, 1, 1, 1, true)
	end
	
	
	if call == "plusinfo" then
		ui.removeTextArea(-57000, name)
		ui.removeTextArea(-57100, name)
		if isContainsMap(massinfoplus, name) then
			
		else
			massinfoplus[name] = 1
		end
		messageinfo(name)
	end
	if call == "plusinfom" then
		ui.removeTextArea(-57000, name)
		ui.removeTextArea(-57100, name)
		if isContainsMap(massinfoplus, name) then
			massinfoplus[name] = nil
		else
			
		end
		messageinfo(name)
	end
	
    if call == "start" then
		gameInit()
	end
	if call:sub(1,5)=="steal" then--вор голосует
		ui.removeTextArea(id, nil)
		players[name].choose = true
		players[name].jeu.role = players[call:sub(6)].jeu.role
		players[call:sub(6)].jeu.role = 3
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
		ui.choser(call:sub(5).." является ".."<font color='"..color_roles[players[call:sub(5)].jeu.role].."'>"..roles[players[call:sub(5)].jeu.role], name)
		massinfo[#massinfo+1] = "<font color='"..color_roles[1].."'>".."Ясновидящая</font> посмотрела чью-то роль"
	end
	if call:sub(1,6)=="saving" then
		if players[name].lastProtect ~= call:sub(7) then
			players[name].lastProtect = call:sub(7)
			players[call:sub(7)].isProtect = true
			ui.choser("Ты защищаешь "..call:sub(7).." на ночь!", name)
			massinfo[#massinfo+1] = "<font color='"..color_roles[7].."'>".."Спаситель</font> защитил кого-то на ночь"
		else
			ui.choser("Ты не можешь защищать одного и того же подряд!", name)
		end
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
		
		local fontsize = fontxSize
		if countmapa(plNbr)>maxCountfontxSize then
			fontsize = fontxSizeMin
			print("fontsize")
		end
		
		for k,v in pairs(plNbr) do
			if players[v].mort then
				jeu.txtVote[v] = (string.format("<font size='"..fontsize.."px'>".."<a href='event:vote%s'>%s</a>(%d)→%s\n".."</font>", v, v, jeu.vote[v] and jeu.vote[v] or 0, players[v].vote and players[v].vote or "никто"))
			end
		end
		local txt = "Выберите кого сжечь:\n"
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
		ui.choser(call:sub(5).." пей свое зелье и умри!", name)
		massinfo[#massinfo+1] = "<font color='"..color_roles[4].."'>".."Ведьма</font> тратит смертоносное зелье"
	end
	if call:sub(1,8)=="god_kill" then
		jeu.mort[1] = call:sub(9)
		ui.choser("Ты убил "..call:sub(9).."!", name)
		--massinfo[#massinfo+1] = "<font color='"..color_roles[10].."'>".."Бог</font> убил "..call:sub(9)
	end
	if call:sub(1,4)=="hunt" then
		jeu.mort[1] = call:sub(5)
		ui.choser("ты стреляешь в "..call:sub(5).." на смерть", name)
	end
	if call=="chat_o" then
		ui.addPopup(-58200, 2, "<p align='center'>введите сообщение:", name, 200, 200, 400, true)
	end
	if id==-66 then
		ui.removeTextArea(-66, nil)
		if call == "yesWitch" then
			massinfo[#massinfo+1] = "<font color='"..color_roles[4].."'>".."Ведьма</font> тратит зелье воскрешения"
			ressu = true
			players[name].rez = ""
		elseif call == "noWitch" then
			if players[name].kill==nil then
				ui.addTextArea(-66, "<p align='center'>Хочешь убить кого-то?\n".."<a href='event:yesWitchDie'>yes".." ".."<a href='event:noWitchDie'>no", name, 300, 175, 200, 60, 1, 0x0000ff, 0.9,true)
			end
		end
		
		if call == "yesWitchDie" then
			
			local txt = "Выберите кого убить:\n"
			for k, v in pairs(plNbr) do
				if players[v].mort then
					txt = txt.."<a href='event:kill"..v.."'>"..v.."</a>\n"
				end
			end
			players[name].txt = txt
			ui.addTextArea(idChoser, txt, name, 620, 110, 180, nil, 0x000001, 0xFFFFFF, transparence, true)
		elseif call == "noWitchDie" then
		end
		
		
	end
	if call == "god_die" then
		point_god = point_god - 1
		local txt = "Выберите, кого убить:"
		local pl = ""
		for k, v in pairs(plNbr) do
			if players[v].jeu.role==10 and players[v].mort then
				pl = v
			elseif players[v].mort then
				txt = txt.."\n<a href='event:god_kill"..v.."'>"..v.."</a>"
			end
		end
		ui.choser(txt, pl)
		
	end
	if call=="god_vskres" then
		point_god = point_god - 1
		
		local txt = "Выберите, кого воскресить:"
		for k, v in pairs(tfm.get.room.playerList) do
			if locate(k, 1) then
				txt = txt.."\n<a href='event:god_vos"..k.."'>"..k.."</a>"
			end
		end
		ui.choser(txt, name)
	end
	if call=="god_vskres2" then
		point_god = point_god - 1
		
		local txt = "Выберите, кого воскресить:"
		for k, v in pairs(tfm.get.room.playerList) do
			if locate(k, 2) then
				txt = txt.."\n<a href='event:god_vos"..k.."'>"..k.."</a>"
			end
		end
		ui.choser(txt, name)
	end
	
	if call=="want_god" then

		if isContainsMap(players, name) and players[name].isPlaying==true and players[name].mort == true then

		else
			ui.removeTextArea(idWantGog, nil)
			tfm.exec.movePlayer(name,tp_player[3][1],tp_player[3][2],false,0,0,false)
			p_stakan = name
			showGodWanted()
			bool_die_god = true
		end
		
	end
	if call:sub(1,9)=="got_w_pol" then
		ui.removeTextArea(id, nil)
		print(call:sub(10))
		god_stakan = call:sub(10)
		bool_die_god = false
		showWanted(p_stakan)
	end
	
	
	
	if call:sub(1,7)=="god_vos" then
		ui.removeTextArea(id, nil)
		mouse_choose_vos = call:sub(8)
		
	end
	
	if call:sub(1,5)=="w_pol" then
		ui.removeTextArea(id, nil)
		print(call:sub(6))
		local j_god_stakan = call:sub(6)
		if j_god_stakan==god_stakan then--угадал
			print("TYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYT")
				if jeu.roles[10]==1 then
					local pl = ""
					for k, v in pairs(plNbr) do
						if players[v].jeu.role==10 and players[v].mort then
							pl = v
						end
					end
					if pl~="" then
						for k, v in pairs(plNbr) do
							if v==pl then
								table.remove(plNbr, k)
								break
							end
						end
						txth = tfm.lg.dead(pl, "Умер <font color='"..color_roles[10].."'>бог</font>:"..pl)
						if txth ~= "" then
							massinfo[#massinfo+1] = txth
						end
						table.insert(plNbr, name)
						jeu.roles[10] = jeu.roles[10] + 1
						players[name].jeu = {}
						players[name].jeu.role = 10
						players[name].isPlaying = true
						players[name].mort = true
						tfm.exec.removePhysicObject(2)
						local objectif = "Убей всех оборотней!"
						ui.role(name, roles[10], objectif)
						point_god = point_god_start
						massinfo[#massinfo+1]="Сменился <font color='"..color_roles[10].."'>бог</font>!"
					end
					
					
				end
			
			
		else
			point_god = point_god_start
		end
		god_stakan = 0
	end
	
end

mass_locate_sqare = {
	{20, 530, 370, 660},
	{1060, 450, 1380, 560}
	
}

function locate(pl, locate_sqare)
	local sq = mass_locate_sqare[locate_sqare]
	local mouse = tfm.get.room.playerList[pl]
	if (mouse.x<sq[3] and mouse.x>sq[1]) and (mouse.y<sq[4] and mouse.y>sq[2]) then
		return true
	end
	return false
end

god_stakan = 0
p_stakan = adm

function showWanted(plf)
	if jeu.roles[10]==1 then
		local pl = ""
		for k, v in pairs(plNbr) do
			if players[v].jeu.role==10 and players[v].mort then
				pl = v
			end
		end
		if pl~="" then
			ui.addTextArea(idGodWChoose, "<p align='center'><font size='15px'>Найдите шарик в одном из стаканов:<br>".."\n<font size='40px'><font color='#ff0000'><a href='event:w_pol1'>▼</a></font>".." ".."<font color='#ffff00'><a href='event:w_pol2'>▼</a></font>".." ".."<font color='#00ff00'><a href='event:w_pol3'>▼</a></font></font>", plf, 250, 130, 300, nil, 1, 0x0000ff, 0.7,true)
		end
		
		
	end
end

function showGodWanted()
	if jeu.roles[10]==1 then
		local pl = ""
		for k, v in pairs(plNbr) do
			if players[v].jeu.role==10 and players[v].mort then
				pl = v
			end
		end
		if pl~="" then
			ui.addTextArea(idGodWPol, "<p align='center'><font size='15px'>Положите шарик в один из стакан:<br>".."\n<font size='40px'><font color='#ff0000'><a href='event:got_w_pol1'>▼</a></font>".." ".."<font color='#ffff00'><a href='event:got_w_pol2'>▼</a></font>".." ".."<font color='#00ff00'><a href='event:got_w_pol3'>▼</a></font></font>", pl, 250, 130, 300, nil, 1, 0x0000ff, 0.7,true)
		end
		
	end
end


function eventPopupAnswer(id, name, ans)
	if id == -58100 then--message admin
		if ans ~= "" then
			massinfo[#massinfo+1] = "<font color='"..colorInfor[6].."'>[ADMIN]:"..ans.."</font>"
			messageinfo(nil)
		end
	end
	
	if id==idPlay then
		if ans=="yes" then
			massinfo[#massinfo+1] = "["..name.."] <font color='"..colorInfor[2].."'>".."хочет играть".."</font>"
			if (not play) then
				ui.addPopup(idPlay, 0, "Ты должен ждать следующей части, чтобы играть", name, 350, 175, nil, true)
			end
			players[name].play = true
			players[name].mort = true
			table.insert(want2Play, name)
			tfm.lg.map()
		else
			massinfo[#massinfo+1] = "["..name.."] <font color='"..colorInfor[3].."'>".."не хочет играть".."</font>"
		end
	end
		
		
	if id==idChoser then
		if ans=="yes" then
			massinfo[#massinfo+1] = "<font color='"..color_roles[4].."'>".."Ведьма</font> тратит зелье воскрешения"
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
	if id==-58200 then--chat_o
		if ans~="" then
			jeu.chat = "["..name.."] "..ans.."\n"..jeu.chat
			for k, v in pairs(plNbr) do
				if players[v].jeu.role==2 then
					ui.chat(v)
				else
					ui.removeTextArea(idChat, v)
				end
			end
		end
	end
end

obnovmessageinfo = 2*1
time = 0

time_auto = 0
timer_start_auto = 30

function eventLoop(t1, t2)
	time = time + 0.5
	for k, v in ipairs(task) do
		local tbl = task[k]
		TIME = math.ceil(os.difftime(tbl.time,os.time())/1000)
		tfm.lg.map()
		if tbl.timer then
			ui.addTextArea(idTimer, TIME, all, 665, 28, nil, nil, 0, 0, 0, true)--timer
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
			ui.addPopup(idTimer, 0, "", name, 9999, 9999, 0)
			ui.addPopup(idChoser, 0, "", name, 9999, 9999, 0)
		end
	end
	if time % obnovmessageinfo == 0 then
		messageinfo(nil)
		changeColorNick()
	end
	if play and bool_auto_start then--non start
		if time_auto == 0 then
			time_auto = os.time()+timer_start_auto*1000
		end
		TIME = math.ceil(os.difftime(time_auto,os.time())/1000)
		tfm.lg.map()
		if TIME<1 then
			time_auto = 0
			gameInit()
		end
		
	end
end

colornick = {0xffffff, 0xffff00}

function changeColorNick()
	for k,v in pairs(tfm.get.room.playerList) do
		if players and isContainsMap(players, k) and players[k].isPlaying==true and players[k].mort == true then
			tfm.exec.setNameColor(k, colornick[2])
		else
			tfm.exec.setNameColor(k, colornick[1])
		end
	end
end

function setRolesNames()
	if changeLesNoms~=nil and type(changeLesNoms)=="table" then
		local tbl = changeLesNoms
		T.events.seer = string.format(T.events.seer, tbl.voyante~=nil and (tbl.voyante~=nil and (tbl.voyante[2]~=nil and tbl.voyante[2] or "")) or "", tbl.voyante[1]~=nil and tbl.voyante[1] or "Ясновидящая" or "Ясновидящая")
		T.events.werewolf = string.format(T.events.werewolf, tbl.loup_garou~=nil and (tbl.loup_garou[1]~=nil and tbl.loup_garou[1]:gsub("%$", "s") or "Оборотень") or "Оборотень")
		T.events.witch = string.format(T.events.witch, tbl.sorciere~=nil and (tbl.sorciere~=nil and (tbl.sorciere[2]~=nil and tbl.sorciere[2] or "")) or "", tbl.sorciere[1]~=nil and tbl.sorciere[1] or "Ведьма" or "Ведьма")
		T.events.cupid = string.format(T.events.cupid, tbl.cupidon~=nil and (tbl.cupidon~=nil and (tbl.cupidon[2]~=nil and tbl.cupidon[2] or "")) or "", tbl.cupidon[1]~=nil and tbl.cupidon[1] or "Амур" or "Амур")
		T.events.hunter = string.format(T.events.hunter, tbl.chasseur~=nil and (tbl.chasseur~=nil and (tbl.chasseur[2]~=nil and tbl.chasseur[2] or "")) or "", tbl.chasseur[1]~=nil and tbl.chasseur[1] or "Охотник" or "Охотник")
		T.events.saving = string.format(T.events.saving, tbl.salvateur~=nil and (tbl.salvateur~=nil and (tbl.salvateur[2]~=nil and tbl.salvateur[2] or "")) or "", tbl.salvateur[1]~=nil and tbl.salvateur[1] or "Cпаситель" or "Cпаситель")
		T.events.thief = string.format(T.events.thief, tbl.voleur~=nil and (tbl.voleur~=nil and (tbl.voleur[2]~=nil and tbl.voleur[2] or "")) or "", tbl.voleur[1]~=nil and tbl.voleur[1] or "Вор" or "Вор")
		T.events.god = string.format(T.events.god, tbl.god~=nil and (tbl.god~=nil and (tbl.god[2]~=nil and tbl.god[2] or "")) or "", tbl.god[1]~=nil and tbl.god[1] or "Бог" or "Бог")
		
		
		roles[1] = tbl.voyante~=nil and (tbl.voyante[1]~=nil and tbl.voyante[1] or roles[1]) or roles[1]
		roles[2] = tbl.loup_garou~=nil and (tbl.loup_garou[1]~=nil and tbl.loup_garou[1]:gsub("%$", "") or roles[2]) or roles[2]
		roles[3] = tbl.villageois~=nil and (tbl.villageois[1]~=nil and tbl.villageois[1] or roles[3]) or roles[3]
		roles[4] = tbl.sorciere~=nil and (tbl.sorciere[1]~=nil and tbl.sorciere[1] or roles[4]) or roles[4]
		roles[5] = tbl.cupidon~=nil and (tbl.cupidon[1]~=nil and tbl.cupidon[1] or roles[5]) or roles[5]
		roles[6] = tbl.chasseur~=nil and (tbl.chasseur[1]~=nil and tbl.chasseur[1] or roles[6]) or roles[6]
		roles[7] = tbl.salvateur~=nil and (tbl.salvateur[1]~=nil and tbl.salvateur[1] or roles[7]) or roles[7]
		roles[8] = tbl.voleur~=nil and (tbl.voleur[1]~=nil and tbl.voleur[1] or roles[8]) or roles[8]
		roles[9] = tbl.costaud~=nil and (tbl.costaud[1]~=nil and tbl.costaud[1] or roles[9]) or roles[9]
		roles[10] = tbl.costaud~=nil and (tbl.god[1]~=nil and tbl.god[1] or roles[10]) or roles[10]
		
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
	ui.addTextArea(idHaut, "<p align='center'>"..txt.."</p>", name, 15, 28, 670, nil, 0x000001, 0xffffff, transparence, true)
end



ui.role = function(name, role, obj)
	ui.addTextArea(idRole, "<font size='10' color='#ffffff'>Ты: </font><font size='16' color='"..color_roles[players[name].jeu.role].."'>"..role.."</font>\n<p align='center'><font size='8'><b>"..(obj==name and ("Ты был: "..roles[players[name].jeu.role]) or " цель: "..obj), name, 10, 60, 220, nil, 0x000001, 0xFFFFFF, transparence, true)
	if obj==name then
		ui.addTextArea(idRole, "<font size='10' color='#ffffff'>Ты: </font><font size='16' color='"..color_roles[players[name].jeu.role].."'>"..role.."</font>\n<p align='center'><font size='8'><b>"..(obj==name and ("Ты был: "..roles[players[name].jeu.role]) or " цель: "..obj), name, 10, 60, 220, nil, 0x550000, 0xFFFFFF, transparence, true)
	end
	

end

ui.changeGod = function(name)
	ui.addTextArea(idWantGog, "<a href='event:want_god'>Стать богом", nil, 1220-smesh, 720, 110, nil, 0x000001, 0xFFFFFF, 0.7, false)
	--ui.addTextArea(idChoser, "Points:"..point_god.."<br><br><a href='event:god_vskres'>воскресить</font><br><a href='event:god_die'>убить</font>", name, 560, 80, 225, nil, 0x000001, 0xFFFFFF, transparence, true)
end


ui.choserGod = function(name)
	ui.addTextArea(idChoser, "Points:"..point_god.."<br><br><a href='event:god_vskres'>воскресить с тюрьмы</font><br><a href='event:god_vskres2'>воскресить с костра</font><br><a href='event:god_die'>убить</font>", name, 500, 80, 165, nil, 0x000001, 0xFFFFFF, transparence, true)
end

ui.choser = function(txt, name, bool, display)
	ui.addTextArea(idChoser, (bool and txt:gsub("href", "color") or txt), name, 560, 80, 225, nil, 0x000001, 0xFFFFFF, transparence, true)
end

ui.chat = function(name)
	ui.addTextArea(idChat, "<BL> Чат оборотней </BL> (<a href='event:chat_o'>написать</a>)\n"..jeu.chat, name, 15, 140, 200, 160, 0x000001, 0xFFFFFF, tonumber(transparence)/1.5, true)
end

boolpovt = false

function refreshRand(massiv)
	local localn = {}
	for k,v in pairs(massiv) do
		localn[k] = v
	end
	return localn
end

function eventKeyboard(nick,klaw, down, x, y)
	if klaw== 32 then--down
		print("down")
		
		ui.addPopup(idChoser, 1, "Хочешь ли ты вернуть к жизни ?", nick, 350, 175, 200, true)
	end
end

tfm.exec.bindKeyboard(adm,32,true) --up
bool_die_god = false

tfm.lg = {
	dead = function(name, mort)
		local role, txt, hunter, cos = players[name].jeu.role, mort, players[name].jeu.role==6, players[name].jeu.role==9
		if cos and players[name].life==nil then--если качек и жизнь равна nil
			players[name].life = 1
			if txt~=nil then
			txt = "<font color='"..color_roles[9].."'>".."Качек</font> имел вторую жизнь и воскрес\n"..txt
			return	txt, false;
			else
			
			end
			
		end
		players[name].mort = false
		players[name].life=nil
		jeu.roles[role] = jeu.roles[role] - 1
		ui.role(name, "Мертв", name)
		if jeu.amour~=nil and jeu.amour[1]~=nil then
			local tbl = jeu.amour
			if (name==tbl[1] and players[tbl[2]].mort) or (name==tbl[2] and players[tbl[1]].mort) then
				local name2 = name==tbl[1] and tbl[2] or tbl[1]
				
				boolamur = true
				tfm.lg.dead(name2)
				txt = txt.."\n<ROSE>"..name2.."</ROSE> умирает от горя, потеряв любимого, он(а) был ".."<font color='"..color_roles[players[name2].jeu.role].."'>"..roles[players[name2].jeu.role].."</font> !"
				--massinfo[#massinfo+1] = txt
				
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
		-----------------------------------------------------lastTour-----------------------------------------------
		if lastTour~=nil then
			if lastTour=="thief" then--вор
					print("THIFP")
				if players[name] and players[name].choose==true  then
					print("THIF")
					jeu.roles[8] = 0
					jeu.roles[3] = jeu.roles[3] + 1
					players[name].choose = ""
				end
			end
			if lastTour=="cupid" then--купидон
				if players[name].amour[2]==nil then
					tour = "daily"
				else
					jeu.amour = {}
					jeu.amour[1] = players[name].amour[1]
					jeu.amour[2] = players[name].amour[2]
					jeu.roles[5] = 0
					jeu.roles[3] = jeu.roles[3] + 1
					players[name].jeu.role = 3
					ui.role(name, "Селянин", "Убей всех оборотней!")
				end
			end
			if lastTour=="witch" then--ведьма
				ui.removeTextArea(-66, nil)
				ui.addPopup(idTimer,2,"",name,1e7,1e7)
				ui.addPopup(idChoser,2,"",name,1e7,1e7)
			end
			if lastTour=="werewolf" then--оборотень
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
			if lastTour=="god" then--бог
				ui.removeTextArea(idWantGog, nil)
				ui.removeTextArea(idGodWChoose, nil)
				ui.removeTextArea(idGodWPol, nil)
			end
			if lastTour=="god_dey" then--бог показать
				addPhysicObjectAll()
			end
			if lastTour=="vote" then--голосование
				local last = 0
				local mort = ""
				local tbl = {}
				local nbr = 0--количество не мертвых
				for k, v in pairs(plNbr) do
					if players[v].mort then
						nbr = nbr + 1
					end
				end
				
				jeu.vote = refreshRand(jeu.vote)
				
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
					if boolpovt then
						boolpovt = false
						--massinfo[#massinfo+1] = "Жители ни кого не сожгли."
					else
						tour = "vote"
						massinfo[#massinfo+1] = "Жители ни за кого не проголосовали. <font color='#ee0000'>Проголосуйте повторно.</font>"
						boolpovt = true
					end
				elseif #tbl>1 and (#plNbr%2)~=0 then--если мнения разделились и количество игроков нечетное
					if nbr==2 then--если остались двое
						jeu.mort = {mort}
						boolpovt = false
					else
						if boolpovt then
							boolpovt = false
							jeu.mort = {mort}
						else
							tour = "vote"
							massinfo[#massinfo+1] = "Мнения разделились. <font color='#ee0000'>Проголосуйте повторно.</font>"
							boolpovt = true
						end
						
					end
				else
					jeu.mort = {mort}
					boolpovt = false
				end
				jeu.vote = {}
			end
		end
		--------------------------------------------------tour--------------------------------------------
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
			if tour=="night" then--ночь
				for _, pl in pairs(plNbr) do
					players[pl].isProtect = false
				end
				ui.msg(T.events[tour])
				tfm.lg.task(2, "god", tour)
			end
			if tour=="god" then--бог
				if jeu.roles[10]==1 then
					jeu.mort = {}
					local pl = ""
					for k, v in pairs(plNbr) do
						if players[v].jeu.role==10 and players[v].mort then
							pl = v
						end
					end
					point_god = point_god - 1
					if point_god >= 0 then
						ui.choserGod(pl)
						ui.msg(T.events[tour])
						tfm.lg.task(15, "god_dey", tour, true, true, idChoser, nil)
					else
						ui.changeGod(pl)
						ui.msg(T.events[tour])
						tfm.lg.task(20, "god_dey", tour, true, true, idChoser, nil)
					end
					
				end
			end
			if tour=="god_dey" then
				local txth = ""
				if jeu.mort[1]~=nil and jeu.mort[1]~="" then
					txth = tfm.lg.dead(jeu.mort[1], "<font color='"..color_roles[10].."'>Бог</font> убил "..jeu.mort[1].." ,он(а) был ".."<font color='"..color_roles[players[jeu.mort[1]].jeu.role].."'>"..roles[players[jeu.mort[1]].jeu.role].."</font>")
				elseif bool_die_god then
					
					bool_die_god = false
					
					if jeu.roles[10]==1 then
						local pl = ""
						for k, v in pairs(plNbr) do
							if players[v].jeu.role==10 and players[v].mort then
								pl = v
							end
						end
						if pl~="" then
							txth = tfm.lg.dead(pl, "Умер <font color='"..color_roles[10].."'>бог</font>:"..pl)
							for k, v in pairs(plNbr) do
								if v==pl then
									table.remove(plNbr, k)
									break
								end
							end
							local name = p_stakan
							table.insert(plNbr, name)
							jeu.roles[10] = jeu.roles[10] + 1
							players[name].jeu = {}
							players[name].jeu.role = 10
							players[name].isPlaying = true
							players[name].mort = true
							tfm.exec.removePhysicObject(2)
							local objectif = "Убей всех оборотней!"
							ui.role(name, roles[10], objectif)
							point_god = point_god_start
							txth = txth.."\nСменился <font color='"..color_roles[10].."'>бог</font>!"
						end
						
						
					end
				elseif mouse_choose_vos ~= "" then
					if isContainsMap(players, mouse_choose_vos) and players[mouse_choose_vos].isPlaying==true and players[mouse_choose_vos].mort == true then
						txth = "<font color='"..color_roles[10].."'>Бог</font> попытался воскресить "..mouse_choose_vos.."! У него есть уже роль и он не мертв."
					else--если не в игре или умер
						
						ran = 2
						repeat
							ran = math.random(1,10)
							
						until (ran==2 or ran==3 or jeu.roles[ran]==0)
						
						for k, v in pairs(plNbr) do
							if v==mouse_choose_vos then
								table.remove(plNbr, k)
								break
							end
						end
						table.insert(plNbr, mouse_choose_vos)
						jeu.roles[ran] = jeu.roles[ran] + 1
						players[mouse_choose_vos].jeu = {}
						players[mouse_choose_vos].jeu.role = ran
						players[mouse_choose_vos].isPlaying = true
						players[mouse_choose_vos].mort = true
						tfm.exec.removePhysicObject(1)
						tfm.exec.removePhysicObject(0)
						local objectif = "Убей всех оборотней!"
						if ran==2 then
							objectif = "Убей всех жителей деревни!"
						end
						tfm.exec.respawnPlayer(mouse_choose_vos)
						ui.role(mouse_choose_vos, roles[ran], objectif)
						txth = "<font color='"..color_roles[10].."'>Бог</font> воскресил "..mouse_choose_vos.."!"
						
					end
					mouse_choose_vos = ""
				else
					txth = "<font color='"..color_roles[10].."'>Бог</font> не выбрал действие."
				end
				ui.msg(txth)
				massinfo[#massinfo+1] = txth
				tfm.lg.task(10, tfm.lg.win() and "win" or "thief", tour, true, true, idChoser, nil)
				
			end
			if tour=="thief" then--вор
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
			if tour=="cupid" then--купидон
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
			if tour=="lovers" then--показать влюбленных
				ui.removeTextArea(idLovers, nil)
				for i=1, 2 do
					ui.addTextArea(idLovers, "<font size='12' color='#FF1493'>Твоя любовь: "..jeu.amour[i], jeu.amour[i==1 and 2 or 1], 10, 110, nil, 20, 0x000001, 0xFFFFFF, transparence, true)
				end
				ui.msg(T.events[tour])
				tfm.lg.task(10, "daily", tour, true)
			end
			if tour=="daily" then--день
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
			if tour=="werewolf" then--голосование оборотни
				jeu.mort = {}
				speak = true
				local col = 10
				for k, v in pairs(plNbr) do
					players[v].vote = nil
					if players[v].jeu.role==2 and players[v].mort then
						col = col + 5
					end
				end
				
				if col > 30 then
					col = 30
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
					else
						ui.removeTextArea(idChat, v)
					end
					
				end
				ui.msg(T.events[tour])
				tfm.lg.task(col, "witch", tour, true, true, idChoser)
			end
			if tour=="witch" then--ведьма голосует
				if jeu.roles[4]==1 then
					for k, v in pairs(plNbr) do
						if players[v].jeu.role==4 then
							if jeu.mort[1]~=nil and players[v].rez==nil then
								--ui.addPopup(idChoser, 1, "Хочешь ли ты вернуть к жизни "..jeu.mort[1].."?", v, 350, 175+400, 200, false)
								
								ui.addTextArea(-66, "<p align='center'>Хочешь ли ты вернуть к жизни "..jeu.mort[1].."?\n".."<a href='event:yesWitch'>yes".." ".."<a href='event:noWitch'>no", v, 300, 175, 200, 70, 1, 0x0000ff, 0.9,true)
							elseif players[v].kill==nil then
								--ui.addPopup(idTimer, 1, "Хочешь убить кого-то?", v, 350, 175+400, 200, false)
								ui.addTextArea(-66, "<p align='center'>Хочешь убить кого-то?\n".."<a href='event:yesWitchDie'>yes".." ".."<a href='event:noWitchDie'>no", v, 300, 175, 200, 70, 1, 0x0000ff, 0.9,true)
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
				local col = 5
				for k, v in pairs(plNbr) do
					players[v].vote = nil
					col = col + 5
				end
				if col > 30 then
					col = 30
				end
				
				local txt = "Выберите кого сжечь:\n"
				local fontsize = fontxSize
				if countmapa(plNbr)>maxCountfontxSize then
					fontsize = fontxSizeMin
					print("fontsize")
				end
				for k, v in pairs(plNbr) do
					if players[v].mort then
						local tf = string.format("<font size='"..fontsize.."px'>".."<a href='event:vote%s'>%s</a>(%d)→%s\n".."</font>", v, v, jeu.vote[v] and jeu.vote[v] or 0, "никто")
						jeu.txtVote[v] = tf
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
				tfm.lg.task(col, "bucher", tour, true, true, idChoser)
			end
			if tour=="dead" then--попробывать смерть
				local txt, hunter = "Деревня просыпается, "--hunter==nil
				if jeu.mort==nil or ressu or jeu.mort[1]==nil or jeu.mort=={} then
					txt = txt.."<font  color='"..color_roles[2].."'>".."без жертв</font>!"
					ressu = false
					ui.msg(txt)
					massinfo[#massinfo+1] = txt
					tfm.lg.task(15, tfm.lg.win() and "win" or "vote", tour)
				else
					for k, v in pairs(jeu.mort) do
						if (not players[v].isProtect) then
							txt, hunter = tfm.lg.dead(v, txt.."без <ROSE>"..v.."</ROSE> ,он(а) был ".."<font  color='"..color_roles[players[v].jeu.role].."'>"..roles[players[v].jeu.role].."</font>!!")--if v==hunter then hunter=true
							
							tfm.exec.movePlayer(v,tp_player[1][1],tp_player[1][2],false,0,0,false)
						end
					end
					jeu.mort = {}
					ui.msg(txt)
					massinfo[#massinfo+1] = txt
					if hunter then
						tfm.lg.task(15, tfm.lg.win() and "win" or "hunter", "mort")
					else--==nil
						tfm.lg.task(15, tfm.lg.win() and "win" or "vote", tour)
					end
				end
			end
			if tour=="bucher" then
				local txt, hunter = "Жители деревни сожгли "
				if jeu.mort[1]==nil then
					massinfo[#massinfo+1] = "Никто не идет на костер !"
					txt = "Никто не идет на костер !"
					ui.msg(txt)
					tfm.lg.task(10, tfm.lg.win() and "win" or "night", tour)
				else
					for k, v in pairs(jeu.mort) do
						txt, hunter = tfm.lg.dead(v, tostring(txt).."<ROSE>"..v.."</ROSE> ,он(а) был ".."<font  color='"..color_roles[players[v].jeu.role].."'>"..tostring(roles[players[v].jeu.role]).."</font>!!")
						tfm.exec.movePlayer(v,tp_player[2][1],tp_player[2][2],false,0,0,false)
					end
					jeu.mort = {}
					ui.msg(txt)
					massinfo[#massinfo+1] = txt
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
					massinfo[#massinfo+1] = txt
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
				zap = false
            tfm.exec.removePhysicObject(0)
            tfm.exec.removePhysicObject(1)
				massinfo[#massinfo+1] = "<font color='"..colorInfor[5].."'>".."---------WIN----------".."</font>"
				massinfo[#massinfo+1] = txt
				main()
			end
			if tour=="hunter" then--охотник
				local txt, pl = "Выбери мышь, которого хочешь убить:"
				for k, v in pairs(plNbr) do
					if players[v].jeu.role==6 then
						pl = v
					elseif players[v].mort then
						txt = txt.."\n<a href='event:hunt"..v.."'>"..v.."</a>"
					end
				end
				ui.choser(txt, pl)
				ui.msg("<font color='"..color_roles[6].."'>".."Охотник</font>, в своих последних вздохах, стреляет в мышь по своему выбору!")
				tfm.lg.task(15, "deadHunt", lastTour, true, true, idChoser, pl)
			end
			if tour=="deadHunt" then
				if jeu.mort[1]==nil then
					ui.msg("<font color='"..color_roles[6].."'>"..name.."</font>".." ни в кого не стрелял")
					massinfo[#massinfo+1] = "<font color='"..color_roles[6].."'>"..name.."</font>".." ни в кого не стрелял"
				else
					local txth = tfm.lg.dead(jeu.mort[1], "<font color='"..color_roles[6].."'>"..name.."</font>".." выстрелил "..jeu.mort[1].." ,он(а) был ".."<font color='"..color_roles[players[jeu.mort[1]].jeu.role].."'>"..roles[players[jeu.mort[1]].jeu.role].."</font>")
					ui.msg(txth)
					massinfo[#massinfo+1] = txth
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





function pokaz_sostav()
	local stringinfoplus = ""
	
	for i=1, 5 do
		if jeu.roles~=nil and jeu.roles~="" and jeu.roles[i]~=nil then
		stringinfoplus = stringinfoplus.."<font color='"..color_roles[i].."'>"..roles[i]..": "..jeu.roles[i].."</font>\n"
		else
		stringinfoplus = stringinfoplus.."<font color='"..color_roles[i].."'>"..roles[i]..": ".."-".."</font>\n"
		end
	end
	ui.addTextArea(-62100, stringinfoplus, nil, 970-smesh, 720, 110, nil, 0x000001, 0xFFFFFF, 0.7, false)
	local stringinfoplus = ""
	for i=6, #roles do
		if jeu.roles~=nil and jeu.roles~="" and jeu.roles[i]~=nil then
		stringinfoplus = stringinfoplus.."<font color='"..color_roles[i].."'>"..roles[i]..": "..jeu.roles[i].."</font>\n"
		else
		stringinfoplus = stringinfoplus.."<font color='"..color_roles[i].."'>"..roles[i]..": ".."-".."</font>\n"
		end
	end
	ui.addTextArea(-62200, stringinfoplus, nil, 1100-smesh, 720, 110, nil, 0x000001, 0xFFFFFF, 0.7, false)
	
	
end

--показывает информацию
function messageinfo(pl)
	
	pokaz_sostav()
	
	local stringinfo = ""
	
	for i=1, countmapa(massinfo) do
		if i<5 then
			stringinfo = stringinfo..massinfo[countmapa(massinfo)-i+1]
			if i <= countmapa(massinfo)-1 then
				stringinfo = stringinfo.."<br>"
			end
		end
	end
	
	
	local stringinfoplus = ""
		
	for i=1, countmapa(massinfo) do
		if i<21 then
			stringinfoplus = stringinfoplus..massinfo[countmapa(massinfo)-i+1]
			if i <= countmapa(massinfo)-1 then
				stringinfoplus = stringinfoplus.."<br>"
			end
		end
	end
	if pl ~= nil then
		ui.addTextArea(-57000, stringinfo, pl, 500-smesh, 720, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
		ui.addTextArea(-57100, "<a href='event:plusinfo'>+", pl, 470-smesh, 720, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
		
		for p, val in pairs(massinfoplus) do
			ui.addTextArea(-57000, stringinfoplus, p, 500-smesh, 480, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
			ui.addTextArea(-57100, "<a href='event:plusinfom'>-", p, 470-smesh, 480, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
		end
		return
	end
	
	ui.addTextArea(-57000, stringinfo, nil, 500-smesh, 720, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
	ui.addTextArea(-57100, "<a href='event:plusinfo'>+", nil, 470-smesh, 720, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
	
	for p, val in pairs(massinfoplus) do
		ui.addTextArea(-57000, stringinfoplus, p, 500-smesh, 480, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
		ui.addTextArea(-57100, "<a href='event:plusinfom'>-", p, 470-smesh, 480, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
	end
	
end

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
ui.addTextArea(-58100, "<a href='event:adminpanel'>Admin panel", adm, 320-smesh, 720, 100, nil, 0x000001, 0xFFFFFF, 0.7, false)
