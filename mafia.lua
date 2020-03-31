---------------------- PROPERTIES ----------------------
--adm = "<admin nickname with hash>"
adm = "Deff83#0000"
per_kill_virus = 25          -------------in %
per_kill_doctor = 30        -------------in %
random_event_chance_start = 40   -------------in %
next_day_delay = 30 --- in seconds
new_years = false --- true for Christmas decoration
bool_animeska_maps = false ---maps of Animeska6#0000
bool_post_get = true --add left mouse
------------------ ADVANCED PROPERTIES -----------------
-- WARNING
-- If automatic sort is on, mafia, police, villager list and the doctor field MUST BE EMPTY.
-- Recommended to use automatic sort if you can.
automatic_sort = true
mafia_list = {}
police_list = {}
villager_list = {}
doctor = ""
doctor_count = 0
random_event_chance = random_event_chance_start

die_virus = 0
die_doctor = 0
changeboolg = true

--------------------- DO NOT TOUCH ---------------------
--------------------- GAME  STATES ---------------------
infected = {}
criminals = {}
hospital = {}
ignormice = {} ---------security kill
rolewin = {}
stringwin = ""

massinfo = {}
massinfoplus = {}-----mouseinfo plus

math.randomseed(os.time())
-- Screen size 800x400
users = {}
start = false
viselebool = false
kill = 0
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame("@7544429")
tfm.exec.setGameTime(0);

maps = {"@7542886",--DAY
        "@7544426",--EVENING
        "@7544429",--NIGHT
        "@7544428"}--MORNING
if new_years then
	maps = {"@7548278", "@7548281", "@7548283", "@7548280"}
end

if bool_animeska_maps then
	maps = {"@7696886", "@7696889", "@7696890", "@7696874"}
end

time = 0
day_cycle = 1
day = 1

for nick in pairs(tfm.get.room.playerList) do
    tfm.exec.setPlayerScore(nick,0,false)
end


ui.addTextArea(-1, "<p align='center'> <a href='event:start'>Запустить!", adm, 120, 350, 100, 20, 1, 0x00ff00, 0.7,true)
ui.addTextArea(-2, "<p align='center'> <a href='event:game'>Участвовать", nil, 10, 350, 100, 20, 1, 0xffffff, 0.7,true)
ui.addTextArea(-65, "<p align='center'>  Конкурс \"Мафия\"!", nil, 10, 27, 700, 20, 1, 0x0000ff, 0.7,true)
ui.addTextArea(-66, "<a href='event:help'>help", nil, 725, 27, 50, 20, 1, 0x0000ff, 0.7,true)

tfm.exec.addPhysicObject(0, 390, 650, {type=10, width=20, height=120})
  tfm.exec.addPhysicObject(1, 390, 510, {type=0, width=20, height=150})


-----rule

function show_rule(pl)
	ui.addPopup(-10000, 0, "<p align='center'><font size='40px' color='#ffff00'>Конкурс \"Мафия\"</font><br><font size='14px'><font color='#00ff00'>авторы Deff83#0000 и Ilyamikheev#4068</font><br><font color='red'>Мафия</font> может заразить мышку, и при попадании в больницу вечером делают укол который может вас вылечить или убить с вероятностью ".. per_kill_doctor .."%, при этом <font color='#ff0000'>зараженный</font> каждое время суток может умереть с вероятностью ".. per_kill_virus .."%. <br><font color='#ffffff'>Доктор</font> утром получает возможность лечить любого игрока, кроме себя<br><font color='#0000ff'>Полиция</font> может посадить одного из участников в тюрьму - и при <br>достижении количества <font color='#ff0000'>заключенных</font> равному или большему чем количество <font color='#ff0000'>мафии</font> - наступает утро казни, где народ выбирает кого казнить, остальные не выбранные будут помилованы. Цель <font color='#ff0000'>мафии</font> - убить <font color='#00ff00'>жителей</font>, <font color='#0000ff'>полицейских</font> и доктора. <font color='#0000ff'>Полицейские</font> должны задерживать <font color='#ff0000'>мафию</font>. Доктор лечить больных смертельным вирусом. <font color='#00ff00'>Жители</font> просто должны выжить.<br>При наступлении дня голосования - <font color='#00ff00'>все игроки</font> (в том числе и умершие) могут голосовать или за то что посадить кого-то (<font color='#0000ff'>polise</font>), или заразить (<font color='#ff0000'>mafia</font>).<br>В случае если мафия вся умрет повышается процент дневного события до <font color='#ffaa00'>100%</font> (Эпидемия, Амнистия или Голосование) </font></p>", pl, 100, 50, 600, true)
end
show_rule(nil)

function countElements(table)
    count = 0
    for n, __ in pairs(table) do
        if not isContains(ignormice, n) then
            count = count + 1
        end
    end
    return count
end

function getAllPlayers()
    result = {}
    for n, v in pairs(villager_list) do
        result[n] = v
    end
    for n, v in pairs(police_list) do
        result[n] = v
    end
    for n, v in pairs(mafia_list) do
        result[n] = v
    end
    result[doctor] = {}
    return result
end

function isContains(table, element)
    for p, val in pairs(table) do
         if p == element then
        
            return true
        end
    end
    return false
end

function string.split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function string.starts(str, start)
   return str:sub(1, #start) == start
end

function eventNewGame()
------Wall--------------
  ------------------------
    -- Moved to the eventLoop and changeMap
    for nick in pairs(tfm.get.room.playerList) do
        tfm.exec.setPlayerScore(nick,0,false)
    end
end

function changeMap(map)
    users_coords = {}
	doctor_count = 0
    for p, i in pairs(tfm.get.room.playerList) do
        user = {}
        user.x = i.x
        user.y = i.y
        users_coords[p] = user
    end
    tfm.exec.newGame(map)
	
    if doctor ~= "" then
        doctor_count = 1
    else
        doctor_count = 0
    end
    for n, i in pairs(users_coords) do
       -- print(n, i.x, i.y)
        tfm.exec.movePlayer(n, i.x, i.y, false, 0, 0, true)
    end
    tfm.exec.addPhysicObject(0, 390, 650, {type=10, width=20, height=120})
    tfm.exec.addPhysicObject(1, 390, 510, {type=0, width=20, height=150})
    --tfm.exec.addPhysicObject(2, 1500, 550, {type=tfm.enum.ground.invisible, width=500, height=200})
end
-- Magic. Do not touch.
victims = {}
suspect = {}
function eventPopupAnswer(id, p, cmd)
---------------mafia choose----------------
    print(id)
	if id == -58100 then--message admin
		if cmd ~= "" then
			massinfo[#massinfo+1] = "<font color='#ff33ff'>[ADMIN]:"..cmd.."</font>"
			messageinfo(nil)
		end
	end
	
	if id == -58200 then--virus per
		if cmd ~= "" then
			if type(tonumber(cmd)) == 'number' then
				if tonumber(cmd) <= 100 and tonumber(cmd)>=0 then
					per_kill_virus = tonumber(cmd)
					massinfo[#massinfo+1] = "<font color='#ff33ff'>[ADMIN]:Изменил процент смерти от вируса: "..cmd.."%</font>"
					messageinfo(nil)
				else
					ui.addPopup(-58200, 0, "<p align='center'>введите число в диапазоне от 0 до 100", adm, 200, 200, 400, true)
				end
			else
				ui.addPopup(-58200, 0, "<p align='center'>введите число", adm, 200, 200, 400, true)
			end
			
		end
	end
	if id == -58300 then--doctor per
		if cmd ~= "" then
			if type(tonumber(cmd)) == 'number' then
				if tonumber(cmd) <= 100 and tonumber(cmd)>=0 then
					per_kill_doctor = tonumber(cmd)
					massinfo[#massinfo+1] = "<font color='#ff33ff'>[ADMIN]:Изменил процент смерти от укола: "..cmd.."%</font>"
					messageinfo(nil)
				else
					ui.addPopup(-58300, 0, "<p align='center'>введите число в диапазоне от 0 до 100", adm, 200, 200, 400, true)
				end
			else
				ui.addPopup(-58300, 0, "<p align='center'>введите число", adm, 200, 200, 400, true)
			end
		end
	end
	if id == -58400 then--event per
		if cmd ~= "" then
			if type(tonumber(cmd)) == 'number' then
				if tonumber(cmd) <= 100 and tonumber(cmd)>=0 then
					random_event_chance = tonumber(cmd)
					massinfo[#massinfo+1] = "<font color='#ff33ff'>[ADMIN]:Изменил процент вероятности дневного события: "..cmd.."%</font>"
					messageinfo(nil)
				else
					ui.addPopup(-58300, 0, "<p align='center'>введите число в диапазоне от 0 до 100", adm, 200, 200, 400, true)
				end
			else
				ui.addPopup(-58300, 0, "<p align='center'>введите число", adm, 200, 200, 400, true)
			end
		end
	end
	
	
    --if id > -3100 and id < -3000 then
    --    print(cmd)
    --    if isContains(victims, cmd) then
    --        victims[cmd] = victims[cmd] + 1
    --    else
    --        victims[cmd] = 1
    --    end
    --end
    --if id>-4200 and id<-4100 then
    --   print(cmd)
    --    if isContains(suspect, cmd) then
    --        suspect[cmd] = suspect[cmd] + 1
    --    else
    --        suspect[cmd] = 1
    --    end
    --end
    --if id==-4400 then
    --    if cmd ~= p then
    --        infected[cmd] = nil
    --    else
    --        ui.addPopup(-4400, 2, "<p align='center'>Вы не можете вылечить себя! ^_^. Введите другую мышку.</p>", p, 200, 200, 400, true)
    --    end
    --end
end
function eventNewPlayer(playerName)
    tfm.exec.respawnPlayer (playerName)
    tfm.exec.setNameColor(playerName, 0xFFFFFF)
    ui.addTextArea(-65, "<p align='center'>  Конкурс \"Мафия\"!", playerName, 10, 27, 700, 20, 1, 0x0000ff, 0.7,true)
	ui.addTextArea(-66, "<a href='event:help'>help", nil, 725, 27, 50, 20, 1, 0x0000ff, 0.7,true)
    if start then
        -- Nothing for watch is here.
		if bool_post_get then
			massinfo[#massinfo+1] = "<font color='#777777'>["..playerName.."]:".."Присоединился к игре!</font>"
		end
		ui.addPopup(-90000, 0, "<p align='center'>Вы можете участвовать тока в событии дневного голосования.", playerName, 200, 200, 400, true)
    else
    local ji = 1 
       for i, n in pairs(users) do
       ji = ji + 1
        
            ui.addTextArea(ji, "<p align='center'>" .. users[i].player, playerName, ((ji-1)%8)*100+5, math.floor((ji-1)/8)*30+100, 90, 20, 1, 1, 0.8, true)
            
        end

        ui.addTextArea(-2, "<p align='center'> <a href='event:game'>Участвовать", playerName, 120, 350, 100, 20, 1, 0xffffff, 0.7,true)
		show_rule(playerName)
    end

    tfm.exec.setPlayerScore(playerName,0,false)

    if start then
        ui.removeTextArea(-2, nil)
    end

end


function eventPlayerDied(nick)
    tfm.exec.respawnPlayer(nick)
end




function playerChoice(id, player, prompt, cancelable, showself)
    message = "<p align='center'><b>" .. prompt .. "</b><br>"
    x = 0
    for i, j in pairs(getAllPlayers()) do
        if i ~= player or showself then
            message = message .. "<a href='event:" .. i .. "'>" .. i .. " </a>"
            x = x + 1
            if x % 2 == 0 then
                message = message .. "<br>"
            else
                message = message .. "   "
            end
        end
    end
    if cancelable then
        message = message .. "<br><br><a href='event:nil'>Отмена</a>"
    end
    message = message .. "</p>"
    ui.addTextArea(id, message, player, 190, 150, 400, nil, 1, 1, 1, true)
end

viselvibr = {}

iter = 0
vote_side_polish = 0
vote_side_mafia = 0

function eventTextAreaCallback(id, p, cmd)

	if cmd == "help" then
		show_rule(p)
	end

	if cmd == "adminpanel" then
		ui.addTextArea(-58100, "<br><a href='event:adminmessage'>Написать сообщение в чат</a><br><a href='event:adminchange_per_kill_virus'>Поменять процент смерти от вируса</a><br><a href='event:adminchange_per_kill_doctor'>Поменять процент смерти от укола</a><br><a href='event:adminchange_per_event'>Поменять процент вероятности дневного события</a><br><br><a href='event:adminchange_close'>Close</a>", adm, 100, 150, 600, nil, 1, 1, 1, true)
	end
	
	if cmd == "adminmessage" then
		ui.removeTextArea(-58100, nil)
		ui.addPopup(-58100, 2, "<p align='center'>Введите сообщение!", adm, 200, 200, 400, true)
	end
	if cmd == "adminchange_per_kill_virus" then
		ui.removeTextArea(-58100, nil)
		ui.addPopup(-58200, 2, "<p align='center'>Введите значение процента смерти от вируса:", adm, 200, 200, 400, true)
	end
	if cmd == "adminchange_per_kill_doctor" then
		ui.removeTextArea(-58100, nil)
		ui.addPopup(-58300, 2, "<p align='center'>Введите значение процента смерти от укола:", adm, 200, 200, 400, true)
	end
	if cmd == "adminchange_per_event" then
		ui.removeTextArea(-58100, nil)
		ui.addPopup(-58400, 2, "<p align='center'>Введите значение процента вероятности дневного события:", adm, 200, 200, 400, true)
	end
	if cmd == "adminchange_close" then
		ui.removeTextArea(-58100, nil)
	end
	
	
	
	
	if cmd == "golos_polish" then
		ui.removeTextArea(-59000, p)
		ui.removeTextArea(-59100, p)
		if isContains(police_list, p)==false and isContains(mafia_list, p)==false then
			playerChoice(-61000+iter, p, "Выберите мафию", true, false)
		end
		iter = iter + 1
	end
	if cmd == "golos_mafia" then
		ui.removeTextArea(-59000, p)
		ui.removeTextArea(-59100, p)
		if isContains(police_list, p)==false and isContains(mafia_list, p)==false then
			playerChoice(-60000+iter, p, "Выберите жертву", true, false)
		end
		iter = iter + 1
	end
	
	
	if cmd == "plusinfo" then
		ui.removeTextArea(-57000, p)
		ui.removeTextArea(-57100, p)
		if isContains(massinfoplus, p) then
			
		else
			massinfoplus[p] = 1
		end
		messageinfo(p)
	end
	if cmd == "plusinfom" then
		ui.removeTextArea(-57000, p)
		ui.removeTextArea(-57100, p)
		if isContains(massinfoplus, p) then
			massinfoplus[p] = nil
		else
			
		end
		messageinfo(p)
	end
	
    if cmd == "nil" then
        ui.removeTextArea(id, p)
    elseif id > -3100 and id < -3000 then
        if isContains(victims, cmd) then
            victims[cmd] = victims[cmd] + 1
        else
            victims[cmd] = 1
        end
        ui.removeTextArea(id, p)
    elseif id == -4400 then
        infected[cmd] = nil
		massinfo[#massinfo+1]="[Доктор]:Вылечил "..cmd
        ui.removeTextArea(id, p)
    elseif id > -7200 and id < -7100 then
        if isContains(suspect, cmd) then
            suspect[cmd] = suspect[cmd] + 1
        else
            suspect[cmd] = 1
        end
        ui.removeTextArea(id, p)
		
	elseif id >= -60000 and id < -59900 then--golos_mafia
		if isContains(victims, cmd) then
            victims[cmd] = victims[cmd] + 1
        else
            victims[cmd] = 1
        end
		ui.removeTextArea(id, p)
		vote_side_mafia = vote_side_mafia + 1
    elseif id >= -61000 and id < -60900 then--golos_polish
		if isContains(suspect, cmd) then
            suspect[cmd] = suspect[cmd] + 1
        else
            suspect[cmd] = 1
        end
		ui.removeTextArea(id, p)
		vote_side_polish = vote_side_polish + 1
    elseif cmd == "game" then

        ui.removeTextArea(-2, p)
        local propust = true

        for i, n in pairs(users) do
            if users[i].player == p then
                propust = false
            end
        end

        if propust then
            local user = {}
            user.player = p
            users[p] = user
            local num = countElements(users)
            ui.addTextArea(num, "<p align='center'>" .. p, nil, ((num-1)%8)*100+5, math.floor((num-1)/8)*30+100, 90, 20, 1, 1, 0.8, true)
        end

    end
    if cmd == "start" then
		massinfo = {}
		random_event_chance = random_event_chance_start
		changeboolg = true
		die_virus = 0
		die_doctor = 0
        if countElements(users) < 4 and automatic_sort then
            ui.addPopup(-64, 0, "<p align='center'><font color='#ff0000'>Ошибка!</font><br>Нужно минимум четыре игрока для старта</p>", adm, 300, 200, nil, true)
           return 
        end
		
		massinfo[#massinfo+1] = "<font color='#ffff00'>START GAME</font>"
        
        ui.removeTextArea(-8, nil)

        for nick in pairs(tfm.get.room.playerList) do
            tfm.exec.setPlayerScore(nick,0,false)
        end

        start = true
        ui.removeTextArea(-1, nil)
        ui.removeTextArea(-2, nil)
        ui.removeTextArea(-8, nil)
        ui.removeTextArea(-9, nil)

        counter = 1
        for i, _ in pairs(users) do
            ui.removeTextArea(counter, nil)
            counter = counter + 1
        end
        
        if automatic_sort then
            sh_users = {}
            for i, val in pairs(users) do
                table.insert(sh_users, math.random(1, countElements(sh_users) + 1), i)
            end
            doctor = sh_users[1]
            table.remove(sh_users, 1)
            target = 0
            for _, i in pairs(sh_users) do
                if target == 0 then
                    villager_list[i] = {}
                elseif target == 1 then
                    police_list[i] = {}
                elseif target == 2 then
                    mafia_list[i] = {}
                end
                target = target + 1
                if target > 2 then
                    target = 0
                end
            end
        end
        
        ---------------------------------First Day--------------------
        changeMap(maps[1])
        ui.addTextArea(27100, "<p align='right'><font color='#00ff00'>Жители: " ..       countElements(villager_list) .. "</font><br><font color='#0000ff'>Полиция: " .. countElements(police_list) .. "</font><br><font color='#ff0000'>Мафия: " .. countElements(mafia_list) .. "</font><br>Доктора: " .. doctor_count .. "</p>", nil, 670, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true) 
        ui.updateTextArea (-65, "<p align='center'>День знакомств..." , nil )
        ---------------------------TEXT FOR MAFIA-------------------------------
        dialog_text = "Мафия:<br>"
        textwho = "<p align='center'>ваша роль<br><font size='30px' color='#ff0000'>Мафия</font><br>Ваша цель - убить всех жителей, полицейских, и доктора.<br></p>"
        for p, x in pairs(mafia_list) do
            dialog_text = dialog_text .. "<font color='#ff0000'>" .. p .. "</font><br>"
        end
        i = 0
        for p, val in pairs(mafia_list) do
        i = i+1
          ui.addTextArea(-100+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 1, true)
          ui.addTextArea(-1100+i, textwho .. "</p>", p, 210, 60, 300, nil, 0x000001, 0xFFFFFF, 1, true)
        end
        ---------------------------TEXT FOR Polis-------------------------------
        dialog_text = "Полиция:<br>"
        textwho = "<p align='center'>ваша роль<br><font size='30px' color='#0000ff'>Полицейский</font><br>Ваша цель - задержать всех членов мафии.<br></p>"
        for p, x in pairs(police_list) do
                dialog_text = dialog_text .. "<font color='#0000ff'>" .. p .. "</font><br>"
        end
        i = 0
        for p, val in pairs(police_list) do
            i = i+1
          ui.addTextArea(-200+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
          ui.addTextArea(-1200+i, textwho .. "</p>", p, 210, 60, 300, nil, 0x000001, 0xFFFFFF, 1, true)
        end
        
        ---------------------------TEXT FOR Vilige-------------------------------
         dialog_text = "Вы житель"
         textwho = "<p align='center'>ваша роль<br><font size='30px' color='#00ff00'>Мирный житель</font><br>Ваша цель - выжить в этом городе<br>"
        i = 0
        for p, val in pairs(villager_list) do
        i = i+1
          ui.addTextArea(-300+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
          ui.addTextArea(-1300+i, textwho .. "</p>", p, 210, 60, 300, nil, 0x000001, 0xFFFFFF, 1, true)
        end
        ---------------------------TEXT FOR Doctor-------------------------------
        dialog_text = "<p align='center'>ваша роль<br><font size='30px' color='#ffffff'>Доктор</font><br>Ваша цель - брать на лечение и лечить больных<br>"
        ui.addTextArea(-1400, dialog_text .. "</p>", doctor, 210, 60, 300, nil, 0x000001, 0xFFFFFF, 0.7, true)
        ui.addTextArea(-400, "Вы доктор</p>", doctor, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
    end
     if cmd == "viselitsa" then
     -----------------------------------------------------------
      for i=0, countmapa(mafia_list) do
            
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-4100-i-(x+1)*10000, p)
                end
            end
            for i=0, countmapa(police_list) do
           
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-4200-i-(x+1)*10000, p)
                end
            end
     for i=0, countmapa(villager_list) do
                ui.removeTextArea(-4300+i, p)
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-4300-i-(x+1)*10000, p)
                end
            end
            
            for x = 0, countmapa(criminals) do
                ui.removeTextArea(-4400-(x+1)*10000, p)
            end
     
        
        local viselitsa_id = math.abs(math.floor(id/10000)+1)
        print(viselitsa_id)
        for p, val in pairs(criminals) do
        if val.id == viselitsa_id then
        print(p)
            
            if isContains(viselvibr, p) then
                viselvibr[p] = viselvibr[p] + 1
            else
                viselvibr[p] = 1
            end
            end
        end
     end
     if cmd == "gotodoctor" then
    ui.removeTextArea(5100, p)
        tfm.exec.movePlayer(p,250,490,false,0,0,false)
        hospital[p] = {}
        infected[p] = nil
        tfm.exec.setNameColor(p, 0xffff00)
        
    end
end

function eventPlayerLeft(pName)
	if bool_post_get then
		massinfo[#massinfo+1] = "<font color='#777777'>["..pName.."]:".."Покинул комнату!</font>"
	end
    delplayer(pName)
    if pName == adm then

        for nick in pairs(tfm.get.room.playerList) do
            adm = nick
            if start == false then
                ui.addTextArea(-1, "<p align='center'> <a href='event:start'>Запустить!", adm, 120, 350, 100, 20, 1, 0x00ff00, 0.7,true)
            end
            return
        end
    end
end


function randomEvent()
    if math.random(0, 100) <= random_event_chance then
        event = math.random(0, 2)
		if changeboolg == false then
			event = math.random(0, 6)
			if event > 2 then
				event = 2
			end
		end
        if event == 0 then
            all_users = {}
            for p, _ in pairs(mafia_list) do
                table.insert(all_users, p)
            end
            for p, _ in pairs(villager_list) do
                table.insert(all_users, p)
            end
            for p, _ in pairs(police_list) do
                table.insert(all_users, p)
            end
            table.insert(all_users, doctor)
            for _, p in pairs(all_users) do
                if not (isContains(hospital, p) or isContains(criminals, p)) then
                tfm.exec.setNameColor(p, 0xff0000)
                    infected[p] = 1
                end
            end
            ui.updateTextArea (-65, "<p align='center'><font color='#ff0000'>День эпидемии! Все жители города заражены смертельным вирусом.</font></p>" , nil )
			massinfo[#massinfo+1] = "<font color='#ff0000'>ЭПИДЕМИЯ!!! все заражены</font>"
        elseif event == 1 then
            criminals = {}
            tfm.exec.removePhysicObject(0)
            ui.updateTextArea (-65, "<p align='center'><font color='#ffff00'>День амнистии! Всех заключенных выпустили.</font></p>" , nil )
			massinfo[#massinfo+1] = "<font color='#ffff00'>АМНИСТИЯ!!! выходите из тюрьмы для избежания казни.</font>"
		elseif event == 2 then
            ui.updateTextArea (-65, "<p align='center'><font color='#ffff00'>День голосования! Выберите сторону и проголосуйте.</font></p>" , nil )
			massinfo[#massinfo+1] = "<font color='#ffff00'>День голосования! Выберите сторону и проголосуйте.</font>"
			--------------------------------------------------------------------------------------------
			ui.addTextArea(-59000, "<font color='#ff0000'><a href='event:golos_mafia'>Mafia</a></font>", nil, 1150, 720, 150, nil, 0x000001, 0xFFFFFF, 0.7, false)
			ui.addTextArea(-59100, "<font color='#0000ff'><a href='event:golos_polish'>Police</a></font>", nil, 1150, 750, 150, nil, 0x000001, 0xFFFFFF, 0.7, false)
			
		end
    else
        ui.updateTextArea (-65, "<p align='center'>День...</p>" , nil )
    end
end

obnovmessageinfo = 2*1

function eventLoop()
    if not start then
        return
    end
    time = time + 0.5
    for p, val in pairs(criminals) do
       if isContains(val, "lock_position") then
            tfm.exec.movePlayer(p, val.lock_position[1], val.lock_position[2], false, 0, 0, false)
           tfm.exec.addPhysicObject(val.lock_platform_ids[1], val.lock_position[1]-15, val.lock_position[2], {width=5, height=50, friction=100, type=tfm.enum.ground.invisible})
           tfm.exec.addPhysicObject(val.lock_platform_ids[2], val.lock_position[1]+15, val.lock_position[2], {width=5, height=50, friction=100, type=tfm.enum.ground.invisible})
           tfm.exec.addPhysicObject(val.lock_platform_ids[3], val.lock_position[1], val.lock_position[2]+15, {width=50, height=5, friction=100, type=tfm.enum.ground.invisible})
           tfm.exec.addPhysicObject(val.lock_platform_ids[4], val.lock_position[1], val.lock_position[2]-15, {width=50, height=5, friction=100, type=tfm.enum.ground.invisible})
       end
    end
    if countmapa(ignormice) > 0 then
    removeareax()
          for p, _ in pairs(ignormice) do
              delplayer(p)
        end
        ignormice = {}
        addareatext()
        end
		
	if time % obnovmessageinfo == 0 then
		messageinfo(nil)
	end
		
		
    if time % next_day_delay == 0 then
        day_cycle = day_cycle + 1
        if day_cycle > 4 then
            day_cycle = 1
        end
        changeMap(maps[day_cycle])
        tfm.exec.addPhysicObject(0, 390, 650, {type=10, width=20, height=120})
  tfm.exec.addPhysicObject(1, 390, 510, {type=0, width=20, height=150})
  --tfm.exec.addPhysicObject(2, 1500, 550, {type=tfm.enum.ground.invisible, width=500, height=200})
        ------------------------------DAY CHANGE---------------------------
        for i=0, countmapa(mafia_list) do
            ui.removeTextArea(-3100+i, nil)    
        end   
        for i=0, countmapa(police_list) do
            ui.removeTextArea(-7200+i, nil)    
        end
        ui.removeTextArea(-4400, nil)             
        -------------infected---------
        for p, _ in pairs(tfm.get.room.playerList) do
            tfm.exec.setNameColor(p, 0xffffff)
        end
        for p, _ in pairs(mafia_list) do
            tfm.exec.setNameColor(p, 0xffff00)
        end
        for p, _ in pairs(villager_list) do
            tfm.exec.setNameColor(p, 0xffff00)
        end
        for p, _ in pairs(police_list) do
            tfm.exec.setNameColor(p, 0xffff00)
        end
        tfm.exec.setNameColor(doctor, 0xffff00)
        
        for p, val in pairs(infected) do
            tfm.exec.setNameColor(p, 0xff0000)
            local booldie = killpers(per_kill_virus, p, "Вы умерли от смертельного вируса", "no")
			if booldie then
				die_virus = die_virus + 1
			end
        end
        ui.addTextArea(5100, "<a href='event:gotodoctor'>Вы заражены смертельным вирусом и можете умереть.<br> Нажмите сюда, чтобы проследовать в больницу. Или ждите когда доктор вылечит.</p>", nil, 210, 60, 400, nil, 0x000001, 0xFFFFFF, 0.7, true)
        for nick in pairs(tfm.get.room.playerList) do
                if (not isContains(infected, nick)) or isContains(criminals, nick)  then
                    ui.removeTextArea(5100, nick)
                end
        end
		
		ui.addTextArea(-58100, "<a href='event:adminpanel'>Admin panel", adm, 320, 720, 100, nil, 0x000001, 0xFFFFFF, 0.7, false)
		
        if day_cycle == 0 then
            
            ----------------------------------------------DAY--------------------------
        elseif day_cycle == 1 then
            -- Day indicator line was moved to the bottom of the day
            --ui.addPopup(-4400, 0, "<p align='center'>Уже наступил день!", doctor, -200, -200, 400, true)
            ui.removeTextArea(-4400, doctor)
            for i=0, countmapa(mafia_list) do
            ui.removeTextArea(-4100+i, nil)
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-4100-i-(x+1)*10000, nil)
                end
            end
            for i=0, countmapa(police_list) do
            ui.removeTextArea(-4200+i, nil)
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-7200-i-(x+1)*10000, nil)
                end
            end
            
            local i = 0
            for p, val in pairs(police_list) do
            i = i + 1
                --ui.addPopup(-4200+i, 0, "<p align='center'>Уже наступил день!", p, -200, -200, 400, true)
                ui.removeTextArea(-4200+i, nil)
            end
            for i=0, countmapa(villager_list) do
                ui.removeTextArea(-4300+i, nil)
                for x = 0, countmapa(criminals) do
                    ui.removeTextArea(-4300-i-(x+1)*10000, nil)
                end
            end
            ui.removeTextArea(-4400, nil)
            for x = 0, countmapa(criminals) do
                ui.removeTextArea(-4400-(x+1)*10000, nil)
            end
             ----------viselitsa------------
             if viselebool  then
                local viselvibrkill = ""
                local viselvibrkill_count = 0
                for p, val in pairs(viselvibr) do
                    print(p)
                    if val > viselvibrkill_count then
                        viselvibrkill = p
                        viselvibrkill_count = val
                    end
                end
                if viselvibrkill ~= "" then
                    killpers(100, viselvibrkill, "Путем городского голосования, было принято решение вас казнить. Вы умерли.", "no")
                end
				local pomil = ""
				for p, val in pairs(criminals) do
                    if p ~= viselvibrkill then
						pomil = pomil..""..p..", "
                    end
                end
				if pomil~="" then
					massinfo[#massinfo+1] = "[Игроки]: помиловали "..pomil
				end
				
                criminals = {}
                viselvibr = {}
                viselebool = false
            end
            suspect_fun(nil)
            for n, _ in pairs(criminals) do
                ui.removeTextArea(5100, n)
            end
            randomEvent()
            --------------------------------------EVENING-------------------------
        elseif day_cycle == 2 then
        ui.updateTextArea (-65, "<p align='center'>  Вечер... " , nil )
           
            for i=0, countmapa(mafia_list) do
                ui.removeTextArea(-1100+i, nil)
            end
            for i=0, countmapa(police_list) do
                ui.removeTextArea(-1200+i, nil)
            end
            for i=0, countmapa(villager_list) do
                ui.removeTextArea(-1300+i, nil)
            end
            ui.removeTextArea(-1400, nil)
			ui.removeTextArea(-59000, p)
			ui.removeTextArea(-59100, p)
			
			for i=0, iter do
				ui.removeTextArea(-60000+i, nil)
				ui.removeTextArea(-61000+i, nil)
			end
			
			if vote_side_mafia > vote_side_polish then
				-----------------------------------------------------------------------------------------------------------------------------------------------
				victim_fun("vote")
				victims = {}
				suspect = {}
			else
				suspect_fun("vote")
				victims = {}
				suspect = {}
			end
			vote_side_mafia = 0
			vote_side_polish = 0
			
			for p, val in pairs(hospital) do
                  tfm.exec.movePlayer(p,700,700,false,0,0,false)
                  local booldie = killpers(per_kill_doctor, p, "Укол оказался смертельным, вы умерли", "Вас вылечили!")
					if booldie then
						die_doctor = die_doctor + 1
					end
            end
            hospital = {}
            for n, v in pairs(tfm.get.room.playerList) do
                if isContains(getAllPlayers(), n) and v.x < 400 and v.y > 590 and not isContains(criminals, n) then
                    criminals[n] = {}
                    ui.addPopup(-9000, 0, "<p align='center'>Вас посадили в тюрьму!", n, 200, 200, 400, true)
                    tfm.exec.movePlayer(n,250,650,false,0,0,false)
                
                end
            end
            ----------------------------------NIGHT---------------------------------
        elseif day_cycle == 3 then
            ui.updateTextArea (-65, "<p align='center'>Ночь. Город засыпает, просыпается мафия..." , nil )
           for i=0, countmapa(mafia_list) do
                ui.removeTextArea(-2100+i, nil)
            end
            for i=0, countmapa(police_list) do
                ui.removeTextArea(-2200+i, nil)
            end
            for i=0, countmapa(villager_list) do
                ui.removeTextArea(-2300+i, nil)
            end
            ui.removeTextArea(-2400, nil)
            --if countmapa(mafia_list) > countmapa(criminals) then
                local i = 0
                for p, val in pairs(mafia_list) do
                i = i +1
                if isContains(criminals, p) == false then
                        if isContains(hospital, p) == false then
                if isContains(ignormice, p)==false then
                    --ui.addPopup(-3100+i, 2, "<p align='center'>Введите жертву! (ник игрока вместе с хэштегом)", p, 200, 200, 400, true)
                    playerChoice(-3100+i, p, "Выберите жертву!", true, false)
                    end
                    end
                end
                end
            --else
            --end
        
            ----------------------------MORNING----------------------------------
        elseif day_cycle == 4 then
        print(day)
        day = day + 1
            ui.updateTextArea (-65, "<p align='center'>Утро..." , nil )
            i = 0
            for p, val in pairs(mafia_list) do
            i = i + 1
                --ui.addPopup(-3100+i, 0, "<p align='center'>Уже наступило утро!", p, -200, -200, 400, true)
                ui.removeTextArea(-3100+i, nil)
            end
            for i=0, countmapa(police_list) do
                ui.removeTextArea(-3200+i, nil)
            end
            for i=0, countmapa(villager_list) do
                ui.removeTextArea(-3300+i, nil)
            end
            ui.removeTextArea(-3400, nil)
            victim_fun(nil)
              if isContains(criminals, doctor) == false then
                        if isContains(hospital, doctor) == false then
                if isContains(ignormice, doctor)==false then
            --ui.addPopup(-4400, 2, "<p align='center'>Введите, кого вылечить! (Ник игрока вместе с хэштегом)</p>", doctor, 200, 200, 400, true)
            playerChoice(-4400, doctor, "Выберите, кого вылечить!", true, false)
            end
            end
            end
            ------------chose police--------------
            print(countmapa(mafia_list))
            print(countmapa(criminals))
            if countmapa(mafia_list) > countmapa(criminals) and countmapa(criminals)<=6 then
                local i = 0
                for p, val in pairs(police_list) do
                    i = i +1
                    if isContains(criminals, p) == false then
                             if isContains(hospital, p) == false then
                     if isContains(ignormice, p)==false then
                        --ui.addPopup(-4200+i, 2, "<p align='center'>Введите преступника! (Ник игрока вместе с хэштегом)", p, 200, 200, 400, true)
                        playerChoice(-7200+i, p, "Выберите, кого арестовать!", true, false)
                        end
                        end
                    end
                end
            elseif countmapa(mafia_list) == 0 and countmapa(criminals) == 0 then
				local i = 0
                for p, val in pairs(police_list) do
                    i = i +1
                    if isContains(criminals, p) == false then
                             if isContains(hospital, p) == false then
                     if isContains(ignormice, p)==false then
                        --ui.addPopup(-4200+i, 2, "<p align='center'>Введите преступника! (Ник игрока вместе с хэштегом)", p, 200, 200, 400, true)
                        playerChoice(-7200+i, p, "Выберите, кого арестовать!", true, false)
                        end
                        end
                    end
                end
			else
            if countmapa(criminals)>0 then
            viselebool = true
                ui.updateTextArea (-65, "<p align='center'>Утро казни..." , nil )
                local i=0
                for p, val in pairs(criminals) do
                
                    i=i+1
                    
                    local lock = {}
                    
                    
                    lock.lock_platform_ids = {600 + i, 650+i, -600-i, -650-i}
                    tfm.exec.movePlayer(p,1250+50*i,575,false,0,0,false)
                    lock.lock_position = {1250+50*i, 575}
                    lock.id = i
                    criminals[p] = lock
                    ----------------------------Watch button--------------------
                    local j = 0
                    for p, val in pairs(mafia_list) do
                    
                        if isContains(criminals, p) == false  then
                        
                            if isContains(hospital, p) == false then
                            j = j +1
                            ui.addTextArea(-4100-j-i*10000, "<a href='event:viselitsa'>"..i .. "</p>", p, 1250+50*i, 635, 10, nil, 0x000001, 0xFFFFFF, 1, false)
                            
                            end
                        end
                    end
                    local j = 0

                    for p, val in pairs(police_list) do
                        
                        if isContains(criminals, p) == false then
                        
                        
                        if isContains(hospital, p) == false then
                            j = j +1
                            ui.addTextArea(-4200-j-i*10000, "<a href='event:viselitsa'>"..i .. "</p>", p, 1250+50*i, 635, 10,  nil, 0x000001, 0xFFFFFF, 1, false)
                            end
                        end
                        
                    end
    
                    local j = 0
                    for p, val in pairs(villager_list) do
                        if isContains(criminals, p) == false then
                        
                        if isContains(hospital, p) == false then
                            j = j +1
                            ui.addTextArea(-4300-j-i*10000, "<a href='event:viselitsa'>"..i .. "</p>", p, 1250+50*i, 635, 10,  nil, 0x000001, 0xFFFFFF, 1, false)
                            end
                        end
                    end
                    
                        if isContains(criminals, doctor) == false then
                        
                        if isContains(hospital, doctor) == false then
                            ui.addTextArea(-4400-i*10000, "<a href='event:viselitsa'>"..i .. "</p>", doctor, 1250+50*i, 635, 10,  nil, 0x000001, 0xFFFFFF, 1, false)
                            end
                        end
                    
                end
            end
            end
        end
        ui.addTextArea(27100, "<p align='right'><font color='#00ff00'>Жители: " ..       countElements(villager_list) .. "</font><br><font color='#0000ff'>Полиция: " .. countElements(police_list) .. "</font><br><font color='#ff0000'>Мафия: " .. countElements(mafia_list) .. "</font><br>Доктора: " .. doctor_count .. "</p>", nil, 690, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true) 
          rolewin = {}
          summcount = countElements(villager_list) + countElements(police_list) + countElements(mafia_list) + doctor_count 
          if countElements(villager_list) == summcount then
              rolewin = villager_list
              stringwin = "Выиграли мирные жители!"
              winplayer()
          end
          if countElements(police_list) == summcount then
              rolewin = police_list
              stringwin = "Выиграла полиция!"
              winplayer()
          end
          if countElements(mafia_list) == summcount then
              rolewin = mafia_list
              stringwin = "Выиграла мафия!"
              winplayer()
          end
          if doctor_count == summcount then
              rolewin[doctor] = 1
              stringwin = "Выиграл доктор!"
              winplayer()
          end
		  if summcount == 0 then
              stringwin = "Все умерли"
              winplayer()
		  end
  end
end

function victim_fun(who)
	----------victim------------
	local victim = ""
	local victim_count = 0
	for p, val in pairs(victims) do
	print(p)
		if val > victim_count then
			victim = p
		end
	end
	victims = {}
	if isContains(users, victim) then
	-----------------------if mafia chose infected------------------
		if isContains(hospital, victim) == false then
			if isContains(infected, victim) and isContains(criminals, victim)==false then
				tfm.exec.movePlayer(victim,250,490,false,0,0,false)
				hospital[victim] = {}
				infected[victim] = nil
				tfm.exec.setNameColor(victim, 0xffffff)
				if who == "vote" then
					ui.addPopup(-9100, 0, "<p align='center'>Вы зараженный и на вас напали Жители - вы отправляетесь в больницу !</p>", victim, 200, 200, 400, true)
					massinfo[#massinfo+1] = "["..victim.."]:".."Вы зараженный и на вас напала Жители - вы отправляетесь в больницу !"
				else
					ui.addPopup(-9100, 0, "<p align='center'>Вы зараженный и на вас напала мафия - вы отправляетесь в больницу !</p>", victim, 200, 200, 400, true)
					massinfo[#massinfo+1] = "["..victim.."]:".."Вы зараженный и на вас напала мафия - вы отправляетесь в больницу !"
				end
			else
				infected[victim] = 1
				if who == "vote" then
					massinfo[#massinfo+1] = "["..victim.."]:".."На вас напали Жители, вы заражен!"
				else
					massinfo[#massinfo+1] = "["..victim.."]:".."На вас напала мафия, вы заражен!"
				end
			end
		else
			massinfo[#massinfo+1] = "[Доктор]:Попытка заразить неудачна, жертва в больнице!"
		end
	end
end

function suspect_fun(who)
	----------criminal------------
	local criminal = ""
	local criminal_count = 0
	for p, val in pairs(suspect) do
	print(p)
		if val > criminal_count then
			criminal = p
		end
	end
	suspect = {}
	if isContains(users, criminal) then
	-----------------------crim vibr------------------
		if isContains(criminals, criminal) then
		else
			local lock = {}
			
			
			lock.lock_platform_ids = nil
		   
			lock.lock_position = nil
			lock.id = 0
			criminals[criminal] = lock
			if who == "vote" then
				ui.addPopup(-9000, 0, "<p align='center'>Вас посадили в тюрьму Жители!", criminal, 200, 200, 400, true)
				massinfo[#massinfo+1] = "["..criminal.."]:".."Вас посадили в тюрьму Жители!"
			else
				ui.addPopup(-9000, 0, "<p align='center'>Вас посадили в тюрьму!", criminal, 200, 200, 400, true)
				massinfo[#massinfo+1] = "["..criminal.."]:".."Вас посадили в тюрьму!"
			end
			tfm.exec.movePlayer(criminal,250,650,false,0,0,false)
		end
	end
end

function winplayer()
    start = false
	ui.removeTextArea(5100, nil)
    ui.updateTextArea (-65, stringwin , nil )
	massinfo[#massinfo+1] = "[<font color='#ffff00'>".."WIN!!!".."]:"..stringwin.."</font>"
    listwintext = stringwin .. "<br>"
    for p, x in pairs(rolewin) do
        listwintext = listwintext .. p .. "<br>"
    end
    ui.addPopup(28100, 0, listwintext, nil, 200, 200, 400, true)
	messageinfo(nil)
    vosstan()
    
end
function countmapa(massiv)
    i=0
    for p, x in pairs(massiv) do
        i=i+1
    end
    return i
end
function delplayer(p) ---not security WRANG    
    if isContains(criminals, p) then
        criminals[p] = nil
		massinfo[#massinfo+1] = "["..p.."]".."Был в тюрьме"
    end
    if isContains(users, p) then
        users[p] = nil
    end
    if isContains(mafia_list, p) then
        mafia_list[p] = nil
		massinfo[#massinfo+1] = "[<font color='#ff0000'>"..p.."</font>]".."Был мафия!"
		if countmapa(mafia_list) == 0 then
			massinfo[#massinfo+1] = "<font color='#ffaa00'>Мафии больше нет, процент дневного события повышен до 100%</font>"
			random_event_chance = 100
		end
    end
    if isContains(police_list, p) then
        police_list[p] = nil
		massinfo[#massinfo+1] = "[<font color='#0000ff'>"..p.."</font>]".."Был полиция!"
    end
    if isContains(villager_list, p) then
        villager_list[p] = nil
		massinfo[#massinfo+1] = "[<font color='#00ff00'>"..p.."</font>]".."Был мирный житель!"
    end
    if isContains(infected, p) then
        infected[p] = nil
    end
    if isContains(hospital, p) then
        hospital[p] = nil
    end
    if isContains(viselvibr, p) then
        viselvibr[p] = nil
    end
    
    
    if isContains(victims, p) then
        victims[p] = nil
    end
    if isContains(suspect, p) then
        suspect[p] = nil
    end
    if doctor == p then
        doctor = ""
		massinfo[#massinfo+1] = "[<font color='#ffffff'>"..p.."</font>]".."Был доктор!"
    end
	
	if countElements(getAllPlayers()) < 7 and changeboolg then
		massinfo[#massinfo+1] = "<font color='#ffaa00'>Число игроков стало меньше 7, повышены процент от смертности</font>"
		per_kill_virus = 50
		per_kill_doctor = 50
		changeboolg = false
	end
	
    tfm.exec.killPlayer(p)
    ui.removeTextArea(5100, p)
    tfm.exec.respawnPlayer (p)
    ui.addTextArea(27100, "<p align='right'><font color='#00ff00'>Жители: " ..       countElements(villager_list) .. "</font><br><font color='#0000ff'>Полиция: " .. countElements(police_list) .. "</font><br><font color='#ff0000'>Мафия: " .. countElements(mafia_list) .. "</font><br>Доктора: " .. doctor_count .. "</p>", nil, 690, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true) 
end
function killpers(pers, player, killd, notkill)
    local i = math.random(0, 100)
	local bool_die = false
    if i > pers then
        kill = kill + 1
        if notkill == "no" then
        else
        ui.addPopup(-8200+kill, 0, notkill, player, 200, 200F, 400, true)
		massinfo[#massinfo+1]="["..player.."]:"..notkill
        end
    else
		bool_die = true
        ignormice[player] = {}
        kill = kill + 1
        ui.addPopup(-8200+kill, 0, killd, player, 200, 200, 400, true)
        tfm.exec.setNameColor(player, 0xffffff)
		
		massinfo[#massinfo+1]="["..player.."]:"..killd
    end
	return bool_die
end
function removeareax()
    for i=0, countmapa(police_list)+5 do
        ui.removeTextArea(-200+i, nil)
    end
    for i=0, countmapa(mafia_list)+5 do
        ui.removeTextArea(-100+i, nil)
    end
    for i=0, countmapa(villager_list)+5 do
        ui.removeTextArea(-300+i, nil)
    end
    ui.removeTextArea(-400, nil)
end
function addareatext()
 removeareax()
 dialog_text = "Полиция:<br>"
   for p, x in pairs(police_list) do
                dialog_text = dialog_text .. "<font color='#0000ff'>" .. p .. "</font><br>"
        end
        i = 0
        for p, val in pairs(police_list) do
            i = i+1
          ui.addTextArea(-200+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
          end
          dialog_text = "Мафия:<br>"
             for p, x in pairs(mafia_list) do
                dialog_text = dialog_text .. "<font color='#ff0000'>" .. p .. "</font><br>"
        end
        i = 0
        for p, val in pairs(mafia_list) do
            i = i+1
          ui.addTextArea(-100+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
          end
           
        dialog_text = "Вы житель"
        i = 0
        for p, val in pairs(villager_list) do
            i = i+1
          ui.addTextArea(-300+i, dialog_text .. "</p>", p, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
          end
          ui.addTextArea(-400, "Вы доктор</p>", doctor, 10, 60, 100, nil, 0x000001, 0xFFFFFF, 0.7, true)
end



--massinfo[#massinfo+1] = "test"



--показывает информацию
function messageinfo(pl)
	
	infoper()
	
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
		ui.addTextArea(-57000, stringinfo, pl, 500, 720, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
		ui.addTextArea(-57100, "<a href='event:plusinfo'>+", pl, 470, 720, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
		
		for p, val in pairs(massinfoplus) do
			ui.addTextArea(-57000, stringinfoplus, p, 500, 480, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
			ui.addTextArea(-57100, "<a href='event:plusinfom'>-", p, 470, 480, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
		end
		return
	end
	
	ui.addTextArea(-57000, stringinfo, nil, 500, 720, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
	ui.addTextArea(-57100, "<a href='event:plusinfo'>+", nil, 470, 720, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
	
	for p, val in pairs(massinfoplus) do
		ui.addTextArea(-57000, stringinfoplus, p, 500, 480, 400, nil, 0x000001, 0xFFFFFF, 0.7, false)
		ui.addTextArea(-57100, "<a href='event:plusinfom'>-", p, 470, 480, 20, nil, 0x000001, 0xFFFFFF, 0.7, false)
	end
	
end

function infoper()
	local stringinfo = "Проценты: (умер)<br>"
	if per_kill_virus > 49 then
		stringinfo = stringinfo.."<font color='#ffaa00'>смерть от вируса: "..per_kill_virus.."% ("..die_virus..")</font><br>"
	else
		stringinfo = stringinfo.."смерть от вируса: "..per_kill_virus.."% ("..die_virus..")<br>"
	end
	if per_kill_doctor > 49 then
		stringinfo = stringinfo.."<font color='#ffaa00'>смерть от укола: "..per_kill_doctor.."% ("..die_doctor..")</font><br>"
	else
		stringinfo = stringinfo.."смерть от укола: "..per_kill_doctor.."% ("..die_doctor..")<br>"
	end
	
	if random_event_chance > 89 then
		stringinfo = stringinfo.."<font color='#ffaa00'>дневное событие: "..random_event_chance.."%</font>"
	else
		stringinfo = stringinfo.."дневное событие: "..random_event_chance.."%"
	end
	ui.addTextArea(-58000, stringinfo, nil, 940, 720, 170, nil, 0x000001, 0xFFFFFF, 0.4, false)
end


function vosstan()
    messageinfo(nil)
    users = {}
    viselebool = false
    kill = 0
    mafia_list = {}
    police_list = {}
    villager_list = {}
    doctor = ""
    infected = {}
    criminals = {}
    hospital = {}
    ignormice = {} 
    rolewin = {}
    stringwin = ""
    time = 0
    day_cycle = 1
    day = 1

    for nick in pairs(tfm.get.room.playerList) do
        tfm.exec.setPlayerScore(nick,0,false)
    end
    
    
    ui.addTextArea(-1, "<p align='center'> <a href='event:start'>Запустить!", adm, 120, 350, 100, 20, 1, 0x00ff00, 0.7,true)
    ui.addTextArea(-2, "<p align='center'> <a href='event:game'>Участвовать", nil, 10, 350, 100, 20, 1, 0xffffff, 0.7,true)


    tfm.exec.addPhysicObject(0, 390, 650, {type=10, width=20, height=120})
    tfm.exec.addPhysicObject(1, 390, 510, {type=0, width=20, height=150})
end