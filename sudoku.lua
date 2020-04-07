--[         Судоку         ]--
--[  Модуль создан Deff83#0000  ]--
---------------------- PROPERTIES ----------------------
--adm = "<admin nickname with hash>"
adm = "Deff83#0000"

time_ban = 30--timer ban
fail_score = 10--minus score
score_win = 50--progress score
win_col = 5--progress 0/win_col
boolProgress = true
map = "@5058219"--"@6168087", "@4942685", "@5058219"

------------------ ADDITIONAL PROPERTIES -----------------
pusto = "      <br>      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"

time_new = 10--start timer
max_info = 10--max info lines

color_winner = {"#F1B90D", "#ffffff", "#FF4900", "#F1B90D"}
color_winner_x = {0x000001, 0xF1B90D}
color_XY = {0xFFA540, 0xFFA540}--//
color_sudo = {0xFFBD73, 0xFFA540}--/
color_line = {0xFFA540, 0xFF8700}--///
border = 2

color_info = {0x331500, 0xFF8700}
color_ban = {"#cc0000", "#00aa00"}
color_num = {"#9D2763", "#D2006B", "#880045"}

color_adm = {"#ff77ff"}
color_info_game = {"#dddd00"}

color_progress = {0x331500, 0xFF8700}



--------------------- DO NOT TOUCH ---------------------
winners = {}
players = {}
id_mouse = 1000
ban_mass = {}
chooser = {}

game_state = 1--1 - sudoku, 2 - XY
lastOtg = {0, 0}

startbool = false
boolscorenull = true


mass_sudo = {}
mass_sudo_start = {}
mass_solve = {}
mass_XY = {}

function setnull()
	mass_sudo = {
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto}
	}
	mass_solve = {
		{1, 2, 3,  4, 5, 6,  7, 8, 9},
		{4, 5, 6,  7, 8, 9,  1, 2, 3},
		{7, 8, 9,  1, 2, 3,  4, 5, 6},
		
		{2, 3,  4, 5, 6,  7, 8, 9, 1},
		{5, 6,  7, 8, 9,  1, 2, 3, 4},
		{8, 9,  1, 2, 3,  4, 5, 6, 7},
		
		{3,  4, 5, 6,  7, 8, 9, 1, 2},
		{6,  7, 8, 9,  1, 2, 3, 4, 5},
		{9,  1, 2, 3,  4, 5, 6, 7, 8}
	}
	mass_solve = {
			{2,3,8,9,6,5,7,1,4},
			{7,5,9,4,1,3,6,8,2},
			{4,1,6,2,7,8,9,5,3},
			{9,4,5,1,3,6,2,7,8},
			{6,8,7,5,2,4,1,3,9},
			{3,2,1,8,9,7,4,6,5},
			{1,6,2,3,5,9,8,4,7},
			{5,7,4,6,8,2,3,9,1},
			{8,9,3,7,4,1,5,2,6}
		}
	mass_sudo_start = {
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto}
	}
	mass_XY = {
		{pusto, pusto, pusto},
		{pusto, pusto, pusto},
		{pusto, pusto, pusto}
	}
	lastOtg = {0, 0}
end

setnull()


massinfo = {}
smesh = 20

time = 0

tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame(map)

mapName = "<VP>Судоку<BL> | <N>Время: <V>%s</V><BL> | <N>Мышей: <V>%s<N> <BL> | <N>Создатель: <BV>Deff83#0000\n"

function isContains(table, element)
    for p, val in pairs(table) do
         if p == element then
        
            return true
        end
    end
    return false
end

function shallowcopy(orig)
    local copy = {
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto},
		{pusto, pusto, pusto,  pusto, pusto, pusto,  pusto, pusto, pusto}
	}
	for i = 1, 9 do
		for j = 1, 9 do
			copy[i][j] = orig[i][j]
		end
	end
    return copy
end

function addDoskaXY(pl)
	for i = 1, 3 do
		for j = 1, 3 do
			ui.addTextArea(-10000+i*10+j, "<a href='event:xy"..i..""..j.."'>"..mass_XY[j][i], pl, 200+i*84+border*(i-1), 50-smesh+(j-1)*84+border*(j-1), 73, 73, color_XY[1], color_XY[2], 1, false)
		end
	end
end

function addDoskaSudoku(pl)

			local popravkax = -1
			local popravkay = -1
	for i = 1, 9 do
			if (i-1)%3 == 0 then
				popravkay = popravkay + 1
			end
		for j = 1, 9 do
			if (j-1)%3 == 0 then
				popravkax = popravkax + 1
			end
			local href = ""
			local fontcol = ""
			if mass_sudo[j][i] == pusto then
				href = "<a href='event:sudo"..i..""..j.."'>"
			end
			if mass_sudo_start[j][i] ~= pusto then
				fontcol = "<font color='"..color_num[3].."'>"
			end
			
			ui.addTextArea(-20000+i*10+j, fontcol.."<b><p align='center'>"..href..mass_sudo[j][i], pl, 256+i*28+popravkay*border, 50-smesh+(j-1)*28+popravkax*border, 18, 18, color_sudo[1], color_sudo[2], 1, false)
		end
		popravkax = -1
	end
end

function addlineDoska(pl)
	ui.addTextArea(-11000, "<a href='event:doska'><br><br><br><br><br><br><br><br><br>", pl, 280, 45-smesh, 250+border*2, 250+border*2, color_line[1], color_line[2], 1, false)
end

function addDoska(pl)
	addlineDoska(pl)
	addDoskaSudoku(pl)
end

function showChoose(pl, x, y)
	chooser[pl] = {x, y}
	--print(isContains(chooser, pl))
	
end



function eventTextAreaCallback(id, p, cmd)

	if cmd == "help" then
		show_rule(p)
	end
	
	if cmd == "cancelnum" then
		ui.removeTextArea(-60000+players[p], p)
		chooser[p] = nil
	end
	
	if cmd == "restart" then
		massinfo[#massinfo+1] = "<font color='"..color_adm[1].."'>".."Game will restart".."</font>"
		for nick in pairs(players) do
			ui.removeTextArea(-60000+players[nick], nil)
		end
		time = 0
		startbool = false
		messageinfo(nil)
	end
	
	if cmd == "scorenull" then
		massinfo[#massinfo+1] = "<font color='"..color_adm[1].."'>".."Game will restart with score 0".."</font>"
		for nick in pairs(players) do
			ui.removeTextArea(-60000+players[nick], nil)
		end
		boolscorenull = true
		time = 0
		startbool = false
		messageinfo(nil)
	end
	
	if (cmd:sub(0,4))=="sudo" then
		if isContains(ban_mass, p)==false then
			local x = cmd:sub(5,5)
			local y = cmd:sub(6,6)
			--print(x..":"..y)
			if startbool then
			showChoose(p, x, y)
			end
			--ban(p)
		end
	end
	if (cmd:sub(0,6))=="choose" then
		ui.removeTextArea(-60000+players[p], p)
		chooser[p] = nil
		local num = cmd:sub(7,7)
		local y = cmd:sub(8,8)
		local x = cmd:sub(9,9)
		--print(x..":"..y..":"..num)
		if mass_sudo[y+0][x+0] == pusto then
			if mass_solve[y+0][x+0]==(num+0) then
				mass_sudo[y+0][x+0] = num
				ui.updateTextArea (-20000+x*10+y, "<p align='center'>".."<font color='"..color_num[2].."'>"..num , nil)
				tfm.exec.setPlayerScore(p,1, true)
				massinfo[#massinfo+1] = p.." отгадал:"..num
				
				if lastOtg[1]~=0 then
					ui.updateTextArea (-20000+lastOtg[1]*10+lastOtg[2], "<p align='center'>".."<font color='"..color_num[1].."'>"..mass_sudo[lastOtg[2]+0][lastOtg[1]+0] , nil)
				end
				lastOtg = {x, y}
				setProgress(p, (num+0))
				if isWin() then
					win(p)
				end
			else
				--print(mass_solve[y+0][x+0].."->"..num)
				
				if (tfm.get.room.playerList[p].score)-fail_score < 0 then
					tfm.exec.setPlayerScore(p,0, false)
					ui.addPopup(-60000+players[p], 0, "<p align='center'>НЕВЕРНО! У вас 0 очков - вас забанили на "..time_ban.."s", p, 200, 200, 400, true)
					ban(p)
					return
				end
				ui.addPopup(-60000+players[p], 0, "<p align='center'>НЕВЕРНО! <br>-"..fail_score.." очков", p, 200, 200, 400, true)
				tfm.exec.setPlayerScore(p,-fail_score, true)
			end
		else
			ui.addPopup(-60000+players[p], 0, "<p align='center'>Вас опередили, ячейка уже заполнена!", p, 200, 200, 400, true)
		end
	end
end



function restart()
	for nick in pairs(players) do
		ui.removeTextArea(-60000+players[nick], nil)
		ui.removeTextArea(players[nick]*1000+101, nil)
		ui.removeTextArea(players[nick]*1000+100, nil)
		ui.removeTextArea(1000+101, nil)
		ui.removeTextArea(1000+100, nil)
		for i=1, 9 do
			ui.removeTextArea(players[nick]*1100+i, nil)
			ui.removeTextArea(players[nick]*1000+i, nil)
			ui.removeTextArea(1100+i, nil)
			ui.removeTextArea(1000+i, nil)
			
		end
		
	end
	chooser = {}
	players = {}
	for nick in pairs(tfm.get.room.playerList) do
		id_mouse = id_mouse + 1
		players[nick] = id_mouse
	end
	winners = {}
	ban_mass = {}
	setnull()
end

progress = {}

function ban(p)
	if isContains(ban_mass, p)==false then
		ban_mass[p] = time_ban*2
		massinfo[#massinfo+1] = "<font color = '"..color_ban[1].."'>"..p..":".."BAN on "..time_ban.."s</font>"
	end
end

function new_game()
	if game_state == 1 then
		refresh()
		local mass_solve_full = shallowcopy(mass_solve)
		deleteyach()
		mass_sudo_start = mass_solve
		mass_sudo = mass_sudo_start
		mass_solve = mass_solve_full
		
		--test
		--mass_sudo = mass_solve
		
		addDoska(nil)
	end
end


function deleteyach()
	local numranNo = {}
	for i=1, 81 do
		numranNo[i] = i
	end
	
	for i=1, 81 do
		local randyach = math.random(1, #numranNo)
		local yach = numranNo[randyach]
		local i = math.floor((yach-1)/9)+1
		local j = (yach-1)%9 + 1
		if isDel(i,j) then
			mass_solve[i][j] = pusto
		end
		table.remove(numranNo, randyach)
	end
	
	
	
	
end

function isDel(vx, vy)
	local chis = mass_solve[vx][vy]
	
	if colY(vy)==9 then
		return true
	end
	if colX(vx)==9 then
		return true
	end
	if colYach(vx, vy)==9 then
		return true
	end
	if peresX(vx, vy) or peresY(vx, vy) then
		return true
	end
	
	return false
end

function peresY(x, y)
	local chis = mass_solve[x][y]
	fl = (y-1)%3+1--1.2.3
	fk_big = math.floor((y-1)/3)--big 0.1.2
	for i=1, 3 do
		if i~=fl then
			if linhasY(i+fk_big*3, chis)==false then
				return false
			end
		end
	end
	local chi = 0
	for i=1, 3 do
		if mass_solve[i+math.floor((x-1)/3)*3][y]~=pusto then
			chi = chi + 1
		else
			
		end
	
	end
	if chi < 3 then
		return false
	end
	
	
	
	
	
	return true
end
function peresX(x, y)
	local chis = mass_solve[x][y]
	local fl = (x-1)%3+1--1.2.3
	local fk_big = math.floor((x-1)/3)--big 0.1.2
	for i=1, 3 do
		if i~=fl then
			if linhasX(i+fk_big*3, chis)==false then
				return false
			end
		end
	end
	local chi = 0
	for i=1, 3 do
		if mass_solve[x][i+math.floor((y-1)/3)*3]~=pusto then
			chi = chi + 1
		else
			
		end
	
	end
	if chi < 3 then
		return false
	end
	
	return true
end

function linhasX(x, chis)
	for i=1, 9 do
		if mass_solve[x][i]==chis then
			return true
		end
	end
	return false
end

function linhasY(y, chis)
	for i=1, 9 do
		if mass_solve[i][y]==chis then
			return true
		end
	end
	return false
end



function colYach(x, y)
	local chi = 0
	for i=1, 3 do
		for j=1, 3 do
			if mass_solve[math.floor((x-1)/3)*3+i][math.floor((y-1)/3)*3+j]~=pusto then
				chi = chi + 1
			else
				
			end
		end
	
	end
	return chi
end

function colX(x)
	local chi = 0
	for i=1, 9 do
		if mass_solve[x][i]~=pusto then
			chi = chi + 1
		else
			
		end
	end
	return chi
end

function colY(x)
	local chi = 0
	for i=1, 9 do
		if mass_solve[i][x]~=pusto then
			chi = chi + 1
		end
	end
	return chi
end

function refresh()
	math.randomseed(os.time())
	for k=1, 2 do
	for i=1, 9 do
		local rand_x=math.random(1, 3)
		changeX(i, math.floor((i-1)/3)*3+rand_x)
	end
	for i=1, 9 do
		local rand_y=math.random(1, 3)
		changeY(i, math.floor((i-1)/3)*3+rand_y)
	end
	
	
	
	
	end
	transposing()
	for i=1, 9 do
		local rand_x=math.random(1, 3)
		changeX(i, math.floor((i-1)/3)*3+rand_x)
	end
	for i=1, 9 do
		local rand_y=math.random(1, 3)
		changeY(i, math.floor((i-1)/3)*3+rand_y)
	end
	
	
	
	
	
	
end

function transposing()
	local new_mass_solv = shallowcopy(mass_sudo_start)
	for j=1, 9 do
		for i=1, 9 do
			new_mass_solv[i][j] = mass_solve[j][i]
		end
	end
	mass_solve = new_mass_solv
end

function pereX()
	for i=1, 3 do
		local rand_x=math.random(1, 3)
		changeX((i-1)*3+1, (rand_x-1)*3+1)
		changeX((i-1)*3+2, (rand_x-1)*3+2)
		changeX((i-1)*3+3, (rand_x-1)*3+3)
	end
end

function pereY()
	for i=1, 3 do
		local rand_y=math.random(1, 3)
		changeY((i-1)*3+1, (rand_y-1)*3+1)
		changeY((i-1)*3+2, (rand_y-1)*3+2)
		changeY((i-1)*3+3, (rand_y-1)*3+3)
	end
end



function changeY(y, yv)
	local proz_y = mass_solve[y]
	local proz_yv = mass_solve[yv]
	mass_solve[y] = proz_yv
	mass_solve[yv] = proz_y
end

function changeX(x, xv)
	for i=1, 9 do
		local proz_x = mass_solve[i][x]
		local proz_xv = mass_solve[i][xv]
		mass_solve[i][x] = proz_xv
		mass_solve[i][xv] = proz_x
	end
end

function isWin()
	for i=1, 9 do
		for j = 1, 9 do
			if mass_sudo[i][j] == pusto then
				return false
			end
		end
	end
	return true
end

function win(pl)
	massinfo[#massinfo+1] = "<font color='"..color_info_game[1].."'>".."Sudoku solved!!!".."</font>"
	time = 0
	startbool = false
	--print("WIN")
	messageinfo(nil)
end

function start()
	startbool = true
	restart()
	
	new_game()
	if boolscorenull then
		progress = {}
		ui.removeTextArea(80000+101, nil)
		for nick, prop in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(nick,0, false)
			progress[nick] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}--1.2.3.4.5.6.7.8.9.score
		end
		massinfo = {}
	end
	massinfo[#massinfo+1] = "<font color='"..color_info_game[1].."'>".."Game started".."</font>"
	boolscorenull = false
end
-------------------------------------------------LOOPER--------------------------------------------
function eventLoop()
		time = time + 0.5
	--if time%2 == 0 then
		getListWin()--sort
		addTextAreaScore()
		
		
		
		if startbool == false then
			ui.setMapName(string.format(mapName, math.floor((time_new - time)).."s", #winners))
			if (time_new - time) == 0 then
				time = 0
				start()
			end
		else
		if boolProgress then
			getProgress(nil)
		end
			messageinfo(nil)
			ui.setMapName(string.format(mapName, math.floor(time/60)..":"..(math.floor(time)%60), #winners))
			unbunsloop()
		end
	--end
end

function getProgress(p)
	if p==nil then
		for nick, prog in pairs(progress) do
			showProgress(nick)
		end
	else
		showProgress(p)
	end
end

function setProgress(p, chis)
	if isContains(progress, p) then
		if chis>= 1 and chis <= 9 then
			progress[p][chis] = progress[p][chis] + 1
			
		end
	end
end

function showProgress(p)
	if tfm.get.room.playerList[p].score>=score_win then
		progress[p][10] = 1
	else
		progress[p][10] = 0
	end
	local progressPlayer = progress[p]
	ui.addTextArea(1000+100, "Достижения:", p, 0, 380, 100, 20, color_progress[1], 0xffffff, 1,true)
	for i=1, 9 do
		if progressPlayer[i] >= win_col then
			ui.addTextArea(players[p]*1000+i, i.."", p, 100+i*40, 382, 13, 15, color_progress[2], 0xffffff, 1,true)
		else
			ui.addTextArea(1000+i, i.."", p, 100+i*40, 382, 13, 15, color_progress[1], 0xffffff, 1,true)
		end
		ui.addTextArea(players[p]*1100+i, progressPlayer[i].."", p, 118+i*40, 382, 13, 15, 0xffffffff, 1,true)
	end
	if progressPlayer[10] == 1 then
		ui.addTextArea(players[p]*1000+101, "Win Score:"..score_win, p, 520, 380, 100, 20, color_progress[2], 0xffffff, 1,true)
	else
		ui.addTextArea(1000+101, "Win Score:"..score_win, p, 520, 380, 100, 20, color_progress[1], 0xffffff, 1,true)
	end
	if isProgressWin(p) then
		progWin(p)
	end
end

function isProgressWin(p)
	local progressPlayer = progress[p]
	for i=1, 9 do
		if progressPlayer[i] < win_col then
			return false
		end
	end
	if progressPlayer[10] == 0 then
		return false
	end
	return true
end

function progWin(p)
	time = 0
	startbool = false
	boolscorenull = true
	ui.addTextArea(80000+101, "<font size='28' color = '"..color_winner[4].."'>".."Winner:"..p, nil, 100, 150, 600, nil, color_winner_x[1], color_winner_x[2], 1,true)
	massinfo[#massinfo+1] = "<font color='"..color_winner[4].."'>".."Winner:"..p.."</font>"
	for nick in pairs(players) do
		ui.removeTextArea(-60000+players[nick], nil)
	end
	messageinfo(nil)
end

function unbunsloop()
	local unban = {}
	for p, sec in pairs(ban_mass) do
		sec = sec - 1
		ban_mass[p] = sec
		if sec < 1 then
			unban[p] = 1
		end
	end
	for p, sec in pairs(unban) do
		ban_mass[p] = nil
		massinfo[#massinfo+1] = "<font color = '"..color_ban[2].."'>"..p..":".."UnBAN</font>"
	end
end

function getListWin()
	winners = {}
	for p, _ in pairs(tfm.get.room.playerList) do
		table.insert(winners, {p, _})
	end
	table.sort(winners, function(lhs, rhs)
	  return lhs[2].score >= rhs[2].score
	end)
	return winners
	
end

function addTextAreaScore()
	local mess = ""
	for i = 1, 3 do
		if not winners[i] then
			break
		end
		if i == 1 then
			mess = mess.."<font color='"..color_winner[1].."'>"
		elseif i == 2 then
			mess = mess.."<font color='"..color_winner[2].."'>"
		elseif i == 3 then
			mess = mess.."<font color='"..color_winner[3].."'>"
		else
			mess = mess.."<font color='#cccccc'>"
		end
		mess = mess..""..winners[i][1]..":"..winners[i][2].score.."<br>"
	end
	ui.addTextArea(-10000, "<font color='#cccccc'>"..mess.."</font>", nil, 600, 50, 200, nil, color_info[1], color_info[2], 0.9, false)
end




--показывает информацию
function messageinfo(pl)
	
	local stringinfo = ""
	
	for i=1, #massinfo do
		if i<=max_info then
			stringinfo = stringinfo..massinfo[#massinfo-i+1]
			if i <= #massinfo-1 then
				stringinfo = stringinfo.."<br>"
			end
		end
	end
	
	
	
	ui.addTextArea(-50000, stringinfo, pl, 0, 70, 200, nil, color_info[1], color_info[2], 1, false)
	
	if startbool then
		for nick, prop in pairs(players) do
			showNumsg(nick)
		end
	end
	
end

function showNumsg(pl)
	if isContains(chooser, pl) then
		--print("messageinfo:"..pl)
		local x = chooser[pl][1]
		local y = chooser[pl][2]
		ui.addTextArea(-60000+players[pl], "<p align='center'><font size='30px' color='#ffffff'><a href='event:choose1"..y..x.."'>1</a>   <a href='event:choose2"..y..x.."'>2</a>   <a href='event:choose3"..y..x.."'>3</a><br><a href='event:choose4"..y..x.."'>4</a>   <a href='event:choose5"..y..x.."'>5</a>   <a href='event:choose6"..y..x.."'>6</a><br><a href='event:choose7"..y..x.."'>7</a>   <a href='event:choose8"..y..x.."'>8</a>   <a href='event:choose9"..y..x.."'>9</a></font><br><a href='event:cancelnum'>cancel</a></p>", pl, 0, 70, 200, nil, color_info[1], color_info[2], 1,false)
		ui.removeTextArea(-50000, pl)
		return
	end
end




function eventPlayerDied(nick)
    tfm.exec.respawnPlayer(nick)
end

function eventNewPlayer(playerName)
    tfm.exec.respawnPlayer (playerName)
	addDoska(playerName)
	id_mouse = id_mouse + 1
	players[playerName] = id_mouse
	progress[playerName] = {0, 0, 0, 0, 0, 0, 0, 0, 0}
	show_rule(playerName)
end


function eventPlayerLeft(pName)
	players[pName] = nil
	progress[pName] = nil
end


function show_rule(pl)
	ui.addPopup(-10000, 0, "<p align='center'><font size='40px' color='#ffff00'>Конкурс \"Судоку\"</font><br><font size='14px'><font color='#00ff00'>автор Deff83#0000</font><br> </font><font color='F1B90D'>Судоку</font> – это одна из самых популярных игр-головоломок всех времен. Цель судоку – заполнить сетку 9 на 9 цифрами так, чтобы в каждой строке, столбце и сетке 3 на 3 были все цифры от 1 до 9. Судоку – не только логическая головоломка, но и отличная игра для развития мозга. Если ты будешь играть в судоку каждый день, то вскоре увидишь, как твоя способность сосредотачиваться и мыслительная способность увеличиваются. <br> В игре нужно выполнить достижения - вписать в судоку числа от 1 до 9 в количестве "..win_col.." раз, а также набрать очки в количестве "..score_win..".<br>Побеждает мышка быстрее всех выполнившая все достижения.<br>За каждый ход прибавляется 1 очко, за не правильный вычитается "..fail_score.." очков. При отрицательных очках мышке дается бан на "..time_ban.." секунд.<br><font size='14px' color='#cccc00'>Приятной игры</font></p>", pl, 100, 50, 600, true)
	ui.addTextArea(-66, "<a href='event:help'>help", pl, 0, 27, 50, 20, color_info[1], color_info[2], 1,true)
	
	ui.addTextArea(-67, "<a href='event:restart'>restart", adm, 740, 360, 50, 20, color_info[1], color_info[2], 1,true)
	ui.addTextArea(-68, "<a href='event:scorenull'>restart full", adm, 720, 330, 70, 20, color_info[1], color_info[2], 1,true)
end




restart()
show_rule(nil)


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







