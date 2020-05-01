--[[
    CMDS:
    1. !team1 "playername" "playername" \\Assign players to team1 , ex: !team1 Ctmce Ziggy_z
    2. !team2 "playername "playername"  \\Assign players to team2 , ex: !team2 Ctmce Ziggy_z
    3. !add team1 "playername" "playername"  \\Adds the player team1.
    4. !add team2 "playername" "playername"  \\Adds the player team2.
    5. !remove team1 "playername" "playername"  \\Removes the player/'s from team1!
    6. !remove team2 "playername" "playername"  \\Removes the player/'s from team2!
    7. !exit  \\Closing the Admin Panel//
    8. !start \\Shows the Admin Panel back//
    9. !sp team1 23  \\Sets the points for team1 to 23 or whatever you choose!
    10. !sp team2 15  \\Sets the points for team1 to 15 or whatever you choose!
    11. !aj on / off  \\Turns AutoJoin On and Off.
    12. !pause  //pauses the game , and shows the gui back ^^
    ---------------------------------
    Total Commands Count: [8].
    Total BootcampMaps Count: [222].
    Total RacingMaps Count: [1424].
    ---------------------------------
   
    TODO:
    1. Make 4 teams!
--]]
 
--Admin/Game Setup--
local Admin = "Deff83#0000" --Write your name here to be able to use the Admin Panel--
local ScoreToWin = 1 --Type here the amount of points need to win the game(Leave it at the same number it is right now if you want to change it in the Setup Panel)--
local autoJoin = true
local team1Color = "Pink"  --List of colors ["Pink","Blue","Green","White"]--
local team2Color = "Blue" --List of colors ["Pink","Blue","Green","White"]--
local mod = "Bootcamp"
--^^^^^^^^^^^^^^^^^^^CHANGE ONLY THE THINGS ABOVE^^^^^^^^^^^^^^^^^^^--
--------------
 
--DO NOT CHANGE THE SCRIPT!--
local teams = {Team1 = {}, Team2 = {}}
--Team score--
local teamScore = {Team1 = 0, Team2 = 0}
--------------
---Maps---
local racingMaps = {"7025177","7046282","7047612","7049172","7053504","2283","2806","3154","72339","166705","237281","349389","103182","107544","112790","114122","117548","120152","122911","124359","130763","136966","138036","138678","407536","144468","144677","277731","146801","147436","148424","150692","152299","155168","156685","156847","6583596","159351","160762","161730","163682","164802","165112","165747","165843","5848412","167941","168776","380417","169892","171152","175205","176263","177236","177813","178545","178657","180191","180255","180274","180469","180509","180619","181312","184110","563303","185760","185774","186604","190026","191201","191716","191753","192391","192566","193009","193588","193936","195720","196433","196468","197219","197501","198549","198715","199219","201323","3679666","206810","208058","208162","208914","209315","209708","209799","210188","211528","211565","211885","212542","213331","213697","213933","214037","214660","214775","215938","216439","216505","216553","216735","217282","217881","217900","219548","220500","222098","223293","223810","223986","224441","225017","226069","226879","226883","227417","227851","228462","229814","229827","229830","229834","229835","229944","230510","230741","231254","231694","231905","232140","232274","232451","232699","232791","233230","233345","233398","233687","234039","234502","234959","235034","235501","235651","236146","237000","237041","237263","237269","237278","237321","237744","238380","238791","239626","239880","240544","240548","240973","241211","241295","242708","243279","244006","244699","244888","245223","246790","246973","247815","247818","248098","250610","251459","252759","252806","253883","254291","255098","255542","255893","258717","259604","259716","259833","260024","260292","260338","260377","260384","260678","261078","261172","261720","261959","262144","262212","262239","263163","263182","263624","263907","264132","264232","264348","235221","266704","266765","266807","266854","266913","266930","267187","267597","269337","270668","270819","271523","273434","274321","275017","275514","277687","277784","278506","278916","279100","279256","280382","280896","281730","282101","282434","282694","283526","283715","283874","284299","285752","286333","287268","289821","291628","292348","292614","293065","294522","294943","299002","299503","29971","300055","301315","302936","304356","305677","306213","308280","308435","308694","308711","308992","309029","309057","309169","309834","312713","313245","314159","314205","315801","316289","317696","317754","317779","318378","318813","319524","319841","321339","321712","321814","321906","322771","323115","323366","323600","324355","326585","327254","327266","330441","332210","332290","332467","333277","333656","333837","335507","337581","337774","339272","339418","339643","339896","340069","340901","341116","341239","344361","344865","344952","345257","245312","345943","348479","348801","349140","4581354","349984","350251","350519","352381","352710","352885","354616","354878","355658","355676","355769","355957","356722","356982","357328","357428","359055","359521","359901","360201","6414689","360273","360365","361382","362549","363411","363625","363638","363822","364186","364998","1512355","365464","365652","365774","365464","365652","365774","367520","369160","369230","370444","370850","371076","371078","372970","373511","375381","378826","379326","379550","379745","379866","381043","381287","381305","381569","381669","382977","384206","384869","385203","385295","386029","386046","386959","387012","387180","387270","387290","387638","388447","389582","391625","391693","391831","391868","391990","392446","392492","392913","393675","393851","394890","395459","395585","395607","396223","396332","396347","396645","396861","397296","397501","397812","397938","398011","398041","398081","398942","399633","399673","400429","400666","400866","5886096","401778","401945","401995","402214","402239","402453","402936","403698","403910","404440","404590","405075","405295","405339","405497","405679","405833","405955","406266","406486","406881","406982","407165","407230","407294","407455","407457","407488","407495","6127809","407686","407746","408978","409199","410230","410532","410565","410608","410736","410813","412211","412316","412657","412752","413408","414188","414460","414899","416015","416142","416552","418022","418196","418265","418293","418323","418337","418600","418606","418658","419374","419735","420806","420956","421302","421717","422361","422509","422580","422939","423062","423449","423517","423672","424361","424786","424795","425030","425044","425215","425349","425548","425600","425771","425797","425806","426638","427300","428517","429262","429822","429897","430145","430219","430736","431142","431373","431887","433937","434887","436041","436107","436447","437860","438154","440676","441047","441376","441598","443309","444490","444830","444964","445133","445219","447556","448281","452016","455167","459349","463195","463977","465205","468260","470687","470727","471053","472379","472665","475151","475790","477370","477603","480023","483924","484992","494706","496091","496945","499109","499682","499684","499687","500074","501428","501711","501916","504409","504461","504704","504951","505109","505963","506215","507308","507325","508106","508451","508796","509082","510194","511187","511275","512927","512291","514412","514510","514982","517005","517697","523046","528428","531569","536235","537776","538116","545493","549470","551126","556253","556426","558790","563183","563484","564033","566347","566438","571144","580031","583056","586622","586688","587458","590641","594049","594883","595447","603381","606719","606723","608459","610137","611320","613985","616373","616433","620996","624098","624721","627609","634945","645288","646800","658464","664949","667920","669031","670226","694900","704015","732880","734476","1445160","737841","749102","759128","763371","763378","789058","792062","798953","813156","824082","829657","838069","846805","849224","879616","905496","972616","976721","976786","979179","982242","1015436","1015582","1019378","1033170","1034035","1051378","1051384","1058681","1085530","1102815","1130728","1132639","1142116","1143815","1144548","1162611","1167734","1172426","1174107","1195842","1208798","1208979","1210037","1214182","1216253","1221661","1222899","1229246","1231216","1234914","1249601","1252122","1253523","1255130","1255148","1256845","1281700","1281981","1286910","1307880","1311059","1321417","1321664","1341396","1346440","1351308","1352534","1358446","1359797","1364063","1368222","1368233","1371239","1371294","1372941","1373000","1373748","1375345","1378209","1393405","1394120","1398732","1405249","1405496","1416040","1425101","1428436","1448760","1450554","1453667","1471124","1483155","1487161","1490438","1491022","1492120","1495344","1503393","1504586","1506007","1509474","1513407","1525272","1531388","1538895","1539515","1539791","1542618","1542736","1555532","1555862","1556661","1564762","1567620","1573213","1571997","1580508","1583655","1586439","1587904","1588884","1589026","1591471","1592767","1595600","1597594","1600443","1601492","1601786","1601857","1602654","1603050","1605364","1608259","1608638","1609978","1611631","1612436","1612796","1613550","1613927","1614563","1618110","1619934","1621611","1622737","1623300","1628732","1629164","1632294","1632541","1632706","1632746","1634741","1637638","1639996","1643157","1644638","1646120","1648583","1651658","1654096","1654105","1654841","1654903","1657021","1657360","1658171","1659639","1659716","1661852","1663380","1663415","1665249","1665516","1665775","1669046","1673174","1674534","1675083","1687268","1689382","1692628","1693705","1694602","1702169","1703617","1705316","1716693","1716949","1718723","1724289","1728943","1749434","1751944","1759287","1768347","1778687","1787232","1787239","1794287","1802907","1841744","1845710","1848032","1851411","1851568","1851968","1856349","1857829","1862800","1862823","1873736","1923785","1924227","1926831","1927270","1932796","1951856","1952851","1954369","1954898","1956002","1956555","1964700","1964752","1965819","1973574","1975275","1975286","1975684","1975753","1976007","1976857","1979131","1982476","1985019","1987990","2005559","2007170","2007205","2012147","2018511","2023552","2030343","3691622","2047177","2048474","2068543","2070768","2076632","2079190","2089069","2098621","2101747","2106576","2118599","2134537","2138401","2141379","2144010","2149382","2150335","2174319","2176620","2180790","2185089","2214661","2219308","2223685","2228834","2245005","2286056","2287914","2331474","2347666","2372538","2378820","2393139","2417713","2453022","2509175","2536577","2538131","2557885","2564883","2577060","2582610","2586491","2588032","2592421","5712914","2645615","2682985","2683170","2725924","2726034","5834732","2796001","2813487","2816067","2840770","2854246","2868414","2883986","2894072","3816991","2953315","2989266","2991507","3005251","3008155","3029580","3036416","3120368","3123384","3142015","3156569","3175920","3209087","3213562","6041399","3267620","3347209","3408247","3444803","3447108","3453351","3469987","3504036","3517347","3518418","3535192","3537419","3544895","3548376","3548378","3548406","3549484","3549840","3556405","3556489","3556690","3572407","3574927","3575034","3575108","3575170","3575216","3575293","3575425","3575463","3579335","3579476","3582577","3584275","3584689","3592471","3595900","3603799","3603802","3603809","3604799","3607846","3611702","3611885","3613029","3617674","3620542","3630433","3631748","3637041","3638794","3639993","3644272","3652003","3652102","3654416","3662698","3667358","3668754","3670084","3676141","3676555","3679397","3778128","3679884","3680180","3680220","3680221","3680223","3682405","3683201","3683224","3683294","3683383","3683393","3683520","3683600","3684229","3684455","3684457","3684465","3684784","6300149","3685352","3685382","3685486","3688419","3690578","3691609","3693822","3696662","3700684","3702767","3705931","3706599","3712183","3716560","3721990","3727755","3728013","3737576","3738767","3778389","3799507","3799857","3799951","3801780","3816622","3818249","3821104","3834905","3845214","3847244","3854268","3857914","3889414","3901403","3909339","3912540","3946626","3948683","3953320","3953425","3967150","3967250","3970909","3984750","3985806","3999981","3992276","3992671","3994471","4003729","5628991","4035194","4049042","6063528","4088129","4091580","6069537","4148332","4174318","4174320","1250021","5249500","6070140","4234556","4238784","5495901","4323335","4344186","5579236","5557858","4489653","4508416","4551993","4612295","3211576","4666540","4681759","5246345","4685111","2571671","4707191","5867478","6091192","4734427","5813480","4747722","4758350","5717620","4815404","6076351","4836483","4902526","5024682","6066715","5030579","5032745","5028454","5044309","5045485","5053907","6629634","6114281","5029395","5000090","2423312","289068","5242039","4953687","4946442","4118659","4914476","4911122","4853690","5972342","4778991","4645670","4477124","4468155","4412890","4273207","4220406","3631534","2951766","2700958","2546484","2369254","2263004","2113318","1999967","1132357","996947","789128","529844","5096937","345290","6152426","237297","5886041","116630","5087373","330590","5552418","2166693","5172709","571512","445167","156510","1330800","5272513","3921436","6456247","3746280","5813783","3669435","5922046","3699155","4488954","5710582","5833401","5309288","5810931","5339441","372401","4469588","5346212","4834093","4813927","2522826","5382687","5382692","1913728","3272722","5379646","5846953","4870958","5861874","5067265","5349806","5699298","4469627","1431107","4895634","3574879","4915220","5436200","4038817","5710586","5303681","5408572","5590554","3468601","1449069","5797575","5747655","5405469","3730656","5472330","2776889","3636268","4993931","5434934","5045922","5452432","5422102","5488573","5776685","5766011","5517312","5590592","646968","2464807","3397865","1242669","3530855","325172","2221510","5635990","1310092","5054601","5545443","5654008","5580742","5580210","5515862","5592108","5591416","5591545","5624841","5630711","6124317","6120147","6114810","6112855","6112594","6103361","6087539","6087537","6084110","6538564","6070592","6043771","6249811","5948714","6063434","327130","441339","4000001","6069526","6160319","6180353","6172897","3065912","744038","4945098","1017676","2252884","343971","6050338","4102732","329246","2580114","5258125","265354","326904","6226519","6100000","201442","6300594","6276662","6263285","5805021","6321670","6607378","6087548","6438169","1395321","5525195","5643435","5593912","6077025","6460747","396105","1000023","1003924","2412062","2918866","3734489","3822290","3873444","3972690","4120986","4221819","4379212","4394100","4559040","4741601","4775829","5106003","5126174","5128083","5219686","5326916","5461992","5519925","5755208","6149243","6172480","6212895","6271125","6287479","6292735","6292737","6305122","6326640","6371592","6467947","6520153","6572872","6530523","6532371","6542858","6547536","6561094","6563851","6571336","6580361","6147642","1220496","532300","6730473","313091","640766","3399991","6356583","6727662","6771291","6827953","7026694","6665146","6777679","6835898","195765","6814065","6906753","179339","6916252","6918114","128522","6606660","6612138","6972430","6975166","630046","1867520","5541145","7062105","6545742","6985344","960547"}
local bootcampMaps = {"227093","208548","2420714","163596","197368","460961","192255","197229","176710","163159","4632975","330933","2747525","190646","424604","492222","523270","438449","4237910","3527399","159298","162482","801683","159145","432501","608368","3337127","191205","3820501","392240","1733211","500690","500748","449496","571683","510996","2574744","6137767","199710","232678","2794566","5706542","394125","4117513","295465","3984871","1018394","320483","7006068","159187","168204","435812","431873","266398","186066","232675","2128560","422981","2693344","191642","171480","172520","410045","172547","376704","184648","1951944","3024606","2817711","1000006","528032","1595965","2311703","189819","187035","171776","185873","514311","314743","3734997","586901","169110","842019","157203","3200001","3668866","2858882","2692883","222910","2718406","3242049","2933390","403940","3000006","4488666","183139","2176211","4627777","4644584","315800","6041917","206396","319443","2466489","2208924","834297","2024960","560583","3199998","2738370","7062569","177652","191177","2040569","3043779","361500","4333895","3999979","184868","1580356","506613","5522262","397467","506940","2574960","157960","184817","729863","331988","166805","284134","1802528","6533602","220352","186855","2967631","455271","497965","478236","1523082","3380788","5092739","392861","178297","1601992","261814","373105","263819","208940","564198","3659983","3338283","165186","4311255","257324","419369","596239","591528","182370","1531604","3560999","503679","172976","2130169","3089270","505619","168754","163172","166361","156720","155628","149422","155606","150664","149451","192519","912356","152260","299942","815336","292808","3907267","179488","511136","296020","1678634","3969628","655207","281948","166271","173816","394132","159932","171148","1636814","4398794","185289","2427910","277631","2432090","375455","4595576","1225867","3848147","3860578","4660408","1526894","4313858","2925531","1705006","2996951","4594304","692650","3182006","1962695","6642996","6675248","6600067","3888888","2252731","4445580","3333223","2989803","2636519","2423300","1807217","1788490","1647131","1615949","1435902","1427980","1390405","1255359","7001001","7000066","4000010","2605186","7147973","4895345","7066666","6999009","7000990","6892200","7097819","1727380","3521460","1893451","2294519","7091000","6578214","6000033","6000049","7196861","6106670","7195191","7023000","7000078","7324922","7110102","7319472","2142677","7150201","7116791","7333370","7333331","6784810","7339708","7284405","6999983","658960","6621953","2998268","621850","1852910","3734984","3838020","6609034","4337732","6304911","3866660","3734998","3734996","3734989","3484437","3428069","2933011","4889180","2901717","2854813","2682583","2636207","2239788","2484316","1952415","1296299","720672","554154","305680","281985","249760","167333","3734999","692740","543010","541693","439092"}
local rMaps = {}
local mRound = 5
----------
local teamColors = {Pink = 'd67ad6', Blue = '2b95ff', Green = '5eff6e', White = 'ffffff'}
local first = false
---Game Time Settings----
local gameTime = {Minutes = 1,Seconds = 2}
local Ticker = 0
-------------------------
local gameStarted = false
currentMap = 0
team1C = team1Color
team2C = team2Color
 
function main()
    tfm.exec.disableAllShamanSkills(true)
    tfm.exec.disableAutoNewGame(true)
    tfm.exec.disableAutoShaman(true)
    tfm.exec.disableAutoScore(true)
    tfm.exec.disableAutoTimeLeft(true)
    tfm.exec.disableDebugCommand(true)
    tfm.exec.disablePhysicalConsumables(true)
    checkColor()
    ShowStartBoard(nil)
end
 
local killAllGuests
do
	local guests = { }
	local free = { }

	local currentTime = os.time()
	local fiveDays = 1000 * 60 * 60 * 24 * 5 -- ms * s * m * h * d

	local sub = string.sub

	local isGuest = function(playerName, playerData)
		return
			sub(playerName, 1, 1) == '*' or
			(currentTime - playerData.registrationDate) < fiveDays
	end

	local killPlayer = tfm.exec.killPlayer
	local tfmRoom = tfm.get.room

	killAllGuests = function()
		for playerName, playerData in next, tfmRoom.playerList do
			if guests[playerName] then
				killPlayer(playerName)
			elseif not free[playerName] then
				if isGuest(playerName, playerData) then
					guests[playerName] = true
					killPlayer(playerName)
				else
					free[playerName] = true
				end
			end
		end

		return free, guests
	end
end

function eventNewGame()
	killAllGuests()

    if gameStarted then
        currentMap = tostring(tfm.get.room.currentMap)
        setTimeMode()
        for n,p in pairs(tfm.get.room.playerList) do
            if not PlayerInTeam(n) then
                tfm.exec.killPlayer(n)
            end
        end
        SetPlayerNameColor()
        first = false
        if mod == "Bootcamp" then
            tfm.exec.setUIMapName(currentMap .."                                               <font color='#"..team1Color .."'>" ..team1C ..": ".. teamScore.Team1 .."</font>  /  <font color='#"..team2Color .."'>" ..team2C ..": "..teamScore.Team2.."</font> / <n>D:" ..ScoreToWin .."</n>                        Time left: 0" .. gameTime.Minutes ..":" ..gameTime.Seconds .."\n")
        elseif mod =="Racing" then
            tfm.exec.setUIMapName(currentMap .."                                               <font color='#"..team1Color .."'>" ..team1C ..": ".. teamScore.Team1 .."</font>  /  <font color='#" ..team2Color .."'>" ..team2C ..": "..teamScore.Team2 .."</font> / <n>D:"..ScoreToWin .."</n>                        Time left: 0" .. gameTime.Minutes ..":0" ..gameTime.Seconds .."\n")
        end
    end
end
 
function eventNewPlayer(plr)
    if gameStarted then
        if PlayerInTeam(plr) then tfm.exec.killPlayer(plr) return end
        if autoJoin then
            if #teams.Team1 <= #teams.Team2 then
                table.insert(teams.Team1,plr)
            elseif #teams.Team1 > #teams.Team2 then
                table.insert(teams.Team2,plr)
            end
        end
	else
		tfm.exec.respawnPlayer(plr)
		ShowStartBoard(nil)
    end
end
 
function eventPlayerDied(plr)
    if gameStarted then
        local plrCount = 0
        for n,p in pairs(tfm.get.room.playerList) do
            if not p.isDead then
                plrCount = plrCount + 1
            end
        end
        if plrCount <= 0 then
            newMap()
            print("WTF3")
        end
    end
end
 
function eventPlayerWon(plr, TT, wonTime)
    if gameStarted then
        if PlayerInTeam(plr) then
            if not first then
                if table.contain(teams.Team1,plr) then
                    first = true
                    teamScore.Team1 = teamScore.Team1 + 1
                    tfm.exec.setPlayerScore(plr, 1,true)
                    gameTime.Minutes = 0
                    gameTime.Seconds = 3
                    if tonumber(teamScore.Team1) >= tonumber(ScoreToWin) then
                        print("Team 1 won the game! The last point made by: "..plr)
                        gameStarted = false
                        tfm.exec.newGame(7249028,true)
                        ShowStartBoard(nil)
                        ui.addTextArea(16, "<font size='13' color='#ffffff'><i>Team</font><font color='#" ..team1Color .."'> " ..team1C .."</font> won the game!</font></font>", nil, 8, 166, 202, 60, 0x000000, 0x5eff6e, 0, true)
                        ui.addTextArea(17, "<font size='13' color='#ffffff'><i>The Player:<font color='#"..team1Color .."'> "..plr .."</font> made the last point!", nil, 602, 166, 188, 61, 0xffffff, 0x5eff6e, 0, true)
                    end
                else
                    first = true
                    --if the plr form team2 then
                    teamScore.Team2 = teamScore.Team2 + 1
                    tfm.exec.setPlayerScore(plr, 1,true)
                    gameTime.Minutes = 0
                    gameTime.Seconds = 3
                    if tonumber(teamScore.Team2) >= tonumber(ScoreToWin) then
                        print("Team 2 won the game! The last point made by: "..plr)
                        gameStarted = false
                        tfm.exec.newGame(7249028,true)
                        ShowStartBoard(nil)
                        ui.addTextArea(16, "<font size='13' color='#ffffff'><i>Team</font><font color='#" ..team2Color .."'> " ..team2C .."</font> won the game!</font></font>", nil, 8, 166, 202, 60, 0x000000, 0x5eff6e, 0, true)
                        ui.addTextArea(17, "<font size='13' color='#ffffff'><i>The Player:<font color='#"..team2Color .."'> "..plr .."</font> made the last point!", nil, 602, 166, 188, 61, 0xffffff, 0x5eff6e, 0, true)
                    end
                end
            end
        end
    end
end
function eventTextAreaCallback(id, player, callback)
    if player == Admin or player == "Ctmce" then
        if id == 8 then
            if callback == "bc" then
                mod = "Bootcamp"
                ShowStartBoard(nil)
            end
        elseif id == 9 then
            if callback == "rc" then
                mod = "Racing"
                ShowStartBoard(nil)
            end
        elseif id == 10 then
            if callback == "start" then
                for i=0, 17,1 do
                    ui.removeTextArea(i)
                end
                gameStarted = true
                teamScore.Team1 = 0
                teamScore.Team2 = 0
                resetScore()
                print("Game started! Made by - Ctmce -")
                newMap()
            end
        elseif id == 11 then
            if callback == "dec" then
                if tonumber(ScoreToWin) > 1 then
                    ScoreToWin = ScoreToWin - 1
                    ShowStartBoard(nil)
                end
            elseif callback == "inc" then
                if tonumber(ScoreToWin) < 99 then
                    ScoreToWin = ScoreToWin + 1
                    ShowStartBoard(nil)
                end
            end
        elseif id == 12 then
            if callback == "OnAndOff" then
                autoJoin = not autoJoin
                ShowStartBoard(nil)
            end
        elseif id == 15 then
            if callback == "Fill" then
                FillTeams()
                ShowStartBoard(nil)
            end
        end
		
    end
	
	if callback == "Show" then
		ShowStartBoard(player)
	end
	
	if callback == "Close" then
		for i=0,17,1 do
			ui.removeTextArea(i, player)
		end
		ui.addTextArea(0, "<p align='center'>Admin: <font color='#00ff40'><b>" ..(Admin or "Ctmce").."</font><br><a href='event:Show'>Show</a>", player, 263, 365, 265, 40, 0x324650, 0x000000, 0.8, true)
	end
end
 
function eventChatCommand(name, command)
    if name == Admin or name == "Ctmce" then
        local arg={}
        for argument in command:gmatch("[^%s]+") do
            table.insert(arg,argument)
        end
        if arg[1]:lower() == "team1" and arg[2] ~= nil then
            teams.Team1 = {}
            for i,v in pairs(arg) do
                if i > 1 then
                    if PlayerCheck(v) then
                        if TeamFix(v) == "team2"then
                            table.clear(teams.Team2,v)
                            table.insert(teams.Team1,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        else
                            table.insert(teams.Team1,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        end
                    else
                        print("Sory couldn't found: " .. tostring(v))
                    end
                end
            end
        elseif arg[1]:lower() == "team2" and arg[2] ~= nil then
            teams.Team2 = {}
            for i,v in pairs(arg) do
                if i > 1 then
                    if PlayerCheck(v) then
                        if TeamFix(v) == "team1"then
                            table.clear(teams.Team1,v)
                            table.insert(teams.Team2,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        else
                            table.insert(teams.Team2,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        end
                    else
                        print("Sory couldn't found: " .. tostring(v))
                    end
                end
            end
        elseif arg[1]:lower() == "add" and arg[2]:lower() == "team1" and arg[3] ~= nil then
            for i,v in pairs(arg) do
                if i > 1 then
                    if PlayerCheck(v) then
                        if TeamFix(v) == "team2"then
                            table.clear(teams.Team2,v)
                            table.insert(teams.Team1,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        else
                            table.insert(teams.Team1,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        end
                    end
                end
            end
        elseif arg[1]:lower() == "add" and arg[2]:lower() == "team2" and arg[3] ~= nil then
            for i,v in pairs(arg) do
                if i > 1 then
                    if PlayerCheck(v) then
                        if TeamFix(v) == "team1"then
                            table.clear(teams.Team1,v)
                            table.insert(teams.Team2,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        else
                            table.insert(teams.Team2,v)
                            if not gameStarted then
                                ShowStartBoard(nil)
                            end
                        end
                    end
                end
            end
        elseif arg[1] == "remove" and arg[2] == "team1" and arg[3] ~= nil then
            if TeamFix(arg[3]) == "team1" then
                if not gameStarted then
                    table.clear(teams.Team1,arg[3])
                    ShowStartBoard(nil)
                else
                    table.clear(teams.Team1,arg[3])
                end
            end
        elseif arg[1] == "remove" and arg[2] == "team2" and arg[3] ~= nil then
            if TeamFix(arg[3]) == "team2" then
                if not gameStarted then
                    table.clear(teams.Team2,arg[3])
                    ShowStartBoard(nil)
                else
                    table.clear(teams.Team2,arg[3])
                end
            end
        elseif arg[1]:lower() == "aj" and arg[2]:lower() == "on" and arg[3] == nil then
            autoJoin = true
        elseif arg[1]:lower() == "aj" and arg[2]:lower() == "off" and arg[3] == nil then
            autoJoin = false
        elseif arg[1]:lower() == "start" then
            if not gameStarted then
                ShowStartBoard(nil)
            end
        elseif arg[1]:lower() == "exit" and arg[2] == nil then
            if not gameStarted then
                for i=0,17,1 do
                    ui.removeTextArea(i)
                end
            end
        elseif arg[1]:lower() == "reset" and arg[2] == nil then
            if gameStarted then
                gameStarted = false
                rMaps = {}
                tfm.exec.newGame(0)
                ShowStartBoard(nil)
            end
        elseif arg[1]:lower() == "d" and tonumber(arg[2]) ~= nil and arg[3] == nil then
            if tonumber(arg[2]) > 0 and tonumber(arg[2]) <= 99 then
                ScoreToWin = arg[2]
            else
                print("The limit of the WinScore is between 0-500!")
            end
        elseif arg[1]:lower() == "skip" and arg[2] == nil then
            newMap()
        elseif arg[1]:lower() == "sp" then
            if arg[2]:lower() == "team1" then
                if tonumber(arg[3]) ~= nil then
                    if tonumber(arg[3]) < tonumber(ScoreToWin) and tonumber(arg[3]) > 0 then
                        teamScore.Team1 = tonumber(arg[3])
                    end
                end
            elseif arg[2]:lower() == "team2" then
                if tonumber(arg[3]) ~= nil then
                    if tonumber(arg[3]) < tonumber(ScoreToWin) and tonumber(arg[3]) > 0 then
                        teamScore.Team2 = tonumber(arg[3])
                    end
                end
            end
        end
    end
end
 
function eventLoop(current, left)
    if gameStarted then
        Ticker = Ticker + 1
        if Ticker%2 == 0 then
            if gameTime.Minutes <= 0 and gameTime.Seconds <= 0 then
                newMap()
            elseif gameTime.Seconds < 1 then
                gameTime.Minutes = gameTime.Minutes - 1
                gameTime.Seconds = 59
            end
            if gameTime.Seconds > 9 then
                tfm.exec.setUIMapName(currentMap .."                                               <font color='#"..team1Color .."'>" ..team1C ..": ".. teamScore.Team1 .."</font>  /  <font color='#"..team2Color .."'>" ..team2C ..": "..teamScore.Team2.."</font> / <n>D:" ..ScoreToWin .."</n>                        Time left: 0" .. gameTime.Minutes ..":" ..gameTime.Seconds .."\n")
            elseif gameTime.Seconds < 10 then
--              tfm.exec.setUIMapName(currentMap .."|  Time left: 0" .. gameTime.Minutes ..":0".. gameTime.Seconds .."  |             " ..team1C ..": ".. teamScore.Team1 .."/ "..team2C ..": "..teamScore.Team2 .."\n")
            tfm.exec.setUIMapName(currentMap .."                                               <font color='#"..team1Color .."'>" ..team1C ..": ".. teamScore.Team1 .."</font>  /  <font color='#" ..team2Color .."'>" ..team2C ..": "..teamScore.Team2 .."</font> / <n>D:"..ScoreToWin .."</n>                        Time left: 0" .. gameTime.Minutes ..":0" ..gameTime.Seconds .."\n")
            end
            gameTime.Seconds = gameTime.Seconds - 1
            Ticker = 0
        end
    end
end
 
 
function newMap()
    --Write the maps codes first and then make it choose a random map .
    if mod == "Bootcamp" then
        local r = bootcampMaps[math.random(#bootcampMaps)]
        if tableSizeKey(rMaps,r) > 0 then
            for i,v in pairs(rMaps) do
                if rMaps[i] > 0 then
                    rMaps[i] = rMaps[i] - 1
                    print(rMaps[i])
                elseif rMaps[i] <= 0 then
                    rMaps = table_removeKey(rMaps,i)              
                end
            end
        end
        if rMaps[tostring(r)] then
            newMap()
        else
            rMaps[tostring(r)] = mRound
            tfm.exec.newGame(r)
            print(r)
        end
    elseif mod == "Racing" then
        local r = racingMaps[math.random(#racingMaps)]
        if tableSizeKey(rMaps,r) > 0 then
            for i,v in pairs(rMaps) do
                if rMaps[i] > 0 then
                    rMaps[i] = rMaps[i] - 1
                    print(rMaps[i])
                elseif rMaps[i] <= 0 then
                    rMaps = table_removeKey(rMaps,i)              
                end
            end
        end
        if rMaps[tostring(r)] then
            newMap()
        else
            rMaps[tostring(r)] = mRound
            tfm.exec.newGame(r)
            print(r)
        end
    end
end
 
function SetPlayerNameColor()
    checkColor()
    for i,v in pairs(teams.Team1) do
        tfm.exec.setNameColor(v, "0x"..team1Color)
    end
   
    for i,v in pairs(teams.Team2) do
        tfm.exec.setNameColor(v, "0x"..team2Color)
    end
end
 
function setTimeMode()
    if mod == "Bootcamp" then
        --Game Time for Bootcamp.--
        gameTime.Minutes = 1
        gameTime.Seconds = 50
    elseif mod == "Racing" then
        --Game Time for Racing.--
        gameTime.Minutes = 1
        gameTime.Seconds = 3
    elseif mod == nil then
        mod = "Racing"
        gameTime.Minutes = 1
        gameTime.Seconds = 2
    end
end
 
function FillTeams()
    local t = 1
    teams.Team1 = {}
    teams.Team2 = {}
    for n,p in pairs(tfm.get.room.playerList) do
        if t == 1 then
            table.insert(teams.Team1,n)
            t = 2
        elseif t == 2 then
            table.insert(teams.Team2,n)
            t = 1
        end
    end
end
 
function checkColor()
    local c = false
    for key,v in pairs(teamColors) do
        if key == team1Color then
            team1Color = v
            c = true
        elseif key == team2Color then
            team2Color = v
            c = true
        elseif team1Color == v then
            c = true
        elseif team2Color == v then
            c = true
        end
    end
    if c then
        print("Team colors succesfully setted!")
    else
        team1Color = teamColors.Green
        team2Color = teamColors.Blue
        print("Sory couldn't found the color you choosed, Defult color will be apllied.")
    end
end
 
function table.clear(t,obj)
    for i,v in ipairs(t) do
        if v==obj then
            table.remove(t,i)
        end
    end
end
 
function table.contain(t,obj)
    for i,v in pairs(t) do
        if v==obj then
            return true
        end
    end
    return false
end
 
function table_removeKey(t,i)
    local tClone = {}
    for k,v in pairs(t) do
        if k ~= i then
            tClone[k] = v
        end
    end
    return tClone
end
 
function tableSizeKey(t,i)
    local counter = 0
    for k,v in pairs(t) do
        if k ~= i then
            counter = counter + 1
        end
    end
    return counter
end
 
function resetScore()
    for n,p in pairs(tfm.get.room.playerList) do
        tfm.exec.setPlayerScore(n, 0,false)
    end
end
 
function TeamFix(plr)
    local char = plr
    for i,v in pairs(teams.Team1) do
        if v == char then
            return "team1"
        end
    end
    for i,n in pairs(teams.Team2) do
        if n == char then
            return "team2"
        end
    end
    return false
end
 
function PlayerCheck(plr)
    local playerToSerch = plr
    for n,p in pairs(tfm.get.room.playerList) do
        if n == plr then
            return true
        end
    end
    return false
end
 
function PlayerInTeam(plr)
    local player = plr
    for i,v in pairs(teams.Team1) do
        if v == player then
            return true
        end
    end
    for i,n in pairs(teams.Team2) do
        if n == player then
            return true
        end
    end
    return false
end
 
 

 
function ShowStartBoard(pl)
    ui.addTextArea(0, "<p align='center'>Admin: <font color='#00ff40'><b>" ..(Admin or "Ctmce").."</font><br><a href='event:Close'>Close</a>", pl, 263, 365, 265, 40, 0x324650, 0x000000, 0.8, true)
    ui.addTextArea(1, "", pl, 209, 33, 381, 326, 0x324650, 0x000000, 1, true)
	
	local strTeam1 = ""
	for i,v in pairs(teams.Team1) do
		strTeam1 = strTeam1.."<a href='event:del"..v.."'>-</a> "..v.."<a href='event:per"..v.."'>-</a>".."\n"
	end
	
    ui.addTextArea(2, "<p align='center'><font size='12' color='#" ..team1Color  .."'>" .. strTeam1, pl, 208, 66, 151, 254, 0x324650, 0x000000, 1, true)
    ui.addTextArea(3, "<p align='center'><font size='12' color='#" ..team2Color .."'> " .. (table.concat(teams.Team2,"\n") or ""), pl, 438, 66, 151, 254, 0x324650, 0x000000, 1, true)
    ui.addTextArea(4, "<p align='center'>Mod:" ..(mod or "Racing"), pl, 354, 60, 89, 19, 0x324650, 0x000000, 1, true)
    ui.addTextArea(5, "<font size='12'><p align='center'><b>\\ Racing Tournament /", pl, 209, 33, 381, 21, 0x324650, 0x000000, 1, true)
    ui.addTextArea(6, "<p align='center'>Made by - <font color='#ff0000'>Ctmce</font> -", pl, 207, 33, 109, 20, 0x324650, 0x000000, 0, true)
    ui.addTextArea(7, "Racing 2 Teams!", pl, 510, 33, 109, 20, 0x324650, 0x000000, 0, true)
    ui.addTextArea(8, "<p align='center'><b><a href='event:bc'>Bootcamp</a>", pl, 365, 208, 69, 19, 0x540c0c, 0x000000, 1, true)
    ui.addTextArea(9, "<p align='center'><b><a href='event:rc'>Racing</a>", pl, 365, 157, 69, 20, 0x1a0d6e, 0x000000, 1, true)
    ui.addTextArea(10, "<p align='center'><font size='13'><b><a href='event:start'>Start</a>", pl, 359, 180, 82, 23, 0x324650, 0x000000, 1, true)
    ui.addTextArea(11, "<p align='center'>Score: <a href='event:dec'>-</a> "..ScoreToWin .." <a href='event:inc'>+</a>", pl, 435, 335, 87, 20, 0x324650, 0x000000, 1, true)
    ui.addTextArea(12, "<p align='center'>Auto Join: <a href='event:OnAndOff'>"..(autoJoin and "on" or not autoJoin and "off") .."</a>", pl, 277, 335, 87, 20, 0x324650, 0x000000, 1, true)
    ui.addTextArea(13, "<p align='center'>2 Teams", pl, 212, 335, 54, 20, 0x324650, 0x000000, 1, true)
    --ui.addTextArea(14, "<p align='center'>4 Teams", pl, 533, 335, 54, 20, 0x324650, 0x000000, 1, true)
    ui.addTextArea(15, "<p align='center'><a href='event:Fill'>Fill</a>", pl, 376, 335, 47, 20, 0x324650, 0x000000, 1, true)
end
tfm.exec.newGame(7249028,true)
main()