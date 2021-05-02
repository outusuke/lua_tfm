
--дамки ходят дальше 



party = {}--массив, board

players_images = {}


symbol_piece_mass = {'♚', '♛', '♜', '♝', '♞', '♟', '*', '&'}
color_piece_mass = {'FFFFFF', 'FF00FF', 'FFFF00', 'FF0000', '00FFFF', '000000'}


-- Board
local setBoard = function()
	return
	{
		-- {43, 45, 44, 42, 41},
		-- {46, 46, 46, 46, 46},
		
		-- {0, 0, 0, 0, 0},
		-- {0, 0, 0, 0, 0},		
		-- -- --{0, 0, 0, 0, 0, 0, 0, 0, nil, 0},
		-- -- --{0, 0, 0, 0, 0, 0, 0, 0, nil, 0},
		
		-- {16, 16, 16, 16, 16},
		-- {13, 15, 14, 12, 11}
	--------------------------------------------------------------
		{63, 65, 64, 62, 61, 64, 65, 63},
		{66, 66, 66, 66, 66, 66, 66, 66},
		{0, 0, 0, 0, 0, 0, 0, 0},
		
		-- {0, 0, 0, 0, 0, 0, 0, 0},
		-- {0, 0, 0, 0, 0, 0, 0, 0},		
		{0, 0, 0, nil, nil, 0, 0, 0},
		{0, 0, 0, nil, nil, 0, 0, 0},
		
		{0, 0, 0, 0, 0, 0, 0, 0},
		{16, 16, 16, 16, 16, 16, 16, 16},
		{13, 15, 14, 12, 11, 14, 15, 13}
	--------------------------------------------------------------
		
		-- {0, 27, 0, 27, 0, 27, 0, 27},
		-- {27, 0, 27, 0, 27, 0, 27, 0},
		-- {0, 15, 0, 27, 0, 27, 0, 27},
		-- {18, 0, 17, 0, 17, 0, 17, 0},
		-- {0, 17, 0, 17, 0, 17, 0, 17},
		-- {17, 0, 17, 0, 17, 0, 17, 0}
	--------------------------------------------------------------
		
		-- {0, 0, 0, 0, 0, 0, 0, 0},
		
		-- {0, 0, 0, 0, 0, 0, 0, 0},
		
	--------------------------------------------------------------
		-- {53, 55, 54, 52, 51, 54, 55, 53},
		-- {56, 56, 56, 56, 0, 56, 56, 56},
		-- {0, 0, 0, 0, 0, 0, 0, 0, 0, 33},
		-- {0, 0, 0, 0, 56, 0, 0, 0, 0, 41},
		-- {0, 0, 0, 0, 16, 0, 0, 0, 0, 24},
		-- {0, 0, 0, 0, 0, 0, 0, 0, 0, 65},
		-- {16, 16, 16, 16, 0, 16, 16, 16},
		-- {13, 15, 14, 12, 11, 14, 15, 13}
	--------------------------------------------------------------
		
		-- {0, 27, 0, 27, 0, 27, 0, 27},
		-- {27, 0, 27, 0, 27, 0, 27, 0},
		-- {0, 27, 0, 27, 0, 27, 0, 27},
		-- {0, 0, 0, 0, 0, 0, 0, 0},
		-- {0, 0, 0, 0, 0, 0, 0, 0},
		-- {17, 0, 17, 0, 17, 0, 17, 0},
		-- {0, 17, 0, 17, 0, 17, 0, 17},
		-- {17, 0, 17, 0, 17, 0, 17, 0}
	--------------------------------------------------------------
		
		
	}
end

local board = setBoard()

local piece_ts = {
	king = 1,
	queen = 2,
	rook = 3,--ладья
	bishop = 4,--слон
	knight = 5,--конь
	pawn = 6,--пешка
	checker = 7,--шашка
	checker_queen = 8--дамка
}

piece_ts_img = {
	{--white
		{"178fee23398.png", 0, 0, 1, 1}, 
		{"178fee2a8cf.png", 0, 0, 1, 1}, 
		{"178fee40874.png", 0, 0, 1, 1}, 
		{"178fee31e06.png", 0, 0, 1, 1}, 
		{"178fee3933d.png", 0, 0, 1, 1}, 
		{"178fee47dad.png", 0, 0, 1, 1},
		
		{"178fee4f2e4.png", 0, 0, 1, 1}, 
		{"178fee50a55.png", 0, 0, 1, 1}
	},
	{--pink
		{"178fee24b09.png", 0, 0, 1, 1}, 
		{"178fee2d7b2.png", 0, 0, 1, 1}, 
		{"178fee41fe6.png", 0, 0, 1, 1}, 
		{"178fee33577.png", 0, 0, 1, 1}, 
		{"178fee3aaaf.png", 0, 0, 1, 1}, 
		{"178fee49520.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1}
	}
	,
	{--yellow
		{"178fee2627b.png", 0, 0, 1, 1}, 
		{"178fee2ef23.png", 0, 0, 1, 1}, 
		{"178fee43757.png", 0, 0, 1, 1}, 
		{"178fee34ce9.png", 0, 0, 1, 1}, 
		{"178fee3c220.png", 0, 0, 1, 1}, 
		{"178fee4ac93.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1}
	}
	,
	{--red
		{"178fee279eb.png", 0, 0, 1, 1}, 
		{"178fee2c03e.png", 0, 0, 1, 1}, 
		{"178fee44ec8.png", 0, 0, 1, 1}, 
		{"178fee3645a.png", 0, 0, 1, 1}, 
		{"178fee3d9a0.png", 0, 0, 1, 1}, 
		{"178fee4c404.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1}
	}
	,
	{--blue
		{"178fee2915d.png", 0, 0, 1, 1}, 
		{"178fee30694.png", 0, 0, 1, 1}, 
		{"178fee4663a.png", 0, 0, 1, 1}, 
		{"178fee37bcb.png", 0, 0, 1, 1}, 
		{"178fee3f101.png", 0, 0, 1, 1}, 
		{"178fee4db73.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1}
	}
	,
	{--black
		{"178fee1a6f1.png", 0, 0, 1, 1}, 
		{"178fee1be61.png", 0, 0, 1, 1}, 
		{"178fee204b5.png", 0, 0, 1, 1}, 
		{"178fee1d5d2.png", 0, 0, 1, 1}, 
		{"178fee1ed43.png", 0, 0, 1, 1}, 
		{"178fee21c27.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1}
	}
	
}


function showBoard(p, number_board, bool_show_board)
----print(p)
if party[number_board]==nil then
	return
end


	for i,j in pairs(party[number_board][1]) do
		
		for i2,j2 in pairs(party[number_board][1][i]) do
		
		------print(i.."L"..j2)
			showBoardSquare(i, i2, p, bool_show_board)
		end
	end
end

image_board = {
	
	{{"178fee5c66f.png", 0, 0, 1, 1}, {"178fee521c8.png", 0, 0, 1, 1}},
	{{"178fee5f556.png", 0, 0, 1, 1}, {"178fee550b0.png", 0, 0, 1, 1}},
	{{"178fee5dde2.png", 0, 0, 1, 1}, {"178fee5393a.png", 0, 0, 1, 1}}
	
}

image_choose = {
	{{"178fee57f8f.png", 0, 0, 1, 1}, {"178fee5681e.png", 0, 0, 1, 1}}
}

function string.split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end



function showBoardSquare(row, column, pl, bool_show_board)
	local setting_pl_party = players_images[pl][3][1]
	
	if party[setting_pl_party][1][row]==nil then
		return
	end
	
	local square = party[setting_pl_party][1][row][column]
	
	local testsmesh = 0
	
	if pl == "Deff83#0000" then
		testsmesh = 0
	end
	
	------print(pl..">"..row..":"..column)
	
	
	if (square~=nil) then
		if bool_show_board then
			if (row+column)%2 == 1 then
				if players_images[pl][1][row*100+column]~= nil then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
				end
				players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[1][1][1], "?1", image_board[1][1][2]+column*44+200+testsmesh, image_board[1][1][3]+row*44-22, pl, image_board[1][1][4], image_board[1][1][5], 0, 1)
			else
				if players_images[pl][1][row*100+column]~= nil then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
				end
				players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[1][2][1], "?1", image_board[1][2][2]+column*44+200+testsmesh, image_board[1][2][3]+row*44-22, pl, image_board[1][2][4], image_board[1][2][5], 0, 1)
			end
			
			if party[setting_pl_party][2] ~= nil then
				
				if (party[setting_pl_party][2][1][1] == row) and (party[setting_pl_party][2][1][2] == column) then
					----print("tyt")
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[2][1][1], "?2", image_board[2][1][2]+party[setting_pl_party][2][1][2]*44+200+testsmesh, image_board[2][1][3]+party[setting_pl_party][2][1][1]*44-22, pl, image_board[2][1][4], image_board[2][1][5], 0, 1)
				end
				if (party[setting_pl_party][2][2][1] == row) and (party[setting_pl_party][2][2][2] == column) then
				----print("tyt2")
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[2][1][1], "?2", image_board[2][1][2]+party[setting_pl_party][2][2][2]*44+200+testsmesh, image_board[2][1][3]+party[setting_pl_party][2][2][1]*44-22, pl, image_board[2][1][4], image_board[2][1][5], 0, 1)
				end
			end
		end
		

		
		local color_piece_t = math.floor(square/10)+0
		local item_piece_t = square%10
		
		------print(square)
		if players_images[pl][2]~=nil then
			if players_images[pl][2][row*100+column] ~= nil then
			------print(players_images[pl][2][1*100+1])
		--	----print(row..":"..column)
				------print(players_images[pl][2][row*100+column])
				tfm.exec.removeImage(players_images[pl][2][row*100+column])
			end
			if (square ~= 0) and item_piece_t~=0 and color_piece_t~=0 and piece_ts_img[color_piece_t]~=nil and piece_ts_img[color_piece_t][item_piece_t]~=nil then
				players_images[pl][2][row*100+column] = tfm.exec.addImage(piece_ts_img[color_piece_t][item_piece_t][1], "?5", piece_ts_img[color_piece_t][item_piece_t][2]+column*44+200+testsmesh, piece_ts_img[color_piece_t][item_piece_t][3]+row*44-22, pl, piece_ts_img[color_piece_t][item_piece_t][4], piece_ts_img[color_piece_t][item_piece_t][5], 0, 1)
			end
		end
		
		return

		
	end
	
end



function init()
	--board = setBoard()
	--showBoard()
	
	
	
end
boolstartlua = true
startcount = 0
eventLoop = function()
	if boolstartlua then
	startcount = startcount + 1
	
	if startcount> 2*2 then
		boolstartlua = false
		table.foreach(tfm.get.room.playerList, eventNewPlayer)
		init()
		test()
	end
	
	end
end

-- New Game
eventNewPlayer = function(n)
	
	tfm.exec.respawnPlayer(n)
	
	
	
	
	players_images[n] = {}
	players_images[n][1] = {}--картинки доски
	players_images[n][2] = {}--картинки фигур
	players_images[n][3] = {1}
	players_images[n][4] = {}--массив нажатий
	
	-- if n == "Deff83#0000" then
		-- ----print("wwwwwwwwwwwww:"..n)
		-- players_images[n][3] = {2}
	-- end
	
	local setting_pl_party = players_images[n][3][1]
	
	if party[setting_pl_party]==nil then
		party[setting_pl_party] = {}
		party[setting_pl_party][1] = setBoard()
		party[setting_pl_party][2] = {{1, 2}, {6, 8}}
		party[setting_pl_party][3] = {n}
		party[setting_pl_party][4] = {}
		
	else
		party[setting_pl_party][3][#party[setting_pl_party][3]+1] = n
	end
	
	
	showBoard(n, players_images[n][3][1], true)
	system.bindMouse(n, true)
	test()
	--system.bindKeyboard(n, 32, true, true)
--	tfm.exec.chatMessage("<S>[#Chess] Welcome to the module! Choose an armchair and enjoy the game with a friend!\n\tYou, chess lord, report any bug to Bolodefchoco!", n)
end

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

local checkCapture = function(n, row, column, newRow, newColumn)


	if ispiece_tSquare(newRow, newColumn) then
		if boolCapture and piece_tDifColor(board[row][column], board[newRow][newColumn]) then
			uiupdateSquare(newRow, newColumn, n, colors.captureMove, string.format(stringReference.piece_t, row, column, newRow, newColumn, board[newRow][newColumn]))
		end
		return true
	end
	if boolEmpty then
		uiupdateSquare(newRow, newColumn, n, colors.emptyMove, string.format(stringReference.select, row, column, newRow, newColumn))
	end
	return false
end

function isWhitePiece(pio)
	----print (pio)
	if math.floor(pio/10) == 5 then
		return false
	end
	if math.floor(pio/10) == 1 then
		return true
	end
	
	return false
	
end

function ispiece_tSquare(row, column, partyk)
	if party[partyk][1][row] == nil then
		----print(row.."/"..column)
		return false
	end

	if party[partyk][1][row][column] == 0 then
		return false
	end
	if party[partyk][1][row][column] == nil then
		return false
	end
	return true
	
end

function trans(pl)
	local choose_square = players_images[pl][4][1]
	
	local row = choose_square[1]
	local column = choose_square[2]
	
	local party_n = players_images[pl][3][1]
	
	local piece_t_choose_full = (party[party_n][1][row][column])
	local piece_t_choose = piece_t_choose_full%10
	local fig = math.floor(piece_t_choose_full/10)
	
	local whitePiece = isWhitePiece(piece_t_choose_full)
	local dir = whitePiece and -1 or 1
	
	if piece_t_choose == piece_ts.pawn then
	
		local gh_pawn = 1
		if (whitePiece and (party[party_n][1][row+2] == nil or party[party_n][1][row+2][column]==nil)) or (not whitePiece and (party[party_n][1][row-2] == nil or party[party_n][1][row-2][column]==nil)) then
			gh_pawn = 2
		end
		
	
		-- In front, 1 or 2 squares
		for i = 1, gh_pawn do
			local newRow = row + i * dir
			
			
			if ispiece_tSquare(newRow, column, party_n) then
				break
			end
			showMove(pl, newRow, column, party_n, piece_t_choose_full, true)
			--uiupdateSquare(newRow, column, n, ((newRow == 1 or newRow == 8) and colors.specialMove or colors.emptyMove), string.format(stringReference.select, row, column, newRow, column))
		end
	
		-- En passant
		-- if players[3 - currentPlayer].lastMove ~= "" then
			-- local grid = string.split(players[3 - currentPlayer].lastMove, "[^_]+", tonumber)
			-- if grid[1] and grid[2] then
				-- for i = -1, 1, 2 do
					-- if grid[1] == row and grid[2] + i == column then
						-- uiupdateSquare(grid[1] + dir, grid[2], n, colors.specialMove, string.format(stringReference.piece_t, row, column, grid[1], grid[2] .. "_" .. (grid[1] + dir), "\n"))
						-- break
					-- end
				-- end
			-- end
		-- end
	end
	
						
				
	if piece_t_choose == piece_ts.rook or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king then
		local range = (piece_t_choose == piece_ts.king and 1 or 8)
		
		-- Horizontal and Vertical
		local coord = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}}
		for i = 1, 4 do
			for j = 1, range do
				local newRow = row + j * coord[i][1]
				local newColumn = column + j * coord[i][2]
				
				showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
				if ispiece_tSquare(newRow, newColumn, party_n) then
					break
				end
				
			end
		end
	end
	
	if piece_t_choose == piece_ts.knight then
		-- L Shape
		local coord = {{-2, -1}, {-1, -2}, {-2, 1}, {-1, 2}, {1, -2}, {2, -1}, {1, 2}, {2, 1}}
		for i = 1, 8 do
			local newRow = row + coord[i][1]
			local newColumn = column + coord[i][2]
			
			showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
		end
	end
	
	if piece_t_choose == piece_ts.bishop or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.pawn then
		local isPawn = piece_t_choose == piece_ts.pawn
		local range = ((piece_t_choose == piece_ts.king or isPawn) and 1 or 8)
		
		-- Diagonal
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, range do
				local newRow = row + j * coord[i][1]
				local newColumn = column + j * coord[i][2]
				
				if isPawn then
					if coord[i][1] == dir then
						local figk = party[party_n][1][newRow][newColumn]
						if figk == nil or figk == 0 then
							if party[party_n][1][row]~=nil and party[party_n][1][row][newColumn]~=nil and (party[party_n][1][row][newColumn]%10 == piece_ts.pawn) and (math.floor(party[party_n][1][row][newColumn]/10) ~= fig) then
								--showMove(pl, newRow+dir, newColumn, party_n, piece_t_choose_full, false)
								--
								local lastm_pawn_j = party[party_n][4][#party[party_n][4]]
								if lastm_pawn_j~=nil and (lastm_pawn_j[1]==party[party_n][1][row][newColumn] and (lastm_pawn_j[3]~=nil and (lastm_pawn_j[3][1]==row and lastm_pawn_j[3][2]==newColumn) and lastm_pawn_j[2]~=nil and (math.abs(math.floor(lastm_pawn_j[2][1]-lastm_pawn_j[3][1]))==2 and (lastm_pawn_j[2][2]==newColumn)))) then
									showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
								end
								
							end
							
						else
							showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
						end
						
					end
				else
					showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
				end
				
				
				if ispiece_tSquare(newRow, newColumn, party_n) then
					break
				end
			end
		end
	end
	if piece_t_choose == piece_ts.checker then
			--print("p")
		-- Diagonal
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, 2 do
				local newRow = row + j*coord[i][1]
				local newColumn = column + j*coord[i][2]
				
				if j == 2 then
					if party[party_n][1][row + coord[i][1]]~=nil then
						local figk = party[party_n][1][row + coord[i][1]][column + coord[i][2]]
						if figk == nil or figk == 0 then
						else
							if math.floor(figk/10)~= fig and (party[party_n][1][newRow]~=nil and party[party_n][1][newRow][newColumn] == 0) then
								showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
							end
						end
					end
				else
					if coord[i][1] == dir then
						showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, false)
					end
				end
				
				--if ispiece_tSquare(newRow, newColumn, party_n) then
				--	break
				--end
			end
		end
	end
	
	if piece_t_choose == piece_ts.checker_queen then
			--print("p")
		-- Diagonal
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, 8 do
				local newRow = row + j*coord[i][1]
				local newColumn = column + j*coord[i][2]
				
				showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, false)
				if ispiece_tSquare(newRow, newColumn, party_n) then
					local figk = party[party_n][1][newRow][newColumn]
					if math.floor(figk/10) ~= fig then
						showMove(pl, newRow+coord[i][1], newColumn+coord[i][2], party_n, piece_t_choose_full, false)
					end
					break
				end
			end
		end
	end
	
	
	
	if piece_t_choose == piece_ts.king then
		-- Castling
		local d = 1
		for i = 1, 2 do
			if column == 5 then
				if true and not ispiece_tSquare(row, column + d, party_n) and not ispiece_tSquare(row, column + (d * 2), party_n) then--если рокировка не было
					if d > 0 or not ispiece_tSquare(row, column - 3, party_n) then
						----print("@@")
						----print(column + (d > 0 and 2 or -2))
					
						if ((party[party_n][1][row+1] == nil or party[party_n][1][row+1][column] == nil) and whitePiece) or ((party[party_n][1][row-1] == nil or party[party_n][1][row-1][column] == nil) and not whitePiece) then
							if (party[party_n][1][row]~= nil and party[party_n][1][row][1]~=nil and party[party_n][1][row][1]%10 == piece_ts.rook and d < 0) or (party[party_n][1][row]~= nil and party[party_n][1][row][8]~=nil and party[party_n][1][row][8]%10 == piece_ts.rook and d > 0) then
								showMove(pl, row, column + (d > 0 and 2 or -2), party_n, piece_t_choose_full, true)
							end
						end
						
					end
				end
			end
			d = -d
		end
	end
				
				
			----print(dir)
	if true then
		return
	end	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
end





--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------


function showMove(pl, row, column, party_n, stor, bool_show_p)

if party[party_n][1][row]~=nil then
	local fig = party[party_n][1][row][column]

	-- if  then
		
			-- players_images[pl][4][4][#players_images[pl][4][4]+1] = tfm.exec.addImage(image_choose[1][2][1], "!1", image_choose[1][2][2]+column*44+200, image_choose[1][2][3]+row*44-22, pl, image_choose[1][2][4], image_choose[1][2][5], 0, 1)
			-- players_images[pl][4][5][#players_images[pl][4][5]+1] = {row, column}
			

		-- return
	-- end
	
	
	if fig ~= nil and (not (math.floor(fig/10) == math.floor(stor/10))) and (fig == 0 or bool_show_p) then
		
			players_images[pl][4][4][#players_images[pl][4][4]+1] = tfm.exec.addImage(image_choose[1][2][1], "!1", image_choose[1][2][2]+column*44+200, image_choose[1][2][3]+row*44-22, pl, image_choose[1][2][4], image_choose[1][2][5], 0, 1)
			players_images[pl][4][5][#players_images[pl][4][5]+1] = {row, column}
		
	end
end
end

function eventMouse(pl, xpl, ypl)
	------print(xpl..":"..ypl)
	if players_images[pl] == nil or players_images[pl][3]==nil or players_images[pl][3][1]==nil then
		return
	end
	local party_local = party[players_images[pl][3][1]]
	
	local x_click = math.floor((xpl-200)/44)
	local y_click = (math.floor((ypl+22)/44))
	
	------print(x_click..":"..y_click)
	
	-- if party_local[1] then--если партия - класические шахматы
	
		if (players_images[pl][4][1] ==nil) then
			if  party_local[1][y_click]~=nil and party_local[1][y_click][x_click] ~= 0 and party_local[1][y_click][x_click]~=nil then
				players_images[pl][4][1] = {y_click, x_click}
				players_images[pl][4][3] = tfm.exec.addImage(image_choose[1][1][1], "!1", image_choose[1][1][2]+x_click*44+200, image_choose[1][1][3]+y_click*44-22, pl, image_choose[1][1][4], image_choose[1][1][5], 0, 1)
				if players_images[pl][4][4]~=nil then
					for i, j in pairs(players_images[pl][4][4]) do
						tfm.exec.removeImage(j)
					end
				end
				players_images[pl][4][4] = {}
				players_images[pl][4][5] = {}
				trans(pl)
			end
		else
			if (players_images[pl][4][1][1] == y_click) and (players_images[pl][4][1][2] == x_click) then
				return
			end
			for i, j in pairs(players_images[pl][4][5]) do
				if (j[1] == y_click) and (j[2] == x_click) then
					--checker
					if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.checker) and ((x_click+players_images[pl][4][1][2])%2==0) then
						changeMove({players_images[pl][4][1], {(y_click+players_images[pl][4][1][1])/2, (x_click+players_images[pl][4][1][2])/2}, players_images[pl][3][1]}, false)
						changeMove({{(y_click+players_images[pl][4][1][1])/2, (x_click+players_images[pl][4][1][2])/2}, {y_click, x_click}, players_images[pl][3][1]}, true)
						
						break
					end
					--checker_queen
					if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.checker_queen) then
						
						local kx_dir = (x_click - players_images[pl][4][1][2])<0 and -1 or 1
						local ky_dir = (y_click - players_images[pl][4][1][1])<0 and -1 or 1
						changeMove({players_images[pl][4][1], {(y_click-ky_dir), (x_click-kx_dir)}, players_images[pl][3][1]}, false)
						changeMove({{(y_click-ky_dir), (x_click-kx_dir)}, {y_click, x_click}, players_images[pl][3][1]}, true)
						break
					end
					--PAWN PROMOTION
					if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.pawn) then
						
							if ((isWhitePiece(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]) and (party_local[1][y_click-1]==nil or party_local[1][y_click-1][x_click]==nil)) or (not isWhitePiece(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]) and (party_local[1][y_click+1]==nil or party_local[1][y_click+1][x_click]==nil))) then
								--print("tuty")
								local text = "<textformat leading='40'><p align='center'><font size='25'>PAWN PROMOTION<font size='15'>\n<B>"
									
								for k, v in next, {{'<ROSE>Queen', 2}, {'<J>Rook', 3}, {'<PT>Bishop', 4}, {'<BV>Knight', 5}} do
									text = text .."<a href='event:transform"..v[2]..y_click.."k"..x_click.."'>"..v[1].."</a> "
								end
								ui.addTextArea(-700000, text, pl, 247, 45, 306, 306, nil, nil, .9, true)
								
								return
							else
								
								if (math.abs(x_click - players_images[pl][4][1][2])==1 and math.abs(y_click - players_images[pl][4][1][1])==1) and party_local[1][y_click][x_click]==0 then
									local item_lop = party_local[1][players_images[pl][4][1][1]][x_click]
									changeMove({players_images[pl][4][1], {players_images[pl][4][1][1], x_click}, players_images[pl][3][1]}, false)
									changeMove({{players_images[pl][4][1][1], x_click}, {y_click, x_click}, players_images[pl][3][1], nil, nil, {item_lop, players_images[pl][4][1][1], x_click}, players_images[pl][4][1]}, true)
								else
									changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
								end
							end
						break
					end
					--Castling
					if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]~=nil and party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.king) and math.abs(players_images[pl][4][1][2] - x_click) == 2 then
						----print("+++++++++++++++++++++++++")
						if players_images[pl][4][1][2] - x_click < 0 then
							changeMove({{y_click, 8}, {y_click, 6}, players_images[pl][3][1]}, false)
							changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 8}, {y_click, 6}}}}, true)
						else
							----print(y_click)
							changeMove({{y_click, 1}, {y_click, 4}, players_images[pl][3][1]}, false)
							changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 1}, {y_click, 4}}}}, true)
						end
						break
					end
					changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
				end
			end
			
			tfm.exec.removeImage(players_images[pl][4][3])
			------print(players_images[pl][3][1])
			
			
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			
		end
		
	-- end
end

tmp_savefig = 0
tmp_move_square = nil

function spawn_piece(item, row, column, party_m)	
	if party[party_m] == nil then
		return
	end
	if party[party_m][1][row]==nil then
		return
	end
	if party[party_m][1][row][column]==nil then
		return
	end
	
	party[party_m][1][row][column] = item
	
	for nick in pairs(tfm.get.room.playerList) do
		
		showBoardSquare(row, column, nick, true)-- NOT NIL for players у которых открыта игра
	end
end

function changeMove(move, bool_writed)
	local first = move[1]
	local second = move[2]
	
	local party_m = move[3]
	
	local change_p_m = move[4]
	local dop_move_p_m = move[5]
	
	local dop_resp_p_m = move[6]
	local dop_savemovefirst_p_m = move[7]
	
	if (second[1]==first[1]) and (second[2]==first[2]) then
		return
	end

	if (party[party_m]==nil) then
		----print("wrong party:"..party_m)
		return
	end
	
	--------------------WRONG Square------------
	if party[party_m][1][second[1]] == nil then
		----print("wrong raw:"..second[1])
		return
	end
	if (party[party_m][1][second[1]][second[2]]==nil) then
		----print("wrong column:"..second[2]..", "..second[1])
		return
	end
		if party[party_m][1][first[1]] == nil then
		----print("wrong raw:"..first[1])
		return
	end
	if (party[party_m][1][first[1]][first[2]]==nil) then
		----print("wrong column:"..first[2]..", "..first[1])
		return
	end
	------------------------------------------------------
	
	
	if (party[party_m][1][first[1]][first[2]]==0) then
		----print("wrong 0")
		return
	end
	
	
	local item = party[party_m][1][first[1]][first[2]]
	
	-- tfm.exec.removeImage(party[party_m][3][2][100*first[1]+first[2]])
	-- tfm.exec.removeImage(party[party_m][3][1][100*first[1]+first[2]])
	
	-- tfm.exec.removeImage(party[party_m][3][2][100*second[1]+second[2]])
	-- tfm.exec.removeImage(party[party_m][3][1][100*second[1]+second[2]])
	-- for i, n in pairs(party[setting_pl_party][3][1]) do
		-- for j, nj in pairs(n) do
			-- tfm.exec.removeImage(nj)
		-- end
	-- end
	-- for i, n in pairs(party[setting_pl_party][3][2]) do
		-- for j, nj in pairs(n) do
			-- tfm.exec.removeImage(nj)
		-- end
	-- end
	local bool_ch = false
	if (item%10 == piece_ts.checker) and ((isWhitePiece(item) and (party[party_m][1][second[1]-1]==nil))or(not isWhitePiece(item) and (party[party_m][1][second[1]+1]==nil))) then
		bool_ch = true
		change_p_m = {item, item+1}
	end
	
	local localsave = nil
	if bool_writed then
		if (item%10 == piece_ts.checker) or (item%10 == piece_ts.checker_queen) then
			localsave = {item, (tmp_move_square~=nil and tmp_move_square or {first[1], first[2]}), {second[1], second[2]}, tmp_savefig, change_p_m, dop_move_p_m, dop_resp_p_m}
			tmp_savefig = 0
			tmp_move_square = nil
		else
			localsave = {item, {first[1], first[2]}, {second[1], second[2]}, party[party_m][1][second[1]][second[2]], change_p_m, dop_move_p_m, dop_resp_p_m}
		end
		
	end
	----save move
	if localsave~=nil then
		
		if dop_savemovefirst_p_m~=nil then
			localsave[2] = dop_savemovefirst_p_m
		end
		
		party[party_m][4][#party[party_m][4] + 1] = localsave
		
	end
	
	
	
	party[party_m][1][first[1]][first[2]] = 0
	if (item%10 == piece_ts.checker) or (item%10 == piece_ts.checker_queen) then
		if not bool_writed then
			tmp_savefig = party[party_m][1][second[1]][second[2]]
			tmp_move_square = {first[1], first[2]}
		end
	else
		tmp_savefig = 0
		tmp_move_square = nil
	end
	
	party[party_m][1][second[1]][second[2]] = item
	
	
	
	
	--party[party_m][3][2][first[1]*100+first[2]] = 0
	
	-- tfm.exec.removeImage(party[party_m][3][1][100*party[party_m][2][1][1]+party[party_m][2][1][2]])
	-- tfm.exec.removeImage(party[party_m][3][1][100*party[party_m][2][2][1]+party[party_m][2][2][2]])
	
	local pr2 = party[party_m][2]
	party[party_m][2] = {{first[1], first[2]}, {second[1], second[2]}}
	
	
	
	
	
	if (item%10 == piece_ts.checker) and ((isWhitePiece(item) and (party[party_m][1][second[1]-1]==nil))or(not isWhitePiece(item) and (party[party_m][1][second[1]+1]==nil))) then
		party[party_m][1][second[1]][second[2]] = item + 1 
	end
	
	
	
	for nick in pairs(tfm.get.room.playerList) do
		
		showBoardSquare(pr2[1][1], pr2[1][2], nick, true)-- NOT NIL for players у которых открыта игра
		showBoardSquare(pr2[2][1], pr2[2][2], nick, true)-- NOT NIL for players у которых открыта игра
		
		showBoardSquare(first[1], first[2], nick, true)-- NOT NIL for players у которых открыта игра
		showBoardSquare(second[1], second[2], nick, true)-- NOT NIL for players у которых открыта игра
	end
	
	
	test_hod()
	
	
	
	
	
end

function eventTextAreaCallback(id, pl, cmd)

	local setting_pl_party = players_images[pl][3][1]
	if cmd == "test2" then
		local cletka1 = {math.random(1, 8), math.random(1, 10)}
		local cletka2 = {math.random(1, 8), math.random(1, 10)}
		changeMove({cletka1, cletka2, 2}, true)
		
		------print(cletka1[1]..":"..cletka1[2].."->"..cletka2[1]..":"..cletka2[2].."("..party[setting_pl_party][1][cletka1[1]][cletka1[2]]..")")
	end
	if cmd == "test1" then
		local cletka1 = {math.random(1, 8), math.random(1, 10)}
		local cletka2 = {math.random(1, 8), math.random(1, 10)}
		changeMove({cletka1, cletka2, 1}, true)
		
		------print(cletka1[1]..":"..cletka1[2].."->"..cletka2[1]..":"..cletka2[2].."("..party[2][1][cletka1[1]][cletka1[2]]..")")
		
	end
	if cmd == "test3" then
	
		changeMove({{1,1}, {3,4}, 1}, true)
	end
	
	if cmd:sub(0, 9) == "transform" then
		local piece_s = (cmd:sub(10, 10))+0
		ui.removeTextArea(-700000, pl)
		
		--print(piece_s)
		
		if piece_s == piece_ts.queen or piece_s == piece_ts.rook or piece_s == piece_ts.bishop or piece_s == piece_ts.knight then
			local xy_s = cmd:sub(11, -1)
			local xy_mass = string.split(xy_s, "k")
			--print("----------------")
			--print(xy_mass[1])
			--print(xy_mass[2])
			--print(players_images[pl][4][1][1])
			--print(players_images[pl][4][1][2])
			--print(players_images[pl][3][1])
			--print("----------------")

			local party_local = party[players_images[pl][3][1]]
			--print(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]])
			
			if players_images[pl][4][1]==nil then
				return
			end
			
			local fig_ht = party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]
			local new_piece = math.floor(fig_ht/10)*10+piece_s
			--print(new_piece)
			changeMove({players_images[pl][4][1], {xy_mass[1]+0, xy_mass[2]+0}, players_images[pl][3][1], {fig_ht, new_piece}}, true)
			
			
			
			tfm.exec.removeImage(players_images[pl][4][3])
			------print(players_images[pl][3][1])
			
			
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			
			spawn_piece(new_piece, xy_mass[1]+0, xy_mass[2]+0, players_images[pl][3][1])
			
		end
		
		--
		
								-- local piece_ts = {
	-- king = 1,
	-- queen = 2,
	-- rook = 3,--ладья
	-- bishop = 4,--слон
	-- knight = 5,--конь
	-- pawn = 6,--пешка
	-- checker = 7,--шашка
	-- checker_queen = 8--дамка
-- }
		
		
		
	end
	
	if cmd:sub(0, 5) == "party" then
		local party_s = cmd:sub(6, -1)
		----print(party_s)
		players_images[pl][3][1] = party_s+0
		
		if (players_images[pl][4][1] ~=nil) then
			tfm.exec.removeImage(players_images[pl][4][3])
			
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
		end
		
		
		
		players_images[pl][4] = {}

		ui.removeTextArea(-700000, pl)
		showBoard(pl, players_images[pl][3][1], true)
		test_hod()
		test()
	end
	
	if cmd == "new_party" then
		local num_new_party = #party + 1
		players_images[pl][3] = {num_new_party}
		if (players_images[pl][4][1] ~=nil) then
			tfm.exec.removeImage(players_images[pl][4][3])
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
		end
		
		players_images[pl][4] = {}

		party[num_new_party] = {}
		party[num_new_party][1] = setBoard()
		party[num_new_party][2] = {{1, 2}, {6, 8}}
		party[num_new_party][3] = {pl, "test#0000"}
		party[num_new_party][4] = {}
		showBoard(pl, players_images[pl][3][1], true)
		ui.removeTextArea(-1002, pl)
		ui.removeTextArea(-700000, pl)
		test_hod()
		test()
	end
	
	if cmd == "return_move" then
		local last_move = party[setting_pl_party][4][#party[setting_pl_party][4]]
		if last_move~=nil then
			local cletka1 = last_move[3]
			local cletka2 = last_move[2]
			local change_p_m_o = last_move[5]
			local dop_p_m_o = last_move[6]
			local dop_resp_p_m = last_move[7]
			
			if (last_move[1]%10 == piece_ts.checker or last_move[1]%10 == piece_ts.checker_queen) and last_move[4] ~= 0 then
				--print("uiu")
				changeMove({cletka1, cletka2, setting_pl_party}, false)				
				spawn_piece(last_move[4], cletka1[1]+((cletka2[1]-cletka1[1])>0 and 1 or -1), cletka1[2]+((cletka2[2]-cletka1[2])>0 and 1 or -1), setting_pl_party)
			else
				changeMove({cletka1, cletka2, setting_pl_party}, false)
				spawn_piece(last_move[4], cletka1[1], cletka1[2], setting_pl_party)
			end
			
			if change_p_m_o~=nil then
				spawn_piece(change_p_m_o[1], cletka2[1], cletka2[2], setting_pl_party)
			end
			if dop_p_m_o~=nil then
				--spawn_piece(change_p_m_o[1], cletka2[1], cletka2[2], setting_pl_party)
				for j=1, #dop_p_m_o do
					local dop_p_m_o_hod = dop_p_m_o[j]
					-- print(dop_p_m_o_hod[1][1]..":"..dop_p_m_o_hod[1][2])
					-- print(dop_p_m_o_hod[2][1]..":"..dop_p_m_o_hod[2][2])
					changeMove({dop_p_m_o_hod[2], dop_p_m_o_hod[1], setting_pl_party}, false)
				end
			end
			if dop_resp_p_m~=nil then
				spawn_piece(dop_resp_p_m[1], dop_resp_p_m[2], dop_resp_p_m[3], setting_pl_party)
			end
			
			party[setting_pl_party][4][#party[setting_pl_party][4]] = nil
			
		ui.removeTextArea(-700000, pl)
			if (players_images[pl][4][3]~=nil) then
				tfm.exec.removeImage(players_images[pl][4][3])
			end
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			if players_images[pl][4]~=nil and players_images[pl][4][4]~=nil then
				for i, j in pairs(players_images[pl][4][4]) do
					if j~=nil then
						tfm.exec.removeImage(j)
					end
				end
			end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			
			tmp_savefig = 0
			tmp_move_square = nil
			test_hod()
		end
	end
end

function test_hod()
	for nick in pairs(tfm.get.room.playerList) do
		local massplk = party[players_images[nick][3][1]][4]
		local info_partys_pl = ""
		for k = 1, #massplk do
			info_partys_pl = info_partys_pl.."<font color='#"..color_piece_mass[math.floor(massplk[k][1]/10)].."'>"..symbol_piece_mass[massplk[k][1]%10].."</font>"..massplk[k][2][1]..massplk[k][2][2]..""..massplk[k][3][1]..massplk[k][3][2]..""..((massplk[k][4]~=0 or massplk[k][7]~=nil) and "x" or "").." "..""
		end
		
		ui.addTextArea(-1002, ""..info_partys_pl, nick, 620, 100, 180, nil, 1, 0x0000ff, 0.7,true)
	end
end

function test()

ui.addTextArea(-66, "<a href='event:test1'>test1</a><br><a href='event:test2'>test2</a><br><a href='event:test3'>move</a><br>", nil, 725, 27, 50, nil, 1, 0x0000ff, 0.7,true)


local info_partys = ""


local ok = 0
for i, j in pairs(party) do
	ok = ok + 1
	info_partys = info_partys.."<a href='event:party"..i.."'>"..i.."</a><br>"
	
	
	

end


for nick in pairs(tfm.get.room.playerList) do
	if players_images[nick]~=nil then
		ui.addTextArea(-1000, ""..players_images[nick][3][1], nick, 60, 27, 50, nil, 1, 0x0000ff, 0.7,true)
		
		local masspl = party[players_images[nick][3][1]][3]
		local info_partys_pl = ""
		for k = 1, #masspl do
			info_partys_pl = info_partys_pl..""..masspl[k].."<br>"
		end
		
		ui.addTextArea(-1001, ""..info_partys_pl, nick, 60, 100, 100, nil, 1, 0x0000ff, 0.7,true)
		
		
		
		

	end

end




ui.addTextArea(-67, ""..info_partys, nil, 0, 27, 50, nil, 1, 0x0000ff, 0.7,true)

ui.addTextArea(-68, "<a href='event:new_party'>new</a>", nil, 0, 70, 50, nil, 1, 0x0000ff, 0.7,true)
ui.addTextArea(-69, "<a href='event:return_move'>return move</a>", nil, 700, 350, 100, nil, 1, 0x0000ff, 0.7,true)

end



-- Init
for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
	tfm.exec["disable" .. v]()
end

for nick in pairs(tfm.get.room.playerList) do
    system.bindMouse(nick, true)
end
tfm.exec.newGame(7850663)
--table.foreach(tfm.get.room.playerList, eventNewPlayer)


