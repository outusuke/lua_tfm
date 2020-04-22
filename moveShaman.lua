--[[
  Based on "Twitch Plays Pokemon" event and the "Haunted Doll" script.
  
  The mice must control the shaman using the WASD / Arrow keys to bring her to the cheese and the hole.
]]

local sham, shamList = "", {}
local moveFactor = 10
graviton = 0
wHole = 800
hHole = 400

boolboards = true

local leaders = {["Deff83#0000"] = true, ["Onkei#0000"] = true, ["Santaishcool#0000"] = true, ["Ninjafood#0000"] = true, ["Pie#0000"] = true}

local KEYS = {
  ["0"] = "влево",
  ["1"] = "вверх",
  ["2"] = "вправо",
  ["3"] = "вниз"
}

-- Aliases

local changeTime = tfm.exec.setGameTime
local teleport = tfm.exec.movePlayer

-- Custom Functions

function bindKeys(n, bool)
  --[[
    Binds the required keyboard keys to the selected player.
  ]]
  bool = bool or true

  for key in next, KEYS do
    system.bindKeyboard(n, tonumber(key), true, bool)
  end
end

function disableEffects()
  tfm.exec.disableAfkDeath(true)
  tfm.exec.disableAllShamanSkills(true)
  tfm.exec.disableAutoNewGame(true)
  tfm.exec.disableAutoScore(false)
  tfm.exec.disableAutoShaman(true)
  tfm.exec.disableAutoTimeLeft(true)
  tfm.exec.disableDebugCommand(true)
  tfm.exec.disableMinimalistMode(false)
  tfm.exec.disableMortCommand(true)
  tfm.exec.disablePhysicalConsumables(true)
  tfm.exec.disablePrespawnPreview(true)
  tfm.exec.disableWatchCommand(false)
end

function globalMessage(message, target)
  tfm.exec.chatMessage(message, target)
  soupbot(message, target)
end

function main()
  --[[
    Initialization function when the script starts.
  ]]
  disableEffects()
  loadMap()
end

local mapRotations = {7, 17}
function loadMap()
  tfm.exec.newGame("#" .. mapRotations[math.random(#mapRotations)], math.random() <= 0.5)
end

function onkOrderingSystem(onkList, playerList, playerToFilter)

  if #onkList == 0 then

    local newPlayerList = {}

    for name in next, playerList do
      newPlayerList[#newPlayerList + 1] = name
    end

    for i = 1, #newPlayerList, 1 do
      local index = math.random(#newPlayerList)
      local name = newPlayerList[index]

      onkList[#onkList + 1] = name
      table.remove(newPlayerList, index)
    end
  end

  local onkSelected = onkList[1]

  if onkSelected == playerToFilter then
    onkSelected = onkList[2]
    table.remove(onkList, 2)

    onkList[#onkList + 1] = onkSelected
  else
    table.remove(onkList, 1)

    onkList[#onkList + 1] = onkSelected
  end

  return onkSelected
end

local player = {
  --[[
    Set of functions to un/blind a player.
  ]]
  blind = function(n)
    ui.addTextArea(1, "", n, -2500, -2500, 5000, 5000, 0x0A0A0A, 0x0A0A0A, 0.7, true)
  end,

  unblind = function(n)
    ui.removeTextArea(1, n)
  end
}

function table.copy(t1)
  local t2 = {}

  for k, v in next, t1 do
    t2[k] = v
  end

  return t2
end

local trackerData = ""
local tracker = {
  --[[
    Set of functions to track who pressed what key.
  ]]
  add = function(n, pressed)
    --[[
      Adds the player's key pressed data to the trackerData table.
    ]]
    trackerData = n .. " нажал(а) " .. KEYS[tostring(pressed)] .. ".<br>" .. trackerData
  end,

  popup = function()
    --[[
      Shows all the tracker data into a textArea popup (top right).
    ]]
    ui.addTextArea(2, "<p align='center'>Трекер</p>" .. trackerData, nil, 520, 20, 260, 200, 0x324650, 0x89A7F5, 0.4, true)
  end,
}

function soupbot(message, target)
  ui.addTextArea(0, "<v>[Soupbot] <n>" .. message, target, 7, 380, nil, 20, 0x324650, 0x000000, 0.7, true)
end

-- TFM API Functions


function setSteny()
	local typel = math.random(1, 10)
	tfm.exec.addPhysicObject(10005, 400, 0, {type=typel, width=800, height=20})--door of prison
	tfm.exec.addPhysicObject(10006, 400, 400, {type=typel, width=800, height=20})--door of prison
	tfm.exec.addPhysicObject(10007, 0, 200, {type=typel, width=20, height=400})--door of prison
	tfm.exec.addPhysicObject(10008, 800, 200, {type=typel, width=20, height=400})--door of prison
end

function eventNewGame()
	
  -- Clearing the tracker data.
  trackerData = ""
  graviton = parseMapXMLforGrvity()
  
  if wHole~=800 or hHole~= 400 then
	loadMap()
  end
  

	if boolboards then
		setSteny()
	end
	
  -- Don't blind the old shaman.
  player.unblind(sham)

  -- Select a new shaman.
  sham = onkOrderingSystem(shamList, tfm.get.room.playerList)
  bindKeys(sham, false)
  tfm.exec.freezePlayer(sham, true)
  player.blind(sham)
  tfm.exec.setShaman(sham)
  ui.setShamanName(sham)

  globalMessage("Вместе с другими мышами Вы должны управлять шаманом, нажимая на стрелки или WASD!")
  globalMessage("Вы - шаман! Вы были ослеплены, поэтому другие мыши должны провести вас к сыру!", sham)
  local numOfPlayers = 0

  -- Binding keys for other players.
  for n in next, tfm.get.room.playerList do
    if n ~= sham then
      bindKeys(n)
      tfm.exec.killPlayer(n)

      numOfPlayers = numOfPlayers + 1
    end
  end

  -- Setting the move factor for controlling the shaman.
  if numOfPlayers <= 2 then moveFactor = 15 elseif numOfPlayers <= 5 then moveFactor = 10 else moveFactor = 5 end 
end

function eventChatCommand(n, cmd)
  if (n == sham or leaders[n]) and cmd == "skip" then
    changeTime(3)
  end
  if (leaders[n]) and cmd == "boards" then
    boolboards = true
  end
  if (leaders[n]) and cmd == "unboards" then
    boolboards = false
  end

end

function eventKeyboard(n, key, down, x, y)
  if n == sham then
    return
  end

  tracker.add(n, key)
	print(graviton)
  if key == 0 then
    teleport(sham, 0, 0, true, -moveFactor, 0, true)
  elseif key == 2 then
    teleport(sham, 0, 0, true, moveFactor, 0, true)
  elseif key == 3 then
    teleport(sham, 0, 0, true, 0, moveFactor+graviton*2, true)
  elseif key == 1 then
    teleport(sham, 0, 0, true, 0, -moveFactor-graviton*2, true)
  end
end

function eventLoop(passed, left)
  -- Constantly updating and showing the tracker popup.
  tracker.popup()

  if left <= 0 then
    loadMap()
  end
end

function eventPlayerDied(n)
  if n == sham then
    player.unblind(n)
    changeTime(5)
    globalMessage("Шаман умер! Что с вами не так, народ?")
    globalMessage("Мыши смогли привести вас только к смерти!", n)
  end
end

function eventPlayerGetCheese(n)
  if n == sham then
    globalMessage("Шаман получил сыр! Теперь вы должны проводить его к норе!")
    globalMessage("Мыши помогли Вам взять сыр!", n)
  end
end

function eventPlayerLeft(n)
  if n == sham then
    changeTime(5)
    globalMessage("Шаман покинул комнату! [F]")
  end

  local listCopy = table.copy(shamList)

  for index, name in next, listCopy do
    if name == n then
      table.remove(shamList, index)
    end
  end
end

function eventNewPlayer(n)
  shamList[#shamList + 1] = n
end

function eventPlayerWon(n)
  if n == sham then
    player.unblind(n)
    changeTime(5)
    globalMessage("Вы успешно провели шамана к норе! Так держать!")
    globalMessage("Вас успешно привели к норе!", n)
  end
end

function eventSummoningEnd(n, object, x, y, angle, velx, vely, other)
  -- Making sure the shaman can't spawn any objects.
  tfm.exec.removeObject(other.id)
end


function parseMapXMLforGrvity()
    local m={
        loaded=false,
        segments={},
        grounds={},
        decorations={},
        spawns={},
        shamspawns={},
        holes={},
        cheese={},
        length=800,
        height=400,
        code=tonumber(string.match(tfm.get.room.currentMap,"%d+")) or 0,
        wind=0,
        gravity=10
    }
	
    if #tostring(m.code)<=3 and tfm.get.room.currentMap~="@0" then
        m.mode="vanilla"
    else
        m.xml=tfm.get.room.xmlMapInfo.xml
        local g=getValueFromXML
        local P=m.xml:match('<C><P (.-) /><Z>') or ""
        m.perm=tfm.get.room.xmlMapInfo.permCode
        m.title=g(P,"title")
        m.id=g(P,"id")
        m.length=g(P,"L") or 800
        m.height=g(P,"H") or 400
        m.reload=g(P,"reload") and true or false
        local bg=g(P,"bg")
        if bg then m.bg=getBackgrounds(bg,".jpg") end
        local bg=g(P,"bg")
        if fg then m.bg=getBackgrounds(fg,".png") end
        local wg=g(P,"G")
		print(wg)
        if wg and #wg>2 then
            wg=mysplit(wg,",")
            m.wind=tonumber(wg[1]) or 0
            m.gravity=tonumber(wg[2]) or 10
        end
	end
	print(m.gravity)
	
	wHole = m.length
	hHole = m.height
	
	return m.gravity
end

function getValueFromXML(str,attribute)
    return tonumber(str:match(('%s="([^"]+)"'):format(attribute))) or str:match(('%s="([^"]+)"'):format(attribute)) or str:match(('%s=""'):format(attribute))
end

function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end


main()