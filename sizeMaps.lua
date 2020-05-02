map  = nil
ui_map   = nil
next = nil
scale = 2

newXML = "@0"
categor = "#7"

adm = "Deff83#0000"


-- string split
string.split = function(s,t)
	local r = {}
	for p in string.gmatch(s,"[^"..t.."]+") do
		table.insert(r,p)
	end
	return r
end

-- string s starts with prefix p ?
string.startswith = function(s,p)
   return string.sub(s,1,string.len(p))==p
end

-- combine some arrays (not tables!)
table.combine = function(...)
	local r = {}
	for _,a in pairs(arg) do
		if a and type(a)=='table' then
			for _,e in pairs(a) do
				table.insert(r,e)
			end
		end
	end
	return r
end

Map = {}
MapFilter = {}

-- private:

-- This turns an array into a chainable filter thing
Map.__a = function(a,p)
	a = a or {}
	for n,_ in pairs(MapFilter) do
		if string.startswith(n,'with') then
			a[n] = MapFilter[n]
		end
		for _,e in ipairs(a) do
			if p and string.startswith(n,p..'_') then
				e[string.sub(n,3)] = MapFilter[n]
			end
		end
	end
	return a
end

-- The main filtering function (input array,   attribute/key,  operator,  value, inverse/not)
Map.__f = function(a,k,op,V)
	local r = {}
	local m = true
	if inv then m=false end
	for i,e in ipairs(a) do
		if type(e)=='table' then
			local b = false
			local has = false
			local v = e[k]
			if v then has = true end
			if     op == 'has' then b = has
			elseif op == '=='  then b = has and v==V
			elseif op == '!='  then b = has and v~=V
			elseif op == '~='  then b = has and v~=V
			elseif op == '<='  then b = has and v<=V
			elseif op == '>='  then b = has and v>=V
			elseif op == '<'   then b = has and v< V
			elseif op == '>'   then b = has and v> V
			end
			if b==m then
				table.insert(r,e)
			end
		end
	end
	return r
end

-- Simple attribute test
Map.__t = function(e,k)
	if e[k] then return true end
	return false
end

fancorp = false
-- public:

-- constants
Map.enum = {}
Map.enum.collsion = { all =1, mice=3, grounds=2, none=4}
Map.enum.ground   = { wood=0, ice =1, tramp  =2, lava=3, choc=4, earth=5, grass=6, sand=7, cloud=8, water=9, stone=10, snow=11, rect=12, circle=13 }


-- get map properties
Map.length = function(C)
	return C.P.L or 800
end
Map.height = function(C)
	return C.P.H or 400
end
Map.gravity = function(C)
	if C.P.G then
		return C.P.G[2]
	end
	return 10
end
Map.wind = function(C)
	if C.P.G then
		return C.P.G[1]
	end
	return 0
end
Map.defilante = function(C)
	return C.P.defilante
end

Map.background = function(C)
	return C.P.F
end
Map.isNightmode = function(C)
	return Map.__t(C.P,'N')
end
Map.isSoulmate = function(C)
	return Map.__t(C.P,'A')
end
Map.isCollision = function(C)
	return Map.__t(C.P,'C')
end

-- get map sections
Map.grounds = function(C)
	return Map.__a(C.Z.S,'S')
end
Map.miceStuff = function(C)
	return Map.__a(C.Z.D,'D')
end
Map.shamanObjects = function(C)
	return Map.__a(C.Z.O,'O')
end
Map.joints = function(C)
	local r = nil
	if C.Z.L then
		r = table.combine(C.Z.L.JD, C.Z.L.JP, C.Z.L.JPL, C.Z.L.JR)
	end
	return Map.__a(r)
end
Map.cheese = function(C)
	if C and C.Z and C.Z.D then
		return Map.__a(C.Z.D.F)
	end
	return nil
end
Map.holes = function(C)
	return Map.__a(C.Z.D.T)
end
Map.miceSpawns = function(C)
	return Map.__a(C.Z.D.DS)
end
Map.shamanSpawns = function(C)
	return Map.__a(C.Z.D.DC)
end

-- get ground element properties
MapFilter.S_type = function(e)
	return e.T
end
MapFilter.S_x = function(e)
	return e.X
end
MapFilter.S_y = function(e)
	return e.Y
end
MapFilter.S_length = function(e)
	return e.L
end
MapFilter.S_height = function(e)
	return e.H
end
MapFilter.S_collision = function(e)
	if e.c then
		return Map.enum.collision[e.c]
	end
	return Map.enum.collsion.all
end
MapFilter.S_isForeground = function(e)
	return Map.__t(e,'N')
end
MapFilter.S_isDynamic = function(e)
	if e.P[1]==1 then
		return true
	end
	return false
end

-- shaman object
MapFilter.O_x = function(e)
	return e.X
end
MapFilter.O_y = function(e)
	return e.Y
end


-- filtering functions

MapFilter.with = function(a,attr,op,value,inv)
	op = op or 'has'
	return Map.__a(Map.__f(a,attr,op,value,inv))
end

-- For grounds / decorations
MapFilter.withType = function(a,value)
	return a:with('T','==',value)
end

-- For grounds
MapFilter.withForeground = function(a,value)
	if value==true then	return a:with('N') end
	return a:with('N','has',nil,true)
end

-- For objects
MapFilter.withId = function(a,value)
	return a:with('C','==',value)
end




-- xml is either a string, or blank/nil to use tfm.get.room.xmlMapInfo
Map.parse = function(xml)
	local C = {}
	if xml==nil then
		local mi = tfm.get.room.xmlMapInfo
		if string.startswith(tfm.get.room.currentMap,'@')==false then
			-- vanilla
			return nil
		end
		C.__cat = mi.permCode
		xml = mi.xml
	end

	local E = string.split(xml,'><')
	local p = C
	p.__tag = 'C'
	for _,e in ipairs(E) do
		e = string.gsub(e,'%"','')
		local A = string.split(e,' ')
		if table.getn(A) == 1 then
			-- In tfm XML, a tag without attributes is only used for sections (I think)...  I'm relying on that :-)
			if string.find(A[1],'/') then
				-- ascend from a section
				if p.__parent then
					p = p.__parent
				end
			elseif A[1]~='C' then
				-- descend into a section. We'll make a new table for it
				p[A[1]] = {}
				p[A[1]].__parent = p
				p = p[A[1]]
				p.__tag = A[1]
			end
		else
			-- Tag has attributes, we'll parse it out and stick it in our current table (p)
			local t = {}
			for _,a in ipairs(A) do
				if string.find(a,'=') then
					local v = string.split(a,'=')
					if table.getn(v)==1 then
						-- value was blank, we'll force something in there
						table.insert(v,'')
					end
					local L = string.split(v[2],',')
					if table.getn(L)>1 then
						-- list of comma-seperated values  (eg multispawn, or ground P attribute)
						local lt = {}
						for _,l in ipairs(L) do
							table.insert(lt,tonumber(l) or l)
						end
						t[v[1]] = lt
					else
						-- simple attr=value
						t[v[1]] = tonumber(v[2]) or v[2]
					end
				end
			end
			if p.__tag == A[1] then
				-- tag has same name as the current section, so it can be added there  (S/D/O)
				table.insert(p,t)
			else
				-- make a new array for this tag if needed, and add
				if not p[A[1]] then
					p[A[1]] = {}
				end
				table.insert(p[A[1]],t)
			end
		end
	end
	C.P = C.P[1]

	for n,_ in pairs(Map) do
		C[n] = Map[n]
	end

	return C
end


-----------------------------------------------------------------------------------------------------------------------

function gameLoad()
		print("TYT")
	for pl in pairs(tfm.get.room.playerList) do
		tfm.exec.changePlayerSize(pl, 1)
		tfm.exec.freezePlayer(pl, true)
	end
end

function gameStart()
	
tfm.exec.disableAutoNewGame(false)
	for pl in pairs(tfm.get.room.playerList) do
		tfm.exec.changePlayerSize(pl, scale)
		tfm.exec.freezePlayer(pl, false)
		print("TYT2")
		print(pl)
	end
end

function eventNewGame()

	

	local nudge = 0
	if scale > 1 then
		nudge = 12
	end
print("___________")
print(tfm.get.room.currentMap)

	if tfm.get.room.currentMap == '@0' then
		-- Our flipped map
		tfm.exec.setUIMapName(ui_map)
		addInfoAdmin()
		--tfm.exec.newGame(categor)
	elseif tfm.get.room.currentMap == '0' then
		tfm.exec.newGame(categor)
	else

			gameLoad()

		-- Real map
		map = Map.parse()
		print("map:" .. tfm.get.room.currentMap)
		if map then
			print("parse ok")

	    	ui_map = string.format('<J> %s <BL>- @%s',tfm.get.room.xmlMapInfo.author,tfm.get.room.xmlMapInfo.mapCode)

			local xml = string.format('<C><P L="%d" H="%d" G="%d,%d" F="%d" ', map:length()*scale, map:height()*scale, map:wind(), map:gravity()/scale, math.random(0, 8))
			if map:defilante() then
				d = map:defilante()
				if d[1] and d[2] and d[3] and d[4] then
					xml = xml .. string.format('defilante="%s,%s,%s,%s"', d[1]/scale, d[2]/scale, d[3]/scale, d[4])
				end
			end
			xml = xml .. ' /><Z><S>'

			for ii,p in ipairs(map.P) do
				print('p:' .. ii .. ':' .. tostring(p))
			end

			if map:grounds() then
				for i,g in ipairs(map:grounds()) do
					local gc = g.c or 0
					local gP = string.format("%s,%s,%s,%s,%s,%s,%s,%s", tostring(g.P[1]), tostring(g.P[2]), tostring(g.P[3]), tostring(g.P[4]), tostring(g.P[5]), tostring(g.P[6]), tostring(g.P[7]), tostring(g.P[8]))
					if g.T == 12 or g.T == 13 then
						if gc==2 or gc==4 then
						xml = xml .. string.format('<S T="%d" X="%d" Y="%d" L="%d" H="%d" c="%d" P="%s" o="213540" />', g.T, g.X*scale, g.Y*scale, g.L*scale, g.H*scale, gc, gP)
						else
						xml = xml .. string.format('<S T="%d" X="%d" Y="%d" L="%d" H="%d" c="%d" P="%s" o="324650" />', g.T, g.X*scale, g.Y*scale, g.L*scale, g.H*scale, gc, gP)
						end
						
					else
						xml = xml .. string.format('<S T="%d" X="%d" Y="%d" L="%d" H="%d" c="%d" P="%s" />', g.T, g.X*scale, g.Y*scale, g.L*scale, g.H*scale, gc, gP)
					end
				end
			end

			xml = xml .. '</S><D>'

			if map:cheese() then
				for i,cheese in ipairs(map:cheese()) do
					xml = xml .. string.format('<F X="%d" Y="%d" />', cheese.X*scale, (cheese.Y-nudge)*scale)
				end
			end

			if map:holes() then
				for i,hole in ipairs(map:holes()) do
					xml = xml .. string.format('<T X="%d" Y="%d" />', hole.X*scale, (hole.Y-nudge)*scale)
				end
			end

			if map:miceSpawns() then
				for i,spawn in ipairs(map:miceSpawns()) do
					xml = xml .. string.format('<DS X="%d" Y="%d" />', spawn.X*scale, spawn.Y*scale)
				end
			end
			
			xml = xml .. '</D>'
	
			if map:shamanObjects() then
				print("shaman objects")
				xml = xml .. '<O>'
				for i,o in ipairs(map:shamanObjects()) do
					if #o > 0 then
						xml = xml .. string.format('<O X="%d" Y="%d" C= "%s" P="%s" />', o.X*scale, o.Y*scale, tostring(o.C), tostring(o.P))
					end
				end
				xml = xml .. '</O>'
			else
				xml = xml .. '<O />'
			end

			xml = xml .. '</Z></C>'

			newXML = xml
			boolnewG = true


		else
			print("parse failed")
		end
	end
end

boolnewG = false
countnewG = 3

function eventLoop(t,r)
	if np then
		if np[2] == 0 then
			tfm.exec.newGame(np[1])
			np = nil
		else
			np[2] = np[2] - 1
		end
	end
	if boolnewG then
		ui.addTextArea(10101, "<font size='40px'><p align='center'><br><br>SCALE x"..scale.."<br><br>"..countnewG, nil, 0, 0, 800, 400, 0x555555, 0x00FF00, 0.7, true)
		if countnewG< 0 then
			countnewG = 3
			gameStartPre()
			tfm.exec.newGame(newXML)
			boolnewG = false
			ui.removeTextArea(10101, nil)
			gameStart()
		end
		countnewG = countnewG - 0.5
		
	end
end

command_mass = {}

command_mass['command_np'] = 1
command_mass['command_scale'] = 1


function eventChatCommand(p,s)
        print('player:' .. p .. ': ' .. s)
        local a = string.split(s,' ')
        local cmd = 'command_' .. string.lower(a[1])
        if command_mass[cmd] then
                command_admin(p,a)
        end
		if p == adm or p:lower() == "deff83#0000" then
			if s=="shaman" then
				local randMpuse = {}
				for pl in pairs(tfm.get.room.playerList) do
					randMpuse[#randMpuse+1] = pl
				end
				tfm.exec.setShaman(randMpuse[math.random(1, #randMpuse)])
			end
			if s=="all_shaman" then
				for pl in pairs(tfm.get.room.playerList) do
					tfm.exec.setShaman(pl)
				end
			end
			if s=="skip" then
				np = { categor, 7 }
			end
		end
end

function command_mort(p,a)
	tfm.exec.killPlayer(p)
end

function command_admin(p,a)
	print(p:lower())
        --if p:lower() == "vat#0000" or p:lower() == "sharpieboob#0000" then
                cmd = a[1]:lower()
				print("____________")
				print(cmd)
				print(a[2])
                if cmd == 'np' then
						categor = a[2]
                        np = { a[2], 7 }
                end
		if cmd == 'scale' then
			scale = tonumber(a[2])
		end
       -- end
end

function gameStartPre()
	if categor=="#13" or categor=="#3" then
		tfm.exec.setGameTime(60*5,false)
		tfm.exec.disableAutoShaman(true)
		tfm.exec.disableAfkDeath (true)
		tfm.exec.disableAutoTimeLeft (true)
	elseif categor=="#7" or categor=="#17" then
		tfm.exec.disableAutoShaman(true)
	else
		tfm.exec.setGameTime(60*3,false)
		tfm.exec.disableAutoShaman(false)
		tfm.exec.disableAfkDeath (false)
		tfm.exec.disableAutoTimeLeft (false)
	end
end

function eventPlayerWon(plr, TT, wonTime)
	if categor=="#13" or categor=="#3" then
		tfm.exec.respawnPlayer(nick)
	else
		
	end
	if fancorp then
		tfm.exec.giveConsumables(plr, 1, 1)
	end
end

function eventNewPlayer(nick)
	if categor=="#13" or categor=="#3" then
		tfm.exec.respawnPlayer(nick)
	else
		
	end
end

function eventPlayerDied(nick)
	if categor=="#13" or categor=="#3" then
		tfm.exec.respawnPlayer(nick)
	end
end

function addInfoAdmin()
	ui.addTextArea(10201, '!skip   !shaman   !all_shaman   !scale '..scale..'   !np '..categor..'', adm, 0, 40, 400, 20, 0x005500, 0x00FF00, 0.9, true)
end

tfm.exec.newGame(categor)