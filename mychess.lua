---------------------- PROPERTIES ----------------------
local admins = {"Deff83#0000"}
local set_board = 2
local map_st = 7863012

------------------ ADVANCED PROPERTIES -----------------
local test_mod = false
local start_party_classic = 1
local party = {}
local players_images = {}

local mass_ob = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"}
local symbol_piece_mass = {'♚', '♛', '♜', '♝', '♞', '♟', '■', '♛', '■'}
local color_piece_mass = {'FFFFFF', 'FF00FF', 'FFFF00', 'FF0000', '00FFFF', '000000'}

local name_g = {
	"Chess", 
	"Fischer Chess", 
	"Chess «Almujannah»", 
	"Chess with transformation", 
	"Bridge-Chess",
	"Gardner Mini-Chess",
	"Checkers",
	"Rearrangement of Guarini 6 horses",
	"Rearrangement of Guarini",
	"Rearrangement of horses'bridge'",
	"Rearranging the 'bridge'checkers",
	"Board-«gun»",
	"V.Shankman's Zigzag",
	"V.Shankman's Zigzag 2",
	"Rearranging corners",
	"Rearranging corners 2",
	"Rearranging corners 3"
}

local description = {
	[[<p align='center'><font size='20'><b><J>Chess</J></b></font><br><p align='left'><font size='14'>Chess (Persian.  شاه مات - Checkmate (literally translated "the Check is dead") is a board puzzle game with special pieces on a 64-cell board for two opponents, combining elements of art (including chess composition), science and sports. A chess game is played between two opponents on a chessboard by moving the chess pieces. The goal of the game is to checkmate the opponent's king.]],
	[[<p align='center'><font size='20'><b><J>Fischer Chess</J></b></font><br><p align='left'><font size='14'>The eleventh world chess champion Robert Fischer proposed his own version of the game, which later received his name. Bobby wanted to move away from the well-studied debut tracks in many ways. He left the classic chessboard, but placed the pieces of the first and eighth horizontal lines in a random order.]],
	[[<p align='center'><font size='20'><b><J>Chess «Almujannah»</J></b></font><br><p align='left'><font size='14'>One of the old opening tabs (the initial positions of the pieces). It can be obtained from the modern starting position by using the symmetrical moves of white and black.]],
	[[<p align='center'><font size='20'><b><J>Chess with transformation</J></b></font><br><p align='left'><font size='14'>Good training for novice chess players. In this game, the knight turns into a bishop when it moves. The bishop becomes the rook, and the rook becomes the queen. The queen closes the chain of transformation and becomes a knight after her turn.]],
	[[<p align='center'><font size='20'><b><J>Bridge-Chess</J></b></font><br><p align='left'><font size='14'>This time the figures are located on different islands.]],
	[[<p align='center'><font size='20'><b><J>Gardner Mini-Chess</J></b></font><br><p align='left'><font size='14'>Gardner's Mini-chess is a variant of the game of chess on a reduced 5×5 board, proposed in 1962. In 2013, Gardner's mini-chess was weakly solved; it was proved that with optimal play of both sides, the result of the game is a draw.]],
	[[<p align='center'><font size='20'><b><J>Checkers</J></b></font><br><p align='left'><font size='14'>Checkers - a logical board game for two players. The goal of the game is to take all the opponent's checkers or to deprive them of the opportunity to move.]],
	[[<p align='center'><font size='20'><b><J>Rearrangement of Guarini 6 horses</J></b></font><br><p align='left'><font size='14'>Although the board is larger, and there are three knights on each side, rather than two as in the previous Garini knight permutation problem, the solution consists of 22 moves (11 white and 11 black).]],
	[[<p align='center'><font size='20'><b><J>Rearrangement of Guarini</J></b></font><br><p align='left'><font size='14'>In the opposite corners of the 3×3 chessboard, there are two white and two black knights. For the minimum number of moves, swap the white horses with the black ones. The solution consists of 16 permutations of the knights (8 moves of white and 8 moves of black).]],
	[[<p align='center'><font size='20'><b><J>Rearranging the 'bridge' horses</J></b></font><br><p align='left'><font size='14'>The board has a rather fancy shape, but for the method of buttons and threads, this is not an obstacle.]],
	[[<p align='center'><font size='20'><b><J>Rearranging the 'bridge' checkers</J></b></font><br><p align='left'><font size='14'>It is necessary to transfer the checkers of the same color to the other side. In this case, the checkers should not go back.]],
	[[<p align='center'><font size='20'><b><J>Board-«gun»</J></b></font><br><p align='left'><font size='14'>In the "position", the pieces move according to the usual rules, but the board has a very original shape. White on the board-"gun" is very tight, but you need to checkmate the black king, the solution is in 21 moves!]],
	[[<p align='center'><font size='20'><b><J>V.Shankman's Zigzag</J></b></font><br><p align='left'><font size='14'>The white king takes the black horse (while the horse is stationary, and the king does not get under check). The permutation is carried out in 26 moves.]],
	[[<p align='center'><font size='20'><b><J>V.Shankman's Zigzag 2</J></b></font><br><p align='left'><font size='14'>The king and queen change places. Here, to rearrange the king and queen (the other pieces must return to their original places), you have to make 107 (!!) moves.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners</J></b></font><br><p align='left'><font size='14'>It is necessary to move all your checkers to the opposite side faster than the opponent.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners 2</J></b></font><br><p align='left'><font size='14'>Try to move all the checkers of the same color to the other side in the minimum number of moves.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners 3</J></b></font><br><p align='left'><font size='14'>It is necessary to move all your checkers to the opposite side faster than the opponent.]]
}

local name_button = {
	"Cancel",
	"Your turn!",
	"GO",
	"History of games",
	"New game",
	"Undo move",
	"Flip board",
	"Accept",
	"wants to play with you ",
	"Choose opponent",
	"Check",
	"Checkmate",
	"Press GO",
	"Give up"
}

local doppravil = {
	{false, false, true, true, false, true},
	{false, false, true, true, false, true},
	{false, false, true, true, false, true},
	{false, true, true, true, false, true},
	{false, false, true, true, false, true},
	{false, false, true, true, false, true},
	{false, false, true, true, true, false},
	{true, false, false, false, false, false}, 
	{true, false, false, false, false, false}, 
	{true, false, false, false, false, false}, 
	{true, false, false, false, false, false}, 
	{false, false, false, false, false, false}, 
	{false, false, false, false, false, false}, 
	{true, false, false, false, false, false}, 
	{true, false, true, true, true, false},
	{true, false, false, false, false, false}, 
	{true, false, true, true, true, false}
}

local main_mass = {
	{
		{63, 65, 64, 62, 61, 64, 65, 63},
		{66, 66, 66, 66, 66, 66, 66, 66},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{16, 16, 16, 16, 16, 16, 16, 16},
		{13, 15, 14, 12, 11, 14, 15, 13}
	}, 
	{
		{65, 63, 62, 61, 65, 63, 64, 64},
		{66, 66, 66, 66, 66, 66, 66, 66},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{16, 16, 16, 16, 16, 16, 16, 16},
		{15, 13, 12, 11, 15, 13, 14, 14},
	}, 
	{
		{0, 63, 64, 62, 61, 64, 63, 0},
		{66, 0, 0, 0, 0, 0, 0, 66},
		{0, 66, 65, 66, 66, 65, 66, 0},
		{0, 0, 66, 0, 0, 66, 0, 0},
		{0, 0, 16, 0, 0, 16, 0, 0},
		{0, 16, 15, 16, 16, 15, 16, 0},
		{16, 0, 0, 0, 0, 0, 0, 16},
		{0, 13, 14, 12, 11, 14, 13, 0}
	}, 
	{
		{63, 65, 64, 62, 61, 64, 65, 63},
		{66, 66, 66, 66, 66, 66, 66, 66},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{16, 16, 16, 16, 16, 16, 16, 16},
		{13, 15, 14, 12, 11, 14, 15, 13}
	}, 
	{
		{33, 35, 34, 32, 31, 34, 35, 33},
		{36, 36, 36, 36, 36, 36, 36, 36},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{nil, nil, nil, nil, nil, nil, nil, nil},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{16, 16, 16, 16, 16, 16, 16, 16},
		{13, 15, 14, 12, 11, 14, 15, 13}
	}, 
	{
		{43, 45, 44, 42, 41},
		{46, 46, 46, 46, 46},
		{0, 0, 0, 0, 0},		
		{16, 16, 16, 16, 16},
		{13, 15, 14, 12, 11}
	},
	{
		{0, 67, 0, 67, 0, 67, 0, 67},
		{67, 0, 67, 0, 67, 0, 67, 0},
		{0, 67, 0, 67, 0, 67, 0, 67},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{17, 0, 17, 0, 17, 0, 17, 0},
		{0, 17, 0, 17, 0, 17, 0, 17},
		{17, 0, 17, 0, 17, 0, 17, 0}
	},
	{
		{45, 45, 45},
		{0, 0, 0},
		{0, 0, 0},		
		{15, 15, 15}
	},
	{
		{45, 0, 45},
		{0, 0, 0},		
		{15, 0, 15}
	},
	{
		{45},
		{0, 0, 0, 15},		
		{45, 15, 0},		
		{0, 0}
	},
	{
		{29, 29, 29, 29, 0, 19, 19, 19, 19}
	},
	{
		{61, 0, 64, 11, 14, 15, 0},
		{nil, nil, nil, nil, nil, 13, 16, 16},
		{nil, nil, nil, nil, nil, nil, 13, 15}
	},
	{
		{nil, nil, nil, 16},
		{nil, nil, 13, 16},
		{nil, 16, 14, 11},
		{65, 0, 14, 13}
		
	},
	{
		{nil, nil, nil, 11},
		{nil, nil, nil, 13},
		{nil, nil, 15, 14},
		{12, 14, 13, 0}
	},
	{
		{29, 29, 29, 0, 0, 0, 0, 0},
		{29, 29, 29, 0, 0, 0, 0, 0},
		{29, 29, 29, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 19, 19, 19},
		{0, 0, 0, 0, 0, 19, 19, 19},
		{0, 0, 0, 0, 0, 19, 19, 19}
	},
	{
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{19, 19, 19, 19, 0, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19}
	},
	{
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19}
	}
}

local main_mass_solver = {
	nil, nil, nil, nil, nil, nil, nil,
	{		
		{15, 15, 15},
		{0, 0, 0},
		{0, 0, 0},
		{45, 45, 45}
	},
	{	
		{15, 0, 15},
		{0, 0, 0},	
		{45, 0, 45}
	},
	{
		{15},
		{0, 0, 0, 45},		
		{15, 45, 0},		
		{0, 0}
	},
	{
		{19, 19, 19, 19, 0, 29, 29, 29, 29}
	},
	nil,
	{
		{nil, nil, nil, nil},
		{nil, nil, nil, nil},
		{nil, nil, nil, nil},
		{11, nil, nil, nil}
		
	},
	{
		{nil, nil, nil, 12},
		{nil, nil, nil, 13},
		{nil, nil, 15, 14},
		{11, 14, 13, 0}
	},
	{
		{19, 19, 19, 0, 0, 0, 0, 0},
		{19, 19, 19, 0, 0, 0, 0, 0},
		{19, 19, 19, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 29, 29, 29},
		{0, 0, 0, 0, 0, 29, 29, 29},
		{0, 0, 0, 0, 0, 29, 29, 29}
	},
	{
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 0, 19, 19, 19},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29}
	},
	{
		{19, 19, 19, 19, 19, 19, 19, 19},
		{19, 19, 19, 19, 19, 19, 19, 19},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0},
		{29, 29, 29, 29, 29, 29, 29, 29},
		{29, 29, 29, 29, 29, 29, 29, 29}
	}
}

local name_chess = {}
local tmp_savefig = 0
local tmp_move_square = nil
local boolstartlua = true
local startcount = 0

-- Piece types
local piece_ts = {
	king = 1,
	queen = 2,
	rook = 3,
	bishop = 4,
	knight = 5,
	pawn = 6,
	checker = 7,
	checker_queen = 8,
	checker_per = 9
}

local piece_ts_img = {
	{{"178fee23398.png", 0, 0, 1, 1}, {"178fee2a8cf.png", 0, 0, 1, 1}, {"178fee40874.png", 0, 0, 1, 1}, {"178fee31e06.png", 0, 0, 1, 1}, {"178fee3933d.png", 0, 0, 1, 1}, {"178fee47dad.png", 0, 0, 1, 1}, {"178fee4f2e4.png", 0, 0, 1, 1}, {"178fee50a55.png", 0, 0, 1, 1}, {"178fee4f2e4.png", 0, 0, 1, 1}},
	{{"178fee24b09.png", 0, 0, 1, 1}, {"178fee2d7b2.png", 0, 0, 1, 1}, {"178fee41fe6.png", 0, 0, 1, 1}, {"178fee33577.png", 0, 0, 1, 1}, {"178fee3aaaf.png", 0, 0, 1, 1}, {"178fee49520.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}, {"178fee5af22.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}},
	{{"178fee2627b.png", 0, 0, 1, 1}, {"178fee2ef23.png", 0, 0, 1, 1}, {"178fee43757.png", 0, 0, 1, 1}, {"178fee34ce9.png", 0, 0, 1, 1}, {"178fee3c220.png", 0, 0, 1, 1}, {"178fee4ac93.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}, {"178fee5af22.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}},
	{{"178fee279eb.png", 0, 0, 1, 1}, {"178fee2c03e.png", 0, 0, 1, 1}, {"178fee44ec8.png", 0, 0, 1, 1}, {"178fee3645a.png", 0, 0, 1, 1}, {"178fee3d9a0.png", 0, 0, 1, 1}, {"178fee4c404.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}, {"178fee5af22.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}},
	{{"178fee2915d.png", 0, 0, 1, 1}, {"178fee30694.png", 0, 0, 1, 1}, {"178fee4663a.png", 0, 0, 1, 1}, {"178fee37bcb.png", 0, 0, 1, 1}, {"178fee3f101.png", 0, 0, 1, 1}, {"178fee4db73.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}, {"178fee5af22.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}},
	{{"178fee1a6f1.png", 0, 0, 1, 1}, {"178fee1be61.png", 0, 0, 1, 1}, {"178fee204b5.png", 0, 0, 1, 1}, {"178fee1d5d2.png", 0, 0, 1, 1}, {"178fee1ed43.png", 0, 0, 1, 1}, {"178fee21c27.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}, {"178fee5af22.png", 0, 0, 1, 1}, {"178fee596ff.png", 0, 0, 1, 1}}
}

local image_board = {
	{{"178fee5c66f.png", 0, 0, 1, 1}, {"178fee521c8.png", 0, 0, 1, 1}, {"178fee5f556.png", 0, 0, 1, 1}},
	{{"178fee5f556.png", 0, 0, 1, 1}, {"178fee550b0.png", 0, 0, 1, 1}, {"178fee5dde2.png", 0, 0, 1, 1}},
	{{"178fee5dde2.png", 0, 0, 1, 1}, {"178fee5393a.png", 0, 0, 1, 1}, {"178fee5c66f.png", 0, 0, 1, 1}}
}

local image_choose = {
	{{"178fee57f8f.png", 0, 0, 1, 1}, {"178fee5681e.png", 0, 0, 1, 1}}
}

--------------------- CHESS VALIDATION FUNCTIONS ---------------------

local function isWhitePiece(piece)
	return math.floor(piece/10) == 1
end

local function ispiece_tSquare(row, column, partyk)
	if party[partyk][1][row] == nil then
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

local function getPieceInfo(piece)
	return piece % 10, math.floor(piece / 10)
end

local function isPathClear(board, fromRow, fromCol, toRow, toCol)
	local rowDir = toRow > fromRow and 1 or (toRow < fromRow and -1 or 0)
	local colDir = toCol > fromCol and 1 or (toCol < fromCol and -1 or 0)
	
	local currentRow = fromRow + rowDir
	local currentCol = fromCol + colDir
	
	while currentRow ~= toRow or currentCol ~= toCol do
		if board[currentRow] and board[currentRow][currentCol] and board[currentRow][currentCol] ~= 0 then
			return false
		end
		currentRow = currentRow + rowDir
		currentCol = currentCol + colDir
	end
	
	return true
end

local function canPieceAttackSquare(board, fromRow, fromCol, toRow, toCol)
	if board[fromRow] == nil or board[fromRow][fromCol] == nil then
		return false
	end
	
	local piece = board[fromRow][fromCol]
	if piece == 0 then return false end
	
	local pieceType, pieceColor = getPieceInfo(piece)
	local isWhite = pieceColor == 1
	local dir = isWhite and -1 or 1
	
	-- Pawn attacks
	if pieceType == piece_ts.pawn then
		if toRow == fromRow + dir and math.abs(toCol - fromCol) == 1 then
			return true
		end
		return false
	end
	
	-- Knight attacks
	if pieceType == piece_ts.knight then
		local dr = math.abs(toRow - fromRow)
		local dc = math.abs(toCol - fromCol)
		return (dr == 2 and dc == 1) or (dr == 1 and dc == 2)
	end
	
	-- King attacks
	if pieceType == piece_ts.king then
		return math.abs(toRow - fromRow) <= 1 and math.abs(toCol - fromCol) <= 1
	end
	
	-- Bishop attacks
	if pieceType == piece_ts.bishop or pieceType == piece_ts.queen then
		if math.abs(toRow - fromRow) == math.abs(toCol - fromCol) then
			return isPathClear(board, fromRow, fromCol, toRow, toCol)
		end
	end
	
	-- Rook attacks
	if pieceType == piece_ts.rook or pieceType == piece_ts.queen then
		if fromRow == toRow or fromCol == toCol then
			return isPathClear(board, fromRow, fromCol, toRow, toCol)
		end
	end
	
	return false
end

local function isKingInCheck(board, kingColor)
	local kingPos = nil
	
	-- Find king position
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				if board[row][col] ~= nil and board[row][col] ~= 0 then
					local pieceType, pieceColor = getPieceInfo(board[row][col])
					if pieceType == piece_ts.king and pieceColor == kingColor then
						kingPos = {row, col}
						break
					end
				end
			end
		end
		if kingPos then break end
	end
	
	if not kingPos then return false end
	
	-- Check if any opponent piece can attack king
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				if board[row][col] ~= nil and board[row][col] ~= 0 then
					local pieceType, pieceColor = getPieceInfo(board[row][col])
					if pieceColor ~= kingColor then
						if canPieceAttackSquare(board, row, col, kingPos[1], kingPos[2]) then
							return true
						end
					end
				end
			end
		end
	end
	
	return false
end

local function isMoveLegal(board, fromRow, fromCol, toRow, toCol)
	if board[fromRow] == nil or board[fromRow][fromCol] == nil then
		return false
	end
	
	if board[toRow] == nil or board[toRow][toCol] == nil then
		return false
	end
	
	local piece = board[fromRow][fromCol]
	if piece == 0 then
		return false
	end
	
	local pieceType, pieceColor = getPieceInfo(piece)
	
	-- Create temporary board to test move
	local testBoard = {}
	for i = 1, #board do
		testBoard[i] = {}
		if board[i] then
			for j = 1, #board[i] do
				testBoard[i][j] = board[i][j]
			end
		end
	end
	
	-- Make the move on test board
	testBoard[toRow][toCol] = testBoard[fromRow][fromCol]
	testBoard[fromRow][fromCol] = 0
	
	-- Check if move puts own king in check
	if isKingInCheck(testBoard, pieceColor) then
		return false
	end
	
	return true
end

local function canEnPassant(board, fromRow, fromCol, toRow, toCol, lastMove)
	if not lastMove or lastMove[1] % 10 ~= piece_ts.pawn then
		return false
	end
	
	local lastFrom = lastMove[2]
	local lastTo = lastMove[3]
	
	-- Check if last move was a two-square pawn advance
	if math.abs(lastFrom[1] - lastTo[1]) ~= 2 then
		return false
	end
	
	-- Check if pawns are on same row and adjacent columns
	if lastTo[1] ~= fromRow or math.abs(lastTo[2] - fromCol) ~= 1 then
		return false
	end
	
	-- Check if moving to correct square
	local piece = board[fromRow][fromCol]
	local isWhite = isWhitePiece(piece)
	local dir = isWhite and -1 or 1
	
	if toRow == fromRow + dir and toCol == lastTo[2] then
		return true
	end
	
	return false
end

local function canCastle(board, fromRow, fromCol, toRow, toCol, moveHistory, pieceColor, castlingRights)
	-- Check castling rights based on color
	local isWhite = pieceColor == 1
	local kingMoved = isWhite and castlingRights[1] or castlingRights[4]
	
	if kingMoved then
		return false
	end
	
	-- Check which side castling
	local isKingSide = toCol > fromCol
	local rookMoved = false
	
	if isWhite then
		rookMoved = isKingSide and castlingRights[2] or castlingRights[3]
	else
		rookMoved = isKingSide and castlingRights[5] or castlingRights[6]
	end
	
	if rookMoved then
		return false
	end
	
	-- Check if squares between king and rook are empty
	local rookCol = isKingSide and 8 or 1
	if not isPathClear(board, fromRow, fromCol, fromRow, rookCol) then
		return false
	end
	
	-- Check if rook is actually there
	if board[fromRow] == nil or board[fromRow][rookCol] == nil or board[fromRow][rookCol] == 0 then
		return false
	end
	
	local rookPiece = board[fromRow][rookCol]
	if rookPiece % 10 ~= piece_ts.rook then
		return false
	end
	
	-- Check if king is in check
	if isKingInCheck(board, pieceColor) then
		return false
	end
	
	-- Check intermediate square
	local midCol = isKingSide and fromCol + 1 or fromCol - 1
	local testBoard = {}
	for i = 1, #board do
		testBoard[i] = {}
		if board[i] then
			for j = 1, #board[i] do
				testBoard[i][j] = board[i][j]
			end
		end
	end
	testBoard[fromRow][midCol] = testBoard[fromRow][fromCol]
	testBoard[fromRow][fromCol] = 0
	
	if isKingInCheck(testBoard, pieceColor) then
		return false
	end
	
	return true
end

local function isCheckmate(board, kingColor)
	if not isKingInCheck(board, kingColor) then
		return false
	end
	
	-- Try all possible moves for this color
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				if board[row][col] ~= nil and board[row][col] ~= 0 then
					local pieceType, pieceColor = getPieceInfo(board[row][col])
					if pieceColor == kingColor then
						-- Try all possible destination squares
						for toRow = 1, #board do
							if board[toRow] then
								for toCol = 1, #board[toRow] do
									if isMoveLegal(board, row, col, toRow, toCol) then
										return false -- Found a legal move, not checkmate
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	return true
end

local function isStalemate(board, colorToMove)
	if isKingInCheck(board, colorToMove) then
		return false -- In check, can't be stalemate
	end
	
	-- Check if any legal move exists
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				if board[row][col] ~= nil and board[row][col] ~= 0 then
					local pieceType, pieceColor = getPieceInfo(board[row][col])
					if pieceColor == colorToMove then
						for toRow = 1, #board do
							if board[toRow] then
								for toCol = 1, #board[toRow] do
									if isMoveLegal(board, row, col, toRow, toCol) then
										return false -- Found legal move
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	return true
end

--------------------- ORIGINAL FUNCTIONS ---------------------

local function setBoard(a)
	local result = {}
	for i = 1, #main_mass[a] do
		result[i] = {}
		for j = 1, #main_mass[a][i] do
			result[i][j] = main_mass[a][i][j]
		end
	end
	return result
end

function showDiscription(number_game, pl)
	ui.addPopup(-100, 0, description[number_game], pl, 100, 50, 600, true)
end

function showBoard(p, number_board, bool_show_board)
	if party[number_board]==nil then
		return
	end
	if players_images[p][1]~=nil then
		for i, j in pairs(players_images[p][1]) do
			if j~=nil then
				tfm.exec.removeImage(j)
			end
		end
	end
	if players_images[p][2]~=nil then
		for i, j in pairs(players_images[p][2]) do
			if j~=nil then
				tfm.exec.removeImage(j)
			end
		end
	end

	for i,j in pairs(party[number_board][1]) do
		for i2,j2 in pairs(party[number_board][1][i]) do
			showBoardSquare(i, i2, p, bool_show_board)
		end
	end
end

function string.split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

table.copy = function(list)
	local out = {}
	for k,v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end

function masscopy(list)
	local out = {}
	for k,v in next, list do
		out[k] = {}
		for kx,vx in next, v do
			out[k][kx] = vx
		end
	end
	return out
end

function content_in_mass(ch, mass)
	local bool_y = false
	for k,v in next, mass do
		if v==ch then
			bool_y=true
		end
	end
	return bool_y
end

function get_mass_colors(list)
	local out = {}
	for k,v in next, list do
		for kx,vx in next, v do
			if vx~=nil and content_in_mass(math.floor(vx/10), out)==false and math.floor(vx/10)~=0 then
				out[#out+1] = math.floor(vx/10)
			end
		end
	end
	return out
end

function showBoardSquare(row, column, pl, bool_show_board)
	local setting_pl_party = players_images[pl][3][1]
	
	if party[setting_pl_party][1][row]==nil then
		return
	end
	
	local square = party[setting_pl_party][1][row][column]
	
	local side = players_images[pl][5]
	local sm = getsmesh(name_chess[party[setting_pl_party][5]][4], name_chess[party[setting_pl_party][5]][5], side)
	local testsmesh_x = sm[1]
	local testsmesh_y = sm[2]
	
	if (square~=nil) then
		if bool_show_board then
			if (row+column)%2 == 1 then
				if players_images[pl][1][row*100+column]~= nil then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
				end
				players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][1][1], "?1", image_board[set_board][1][2]+side*column*44+200+testsmesh_x, image_board[set_board][1][3]+side*row*44-22+testsmesh_y, pl, image_board[set_board][1][4], image_board[set_board][1][5], 0, 1)
			else
				if players_images[pl][1][row*100+column]~= nil then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
				end
				players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][2][1], "?1", image_board[set_board][2][2]+side*column*44+200+testsmesh_x, image_board[set_board][2][3]+side*row*44-22+testsmesh_y, pl, image_board[set_board][2][4], image_board[set_board][2][5], 0, 1)
			end
			
			if party[setting_pl_party][2] ~= nil then
				if (party[setting_pl_party][2][1][1] == row) and (party[setting_pl_party][2][1][2] == column) then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][3][1], "?2", image_board[set_board][3][2]+party[setting_pl_party][2][1][2]*44*side+200+testsmesh_x, image_board[set_board][3][3]+party[setting_pl_party][2][1][1]*44*side-22+testsmesh_y, pl, image_board[set_board][3][4], image_board[set_board][3][5], 0, 1)
				end
				if (party[setting_pl_party][2][2][1] == row) and (party[setting_pl_party][2][2][2] == column) then
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][3][1], "?2", image_board[set_board][3][2]+party[setting_pl_party][2][2][2]*44*side+200+testsmesh_x, image_board[set_board][3][3]+party[setting_pl_party][2][2][1]*44*side-22+testsmesh_y, pl, image_board[set_board][3][4], image_board[set_board][3][5], 0, 1)
				end
			end
		end
		
		local color_piece_t = math.floor(square/10)+0
		local item_piece_t = square%10
		
		if players_images[pl][2]~=nil then
			if players_images[pl][2][row*100+column] ~= nil then
				tfm.exec.removeImage(players_images[pl][2][row*100+column])
			end
			if players_images[pl][2][row*100+column+20000] ~= nil then
				tfm.exec.removeImage(players_images[pl][2][row*100+column+20000])
			end
			
			if main_mass_solver[party[setting_pl_party][5]]~=nil and main_mass_solver[party[setting_pl_party][5]][row]~=nil and main_mass_solver[party[setting_pl_party][5]][row][column]~=nil then
				local square_d = main_mass_solver[party[setting_pl_party][5]][row][column]
				local color_piece_t_d = math.floor(square_d/10)+0
				local item_piece_t_d = square_d%10
				if color_piece_t_d~=nil and item_piece_t_d~=nil and (square_d ~= 0) then
					players_images[pl][2][row*100+column+20000] = tfm.exec.addImage(piece_ts_img[color_piece_t_d][item_piece_t_d][1], "?4", piece_ts_img[color_piece_t_d][item_piece_t_d][2]+column*44*side+200+testsmesh_x, piece_ts_img[color_piece_t_d][item_piece_t_d][3]+row*44*side-22+testsmesh_y, pl, piece_ts_img[color_piece_t_d][item_piece_t_d][4], piece_ts_img[color_piece_t_d][item_piece_t_d][5], 0, 0.2)
				end
			end
			
			if (square ~= 0) and item_piece_t~=0 and color_piece_t~=0 and piece_ts_img[color_piece_t]~=nil and piece_ts_img[color_piece_t][item_piece_t]~=nil then
				players_images[pl][2][row*100+column] = tfm.exec.addImage(piece_ts_img[color_piece_t][item_piece_t][1], "?5", piece_ts_img[color_piece_t][item_piece_t][2]+column*44*side+200+testsmesh_x, piece_ts_img[color_piece_t][item_piece_t][3]+row*44*side-22+testsmesh_y, pl, piece_ts_img[color_piece_t][item_piece_t][4], piece_ts_img[color_piece_t][item_piece_t][5], 0, 1)
			end
		end
		return
	end
end

function init()
	for k, l in pairs(main_mass) do
		name_chess[k] = {name_g[k], doppravil[k], description[k], 0, 0}
	end
	
	for i, j in pairs(name_chess) do
		local x_max = 0
		local y_max = 0
		
		for k, l in pairs(main_mass[i]) do
			y_max = y_max + 1
			local x_max_y = 0
			for k, l in pairs(main_mass[i][k]) do
				x_max_y = x_max_y + 1
			end
			if x_max_y> x_max then
				x_max = x_max_y
			end
		end
		name_chess[i][4] = x_max
		name_chess[i][5] = y_max
	end
end

local kop = 0

function eventLoop()
	if boolstartlua then
		startcount = startcount + 1
		
		if startcount> 4 then
			boolstartlua = false
			table.foreach(tfm.get.room.playerList, eventNewPlayer)
			init()
			test()
		end
	end
	
	kop = kop + 1
	if kop%4 == 0 then
		ui.removeTextArea(-781, nil)
	end
end

function eventPlayerLeft(n)
end

eventPlayerDied = tfm.exec.respawnPlayer

function eventNewPlayer(n)
	tfm.exec.addImage("177a312dda6.jpg","?0",0,0, n)
	tfm.exec.respawnPlayer(n)
	
	players_images[n] = {}
	players_images[n][1] = {}
	players_images[n][2] = {}
	players_images[n][3] = {1}
	players_images[n][4] = {}
	players_images[n][5] = 1
	
	local setting_pl_party = players_images[n][3][1]
	
	if party[setting_pl_party]==nil then
		party[setting_pl_party] = {}
		party[setting_pl_party][1] = setBoard(start_party_classic)
		party[setting_pl_party][2] = {{0, 0}, {0, 0}}
		party[setting_pl_party][3] = {{n, {6, 5, 4, 3, 2, 1}}}
		party[setting_pl_party][4] = {}
		party[setting_pl_party][5] = start_party_classic
		party[setting_pl_party][7] = {false, false, false, false, false, false}
	else
		party[setting_pl_party][3][#party[setting_pl_party][3]+1] = {n, {6, 5, 4, 3, 2, 1}}
	end
	
	showBoard(n, players_images[n][3][1], true)
	system.bindMouse(n, true)
	test()
end

function getsmesh(x_count, y_count, side)
	local sm = {0, 0}
	if x_count==4 then sm[1] = 90*side end
	if y_count==4 then sm[2] = 90*side-40 end
	if x_count==5 then sm[1] = 60*side end
	if y_count==5 then sm[2] = 60*side-40 end
	if x_count==9 then sm[1] = -20*side-20 end
	if y_count==9 then sm[2] = -20*side-40 end
	if x_count==8 then sm[1] = 0 end
	if y_count==8 then sm[2] = 0 end
	if x_count==3 then sm[1] = 105*side end
	if y_count==3 then sm[2] = 105*side-40 end
	if x_count==1 then sm[1] = 150*side end
	if y_count==1 then sm[2] = 150*side-40 end
	if side == -1 then
		sm[1] = sm[1]+396
		sm[2] = sm[2]+396
	end
	sm[1] = sm[1]-20
	sm[2] = sm[2]+0
	return sm
end

function showMove(pl, row, column, party_n, stor, bool_show_p, bool_second_move, last_m)
	if party[party_n][1][row]~=nil then
		local fig = party[party_n][1][row][column]
		local last_move = party[party_n][4][#party[party_n][4]]
		
		if last_move~=nil and math.floor(last_move[1]/10)~=math.floor(stor/10) then
		else
			if doppravil[party[party_n][5]][4] then
				if last_move~=nil and bool_second_move then
					local cletka1 = last_move[3]
					local cletka2 = last_move[2]
					local dop_resp_p_m = last_move[4]
					
					if (last_m~=nil and cletka1[1] == last_m[1] and cletka1[2] == last_m[2]) then
						if ((dop_resp_p_m~=nil and dop_resp_p_m~=0) and (stor%10==piece_ts.checker or stor%10==piece_ts.checker_queen)) or (stor%10==piece_ts.checker_per and (math.abs(cletka1[1]-cletka2[1])>1 or math.abs(cletka1[2]-cletka2[2])>1)) then
						else
							return
						end
					else
						return
					end
				else
					if last_move~=nil then
						return
					end
				end
			end
		end
		
		if name_chess[party[party_n][5]][2][1] then
			bool_show_p = false
		end
		
		local side = players_images[pl][5]
		local sm = getsmesh(name_chess[party[party_n][5]][4], name_chess[party[party_n][5]][5], side)
		local smesh_x = sm[1]
		local smesh_y = sm[2]
		
		if fig ~= nil and (not (math.floor(fig/10) == math.floor(stor/10))) and (fig == 0 or bool_show_p) then
			players_images[pl][4][4][#players_images[pl][4][4]+1] = tfm.exec.addImage(image_choose[1][2][1], "!1", image_choose[1][2][2]+column*44*side+200+smesh_x, image_choose[1][2][3]+row*44*side-22+smesh_y, pl, image_choose[1][2][4], image_choose[1][2][5], 0, 1)
			players_images[pl][4][5][#players_images[pl][4][5]+1] = {row, column}
		end
	end
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
	
	-- Pawn movement
	if piece_t_choose == piece_ts.pawn then
		local gh_pawn = 1
		if (whitePiece and (party[party_n][1][row+2] == nil or party[party_n][1][row+2][column]==nil)) or (not whitePiece and (party[party_n][1][row-2] == nil or party[party_n][1][row-2][column]==nil)) then
			gh_pawn = 2
		end
		
		-- Forward moves
		for i = 1, gh_pawn do
			local newRow = row + i * dir
			if ispiece_tSquare(newRow, column, party_n) then
				break
			end
			showMove(pl, newRow, column, party_n, piece_t_choose_full, true)
		end
		
		-- Diagonal captures (including en passant)
		for i = -1, 1, 2 do
			local newRow = row + dir
			local newColumn = column + i
			if party[party_n][1][newRow] and party[party_n][1][newRow][newColumn] then
				local targetPiece = party[party_n][1][newRow][newColumn]
				if targetPiece ~= 0 and math.floor(targetPiece/10) ~= fig then
					showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
				else
					-- Check en passant
					local last_move = party[party_n][4][#party[party_n][4]]
					if canEnPassant(party[party_n][1], row, column, newRow, newColumn, last_move) then
						showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
					end
				end
			end
		end
	end
	
	-- Rook/Queen/King movement (horizontal/vertical)
	if piece_t_choose == piece_ts.rook or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per then
		local range = ((piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per) and 1 or 8)
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
	
	-- Knight movement
	if piece_t_choose == piece_ts.knight then
		local coord = {{-2, -1}, {-1, -2}, {-2, 1}, {-1, 2}, {1, -2}, {2, -1}, {1, 2}, {2, 1}}
		for i = 1, 8 do
			local newRow = row + coord[i][1]
			local newColumn = column + coord[i][2]
			showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
		end
	end
	
	-- Bishop/Queen/King movement (diagonal)
	if piece_t_choose == piece_ts.bishop or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.pawn or piece_t_choose == piece_ts.checker_per then
		local isPawn = piece_t_choose == piece_ts.pawn
		local range = ((piece_t_choose == piece_ts.king or isPawn or piece_t_choose == piece_ts.checker_per) and 1 or 8)
		
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, range do
				local newRow = row + j * coord[i][1]
				local newColumn = column + j * coord[i][2]
				
				if isPawn then
					if coord[i][1] == dir then
						local figk = party[party_n][1][newRow] and party[party_n][1][newRow][newColumn] or nil
						if figk == nil or figk == 0 then
							-- Handled in pawn section above
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
	
	-- Castling for King
	if piece_t_choose == piece_ts.king then
		local d = 1
		for i = 1, 2 do
			if column == 5 then
				if not ispiece_tSquare(row, column + d, party_n) and not ispiece_tSquare(row, column + (d * 2), party_n) then
					if d > 0 or not ispiece_tSquare(row, column - 3, party_n) then
						if ((party[party_n][1][row+1] == nil or party[party_n][1][row+1][column] == nil) and whitePiece) or ((party[party_n][1][row-1] == nil or party[party_n][1][row-1][column] == nil) and not whitePiece) then
							local rookCol = d > 0 and 8 or 1
							if (party[party_n][1][row]~= nil and party[party_n][1][row][rookCol]~=nil and party[party_n][1][row][rookCol]%10 == piece_ts.rook) then
								-- Check castling rights
								local castlingRights = party[party_n][7] or {false, false, false, false, false, false}
								if canCastle(party[party_n][1], row, column, row, column + (d > 0 and 2 or -2), party[party_n][4], fig, castlingRights) then
									showMove(pl, row, column + (d > 0 and 2 or -2), party_n, piece_t_choose_full, true)
								end
							end
						end
					end
				end
			end
			d = -d
		end
	end
	
	-- Checker movements
	if piece_t_choose == piece_ts.checker_per then
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}, {-1, 0}, {0, -1}, {1, 0}, {0, 1}}
		for i = 1, 8 do
			local newRow = row + 2*coord[i][1]
			local newColumn = column + 2*coord[i][2]
			if party[party_n][1][row + coord[i][1]]~=nil then
				local figk = party[party_n][1][row + coord[i][1]][column + coord[i][2]]
				if figk ~= nil and figk ~= 0 then
					showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true, true, {row, column})
				end
			end
		end
	end
	
	if piece_t_choose == piece_ts.checker then
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, 2 do
				local newRow = row + j*coord[i][1]
				local newColumn = column + j*coord[i][2]
				
				if j == 2 then
					if party[party_n][1][row + coord[i][1]]~=nil then
						local figk = party[party_n][1][row + coord[i][1]][column + coord[i][2]]
						if figk ~= nil and figk ~= 0 then
							if math.floor(figk/10)~= fig and (party[party_n][1][newRow]~=nil and party[party_n][1][newRow][newColumn] == 0) then
								showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true, true, {row, column})
							end
						end
					end
				else
					if coord[i][1] == dir then
						showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, false)
					end
				end
			end
		end
	end
	
	if piece_t_choose == piece_ts.checker_queen then
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
		for i = 1, 4 do
			for j = 1, 8 do
				local newRow = row + j*coord[i][1]
				local newColumn = column + j*coord[i][2]
				
				showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, false)
				if ispiece_tSquare(newRow, newColumn, party_n) then
					local figk = party[party_n][1][newRow][newColumn]
					if math.floor(figk/10) ~= fig then
						showMove(pl, newRow+coord[i][1], newColumn+coord[i][2], party_n, piece_t_choose_full, false, true, {row, column})
					end
					break
				end
			end
		end
	end
end

function eventMouse(pl, xpl, ypl)
	if players_images[pl] == nil or players_images[pl][3]==nil or players_images[pl][3][1]==nil then
		return
	end
	local party_local = party[players_images[pl][3][1]]
	
	local side = players_images[pl][5]
	local sm = getsmesh(name_chess[party_local[5]][4], name_chess[party_local[5]][5], side)
	local smesh_x = sm[1]
	local smesh_y = sm[2]
		
	local x_click = math.floor((xpl-200-smesh_x)/44*side)
	local y_click = (math.floor((ypl+22-smesh_y)/44*side))
	
	if (side==-1) then
		x_click = x_click + 1
		y_click = y_click + 1
	end
	
	if (players_images[pl][4][1] ==nil) then
		if party_local[1][y_click]~=nil and party_local[1][y_click][x_click] ~= 0 and party_local[1][y_click][x_click]~=nil then
			if (((party_local[3]~=nil and party_local[3][1]~=nil and party_local[3][1][1]==pl and content_in_mass(math.floor(party_local[1][y_click][x_click]/10), party_local[3][1][2])==true)) or ((party_local[3]~=nil and party_local[3][2]~=nil and party_local[3][2][1]==pl and content_in_mass(math.floor(party_local[1][y_click][x_click]/10), party_local[3][2][2])==true)))==false then
				return
			end
			if party_local[6]~=nil and (party_local[6][2][party_local[6][1]]~=math.floor(party_local[1][y_click][x_click]/10)) and doppravil[party_local[5]][4] then
				return
			end
			
			players_images[pl][4][1] = {y_click, x_click}
			players_images[pl][4][3] = tfm.exec.addImage(image_choose[1][1][1], "!1", image_choose[1][1][2]+x_click*44*side+200+smesh_x, image_choose[1][1][3]+y_click*44*side-22+smesh_y, pl, image_choose[1][1][4], image_choose[1][1][5], 0, 1)
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
				-- Validate move legality for chess games
				if doppravil[party_local[5]][6] then -- If it's a chess variant
					local pieceColor = math.floor(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]/10)
					if not isMoveLegal(party_local[1], players_images[pl][4][1][1], players_images[pl][4][1][2], y_click, x_click) then
						tfm.exec.chatMessage("<R>Illegal move! This move would put your king in check.", pl)
						break
					end
				end
				
				-- Checker
				if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.checker) and ((x_click+players_images[pl][4][1][2])%2==0) then
					changeMove({players_images[pl][4][1], {(y_click+players_images[pl][4][1][1])/2, (x_click+players_images[pl][4][1][2])/2}, players_images[pl][3][1]}, false)
					changeMove({{(y_click+players_images[pl][4][1][1])/2, (x_click+players_images[pl][4][1][2])/2}, {y_click, x_click}, players_images[pl][3][1]}, true)
					break
				end
				
				-- Checker queen
				if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.checker_queen) then
					local kx_dir = (x_click - players_images[pl][4][1][2])<0 and -1 or 1
					local ky_dir = (y_click - players_images[pl][4][1][1])<0 and -1 or 1
					changeMove({players_images[pl][4][1], {(y_click-ky_dir), (x_click-kx_dir)}, players_images[pl][3][1]}, false)
					changeMove({{(y_click-ky_dir), (x_click-kx_dir)}, {y_click, x_click}, players_images[pl][3][1]}, true)
					break
				end
				
				-- Pawn promotion
				if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.pawn) then
					if ((isWhitePiece(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]) and (party_local[1][y_click-1]==nil or party_local[1][y_click-1][x_click]==nil)) or (not isWhitePiece(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]) and (party_local[1][y_click+1]==nil or party_local[1][y_click+1][x_click]==nil))) then
						local text = "<textformat leading='40'><p align='center'><font size='25'>PAWN PROMOTION<font size='15'>\n<B>"
						for k, v in next, {{'<ROSE>Queen', 2}, {'<J>Rook', 3}, {'<PT>Bishop', 4}, {'<BV>Knight', 5}} do
							text = text .."<a href='event:transform"..v[2]..y_click.."k"..x_click.."'>"..v[1].."</a> "
						end
						ui.addTextArea(-700000, text, pl, 247, 45, 306, 306, nil, nil, .9, true)
						return
					else
						-- En passant
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
				
				-- Castling
				if (party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]~=nil and party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]%10 == piece_ts.king) and math.abs(players_images[pl][4][1][2] - x_click) == 2 then
					if players_images[pl][4][1][2] - x_click < 0 then
						changeMove({{y_click, 8}, {y_click, 6}, players_images[pl][3][1]}, false)
						changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 8}, {y_click, 6}}}}, true)
					else
						changeMove({{y_click, 1}, {y_click, 4}, players_images[pl][3][1]}, false)
						changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 1}, {y_click, 4}}}}, true)
					end
					break
				end
				
				changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
			end
		end
		
		tfm.exec.removeImage(players_images[pl][4][3])
		players_images[pl][4][1] = nil
		players_images[pl][4][3] = nil
		for i, j in pairs(players_images[pl][4][4]) do
			tfm.exec.removeImage(j)
		end
		players_images[pl][4][4] = {}
		players_images[pl][4][5] = {}
	end
end

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
		showBoardSquare(row, column, nick, true)
	end
end

function win(party_j, num_color, pl_k)
	if pl_k == nil then
		local masspl = party[party_j][3]
		for k = 1, #masspl do
			local mass_d = masspl[k][2]
			for kj = 1, #mass_d do
				if mass_d[kj]==num_color then
					show_win(masspl[k][1], party_j)
				end
			end
		end
	else
		local masspl = party[party_j][3]
		local pl_u = ""
		for k = 1, #masspl do
			local mass_d = masspl[k][1]
			if mass_d~=pl_k then
				pl_u = mass_d
			end
		end
		show_win(pl_u, party_j)
	end
end

function changeMove(move, bool_writed, bool_up)
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
		return
	end
	
	if party[party_m][1][second[1]] == nil then
		return
	end
	if (party[party_m][1][second[1]][second[2]]==nil) then
		return
	end
	if party[party_m][1][first[1]] == nil then
		return
	end
	if (party[party_m][1][first[1]][first[2]]==nil) then
		return
	end
	
	if (party[party_m][1][first[1]][first[2]]==0) then
		return
	end
	
	local item = party[party_m][1][first[1]][first[2]]
	
	-- Track castling rights
	if party[party_m][7] == nil then
		party[party_m][7] = {false, false, false, false, false, false}
	end
	
	local pieceType = item % 10
	local pieceColor = math.floor(item / 10)
	
	-- Update castling rights when king moves
	if pieceType == piece_ts.king then
		if pieceColor == 1 then
			party[party_m][7][1] = true -- White king moved
		else
			party[party_m][7][4] = true -- Black king moved
		end
	end
	
	-- Update castling rights when rook moves
	if pieceType == piece_ts.rook then
		if pieceColor == 1 then
			if first[1] == 8 and first[2] == 8 then
				party[party_m][7][2] = true -- White king-side rook moved
			elseif first[1] == 8 and first[2] == 1 then
				party[party_m][7][3] = true -- White queen-side rook moved
			end
		else
			if first[1] == 1 and first[2] == 8 then
				party[party_m][7][5] = true -- Black king-side rook moved
			elseif first[1] == 1 and first[2] == 1 then
				party[party_m][7][6] = true -- Black queen-side rook moved
			end
		end
	end
	
	-- Update castling rights if rook is captured
	local capturedPiece = party[party_m][1][second[1]][second[2]]
	if capturedPiece ~= 0 and capturedPiece % 10 == piece_ts.rook then
		local capturedColor = math.floor(capturedPiece / 10)
		if capturedColor == 1 then
			if second[1] == 8 and second[2] == 8 then
				party[party_m][7][2] = true
			elseif second[1] == 8 and second[2] == 1 then
				party[party_m][7][3] = true
			end
		else
			if second[1] == 1 and second[2] == 8 then
				party[party_m][7][5] = true
			elseif second[1] == 1 and second[2] == 1 then
				party[party_m][7][6] = true
			end
		end
	end
	
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

	if name_chess[party[party_m][5]][2][2] then
		if bool_up then
			if item%10 >1 and item%10<6 then
				if item%10 == 5 then
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+2
				else
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+item%10 +1
				end
			end
		else
			if item%10 >1 and item%10<6 then
				if item%10 == 2 then
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+5
				else
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+item%10 - 1
				end
			end
		end
	end
	
	local pr2 = party[party_m][2]
	party[party_m][2] = {{first[1], first[2]}, {second[1], second[2]}}
	
	if (item%10 == piece_ts.checker) and ((isWhitePiece(item) and (party[party_m][1][second[1]-1]==nil))or(not isWhitePiece(item) and (party[party_m][1][second[1]+1]==nil))) then
		party[party_m][1][second[1]][second[2]] = item + 1 
	end
	
	if party[party_m][6]~=nil and bool_writed and doppravil[party[party_m][5]][5]==false then
		party[party_m][6][1] = party[party_m][6][1] + 1
		if party[party_m][6][2][party[party_m][6][1]]==nil then
			party[party_m][6][1] = 1
		end
	end
	
	-- Check for checkmate/check after move
	if doppravil[party[party_m][5]][6]==true and localsave~=nil then
		local currentColor = math.floor(item/10)
		local opponentColor = currentColor == 1 and 6 or 1
		
		if isCheckmate(party[party_m][1], opponentColor) then
			-- Mark move as checkmate
			if localsave then
				localsave[8] = true
			end
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<R>Checkmate! Game over.", nick)
				end
			end
			win(party_m, currentColor)
		elseif isKingInCheck(party[party_m][1], opponentColor) then
			-- Mark move as check
			if localsave then
				localsave[9] = true
			end
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<J>Check!", nick)
				end
			end
		elseif isStalemate(party[party_m][1], opponentColor) then
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<BV>Stalemate! Game is a draw.", nick)
				end
			end
		end
	end
	
	if doppravil[party[party_m][5]][6]==true and localsave~=nil and localsave[4]~=nil and ((localsave[4]%10)==1) then
		win(party_m, math.floor((party[party_m][1][second[1]][second[2]])/10))
	end
	
	for nick in pairs(tfm.get.room.playerList) do
		showBoardSquare(pr2[1][1], pr2[1][2], nick, true)
		showBoardSquare(pr2[2][1], pr2[2][2], nick, true)
		showBoardSquare(first[1], first[2], nick, true)
		showBoardSquare(second[1], second[2], nick, true)
	end
	
	test_hod()
end

function eventTextAreaCallback(id, pl, cmd)
	local setting_pl_party = players_images[pl][3][1]
	
	if cmd == "show_full_history" then
		show_full_move_history(pl)
	end
	
	if cmd == "export_pgn" then
		export_pgn_to_chat(pl)
	end
	
	if cmd == "close_history" then
		ui.removeTextArea(-900, pl)
	end
	if cmd == "new_game_s" then
		show_new_game(pl)
	end
	if cmd == "open_game_s" then
		show_open_room(pl)
	end
	if cmd == "cancel" then
		ui.removeTextArea(id, pl)
	end
	
	if cmd:sub(0, 9) == "transform" then
		local piece_s = (cmd:sub(10, 10))+0
		ui.removeTextArea(-700000, pl)
		
		if piece_s == piece_ts.queen or piece_s == piece_ts.rook or piece_s == piece_ts.bishop or piece_s == piece_ts.knight then
			local xy_s = cmd:sub(11, -1)
			local xy_mass = string.split(xy_s, "k")

			local party_local = party[players_images[pl][3][1]]
			
			if players_images[pl][4][1]==nil then
				return
			end
			
			local fig_ht = party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]
			local new_piece = math.floor(fig_ht/10)*10+piece_s
			
			changeMove({players_images[pl][4][1], {xy_mass[1]+0, xy_mass[2]+0}, players_images[pl][3][1], {fig_ht, new_piece}}, true)
			
			tfm.exec.removeImage(players_images[pl][4][3])
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			
			spawn_piece(new_piece, xy_mass[1]+0, xy_mass[2]+0, players_images[pl][3][1])
		end
	end
	
	if cmd:sub(0, 5) == "party" then
		ui.removeTextArea(-1004, pl)
		ui.removeTextArea(-670, pl)
		local party_s = cmd:sub(6, -1)
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
	
	if cmd:sub(0, 9) == "new_party" then
		ui.removeTextArea(-680, pl)
		local party_so = cmd:sub(10, -1)
		if doppravil[party_so+0][3] then
			show_choose_pl_list(pl, party_so)
			return
		end
		start_g(party_so, pl, nil)
	end
	
	if cmd:sub(0, 6) == "choose" then
		ui.removeTextArea(id, pl)
		local apponent_so = cmd:sub(7, -1)
		if apponent_so~= nil then
			local apponent_so_mass = string.split(apponent_so, "&")
			show_dialog_apponent(apponent_so_mass[2], pl, apponent_so_mass[1])
		end
	end
	
	if cmd:sub(0, 6) == "accept" then
		ui.removeTextArea(id, pl)
		local apponent_so = cmd:sub(7, -1)
		if apponent_so~= nil then
			local apponent_so_mass = string.split(apponent_so, "&")
			start_g(apponent_so_mass[2], pl, apponent_so_mass[1])
		end
	end
	
	if cmd == "go_sh" then
		local masspl = party[players_images[pl][3][1]][3]
		for k = 1, #masspl do
			show_sh_funt(3, masspl[k][1], players_images[pl][3][1])
		end
	end
	
	if cmd == "flag_sh" then
		win(players_images[pl][3][1], num_color, pl)
	end
	
	if cmd == "shah_sh" then
		local masspl = party[players_images[pl][3][1]][3]
		for k = 1, #masspl do
			show_sh_funt(1, masspl[k][1], players_images[pl][3][1])
		end
	end
	
	if cmd == "mat_sh" then
		local masspl = party[players_images[pl][3][1]][3]
		for k = 1, #masspl do
			show_sh_funt(2, masspl[k][1], players_images[pl][3][1])
		end
	end
		
	if cmd == "return_board" then		
		players_images[pl][5] = players_images[pl][5] * (-1)
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
	
	if cmd == "go" then
		local last_move = party[setting_pl_party][4][#party[setting_pl_party][4]]
		if last_move~=nil and party[setting_pl_party][6][2][party[setting_pl_party][6][1]] ~= math.floor(last_move[1]/10) then
			return
		end
		ui.removeTextArea(id, pl)
		
		if (players_images[pl][4][1] ~=nil) then
			tfm.exec.removeImage(players_images[pl][4][3])
			for i, j in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(j)
			end
		end
		
		if party[setting_pl_party][6]~=nil then
			party[setting_pl_party][6][1] = party[setting_pl_party][6][1] + 1
			if party[setting_pl_party][6][2][party[setting_pl_party][6][1]]==nil then
				party[setting_pl_party][6][1] = 1
			end
		end
		test_hod()
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
				changeMove({cletka1, cletka2, setting_pl_party}, false, true)				
				spawn_piece(last_move[4], cletka1[1]+((cletka2[1]-cletka1[1])>0 and 1 or -1), cletka1[2]+((cletka2[2]-cletka1[2])>0 and 1 or -1), setting_pl_party)
			else
				changeMove({cletka1, cletka2, setting_pl_party}, false, true)
				spawn_piece(last_move[4], cletka1[1], cletka1[2], setting_pl_party)
			end
			
			if change_p_m_o~=nil then
				spawn_piece(change_p_m_o[1], cletka2[1], cletka2[2], setting_pl_party)
			end
			if dop_p_m_o~=nil then
				for j=1, #dop_p_m_o do
					local dop_p_m_o_hod = dop_p_m_o[j]
					changeMove({dop_p_m_o_hod[2], dop_p_m_o_hod[1], setting_pl_party}, false, true)
				end
			end
			if dop_resp_p_m~=nil then
				spawn_piece(dop_resp_p_m[1], dop_resp_p_m[2], dop_resp_p_m[3], setting_pl_party)
			end
			
			if party[setting_pl_party][6]~=nil then
				local gty = party[setting_pl_party][6][1]
				for i=1, #party[setting_pl_party][6][2] do
					if party[setting_pl_party][6][2][i] == math.floor(last_move[1]/10) then
						gty = i
					end
				end
				party[setting_pl_party][6][1] = gty
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

function start_g(party_so, pl, add_pl)
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
	party[num_new_party][1] = setBoard(party_so+0)
	party[num_new_party][2] = {{0, 0}, {0, 0}}
	
	local masser = get_mass_colors(party[num_new_party][1])
	
	if add_pl~=nil then
		party[num_new_party][3] = {{pl, {6}}, {add_pl, {1}}}
		
		if masser[2]~=nil then
			party[num_new_party][3] = {{pl, {masser[2]}}, {add_pl, {masser[1]}}}
		end
		
		players_images[add_pl][3] = {num_new_party+0}
		if (players_images[add_pl][4][1] ~=nil) then
			tfm.exec.removeImage(players_images[add_pl][4][3])
			for i, j in pairs(players_images[add_pl][4][4]) do
				tfm.exec.removeImage(j)
			end
		end

		players_images[add_pl][5] = (-1)
		players_images[add_pl][4] = {}
		ui.removeTextArea(-700000, add_pl)
	else
		party[num_new_party][3] = {{pl, {6, 5, 4, 3, 2, 1}}}
	end
	
	party[num_new_party][4] = {}
	party[num_new_party][5] = party_so+0
	
	party[num_new_party][6] = {1, masser}
	if masser[2]~=nil then
		party[num_new_party][6] = {2, masser}
	end
	
	-- Track castling rights: {whiteKingMoved, whiteRookKingSide, whiteRookQueenSide, blackKingMoved, blackRookKingSide, blackRookQueenSide}
	party[num_new_party][7] = {false, false, false, false, false, false}
	
	showBoard(pl, players_images[pl][3][1], true)
	if add_pl~=nil then
		showBoard(add_pl, players_images[add_pl][3][1], true)
	end
	
	ui.removeTextArea(-1002, pl)
	ui.removeTextArea(-700000, pl)
	test_hod()
	test()
end

function show_sh_funt(num_sh, p_o, p_n)
	if players_images[p_o]~=nil and players_images[p_o][3]~=nil and players_images[p_o][3][1]==p_n then
		local mat_text = name_button[11-1+num_sh].."<br><br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>"
		ui.addTextArea(-781, mat_text, p_o, 100, 150, 100, nil, 1, 0x0000ff, 0.9,true)
	end
end

function show_win(p, p_n)
	local p_mass = party[p_n][3]
	for k=1, #p_mass do
		local p_o = p_mass[k][1]
		if players_images[p_o]~=nil and players_images[p_o][3]~=nil and players_images[p_o][3][1]==p_n then
			local win_text = p.." wins!!!<br><br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>"
			ui.addTextArea(-780, win_text, p_o, 200, 150, 400, nil, 1, 0x0000ff, 0.9,true)
		end
	end
end

function show_dialog_apponent(party_so, pl, app)
	local dialog_text = pl.." "..name_button[9].." - " .. name_chess[party_so+0][1] .. "<br><br><p align='center'><a href='event:accept"..pl.."&"..party_so.."'>"..name_button[8].."</a>    <p align='center'><a href='event:cancel'>"..name_button[1].."</a>"
	ui.addTextArea(-780, dialog_text, app, 200, 150, 400, nil, 1, 0x0000ff, 0.9,true)
end

function show_choose_pl_list(pl, party_so)
	local ch_list = "<p align='center'>"..name_button[10].."<br><p align='left'>"
	for nick in pairs(tfm.get.room.playerList) do
		if nick~=pl or test_mod then
			ch_list = ch_list.."<a href='event:choose"..nick.."&"..party_so.."'>"..nick.."</a><br>"
		end
	end
	ch_list = ch_list .. "<br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>"
	ui.addTextArea(-750, ch_list, pl, 200, 50, 400, nil, 1, 0x0000ff, 0.9,true)
end

function get_coord(cletka1, cletka2, party_u)
	local my = name_chess[party_u][5]
	-- Convert to algebraic notation (e.g., e2-e4)
	local from = mass_ob[cletka1[2]]..(my-cletka1[1]+1)
	local to = mass_ob[cletka2[2]]..(my-cletka2[1]+1)
	return from.."-"..to
end

function get_proper_pgn(move, party_u)
	-- Generate proper PGN notation
	local piece = move[1]
	local pieceType = piece % 10
	local from = move[2]
	local to = move[3]
	local captured = move[4]
	
	local my = name_chess[party_u][5]
	local toSquare = mass_ob[to[2]]..(my-to[1]+1)
	local fromSquare = mass_ob[from[2]]..(my-from[1]+1)
	
	local notation = ""
	
	-- Castling
	if pieceType == piece_ts.king and math.abs(from[2] - to[2]) == 2 then
		if to[2] > from[2] then
			return "O-O" -- King-side castling
		else
			return "O-O-O" -- Queen-side castling
		end
	end
	
	-- Piece prefix (not for pawns)
	if pieceType == piece_ts.king then
		notation = "K"
	elseif pieceType == piece_ts.queen then
		notation = "Q"
	elseif pieceType == piece_ts.rook then
		notation = "R"
	elseif pieceType == piece_ts.bishop then
		notation = "B"
	elseif pieceType == piece_ts.knight then
		notation = "N"
	end
	
	-- For pawn captures, include the file
	if pieceType == piece_ts.pawn and (captured ~= 0 or move[7]) then
		notation = mass_ob[from[2]]
	end
	
	-- Capture notation
	if captured ~= 0 or move[7] then
		notation = notation .. "x"
	end
	
	-- Destination square
	notation = notation .. toSquare
	
	-- Pawn promotion
	if move[5] and move[5][2] then
		local promotedPiece = move[5][2] % 10
		if promotedPiece == piece_ts.queen then
			notation = notation .. "=Q"
		elseif promotedPiece == piece_ts.rook then
			notation = notation .. "=R"
		elseif promotedPiece == piece_ts.bishop then
			notation = notation .. "=B"
		elseif promotedPiece == piece_ts.knight then
			notation = notation .. "=N"
		end
	end
	
	-- Check and checkmate
	if move[8] then
		notation = notation .. "#"
	elseif move[9] then
		notation = notation .. "+"
	end
	
	return notation
end

function test_hod()
	for nick in pairs(tfm.get.room.playerList) do
		local massplk = party[players_images[nick][3][1]][4]
		local jk = party[players_images[nick][3][1]][5]
		local info_partys_pl = ""
		
		-- Show last 15 moves instead of 30
		local start_ma = #massplk - 15
		if start_ma < 1 then
			start_ma = 1
		end
		
		-- Group moves by pairs (white + black)
		local moveNumber = math.floor((start_ma - 1) / 2) + 1
		local isWhiteMove = (start_ma % 2 == 1)
		
		for k = start_ma, #massplk do
			local move = massplk[k]
			local pgn = get_proper_pgn(move, jk)
			
			-- Add move number for white moves
			if isWhiteMove then
				info_partys_pl = info_partys_pl .. moveNumber .. ". "
			end
			
			info_partys_pl = info_partys_pl .. pgn .. " "
			
			-- Toggle between white and black moves
			if isWhiteMove then
				isWhiteMove = false
			else
				isWhiteMove = true
				moveNumber = moveNumber + 1
				info_partys_pl = info_partys_pl .. "\n"
			end
		end
		
		-- Add clickable links for navigation
		local has_more = start_ma > 1
		local nav_text = ""
		if has_more then
			nav_text = "<a href='event:show_full_history'>View Full History</a> | "
		end
		nav_text = nav_text .. "<a href='event:export_pgn'>Export PGN</a>\n"
		
		ui.addTextArea(-1002, nav_text..info_partys_pl, nick, 600, 100, 180, nil, 0x333377, 0x999999, 0.9, true)
		
		local myhod = party[players_images[nick][3][1]][6]
		if myhod~=nil and myhod[2][myhod[1]]~=nil then
			local masspl = party[players_images[nick][3][1]][3]
			
			for k = 1, #masspl do
				if (masspl[k][1]==nick and masspl[k][2][1]==myhod[2][myhod[1]] and doppravil[jk][3]) or test_mod then
					ui.addTextArea(-1003, name_button[2], nick, 600, 70, 90, nil, 0x770000, 0x999999, 0.9,true)
					if doppravil[jk][5] then
						ui.addTextArea(-1004, "<p align='center'><a href='event:go'>"..name_button[3].."</a>", nick, 700, 70, 30, nil, 0x770000, 0x999999, 0.9,true)
					end
				else
					if masspl[k][1]==nick then
						ui.removeTextArea(-1003, nick)
						ui.removeTextArea(-1004, nick)
					end
				end
			end
		end
	end
end

function test()
	ui.addTextArea(-66, "<a href='event:help'> ?</a>", nil, 5, 25, 18, nil, 1, 0x999999, 0.7,true)

	for nick in pairs(tfm.get.room.playerList) do
		if players_images[nick]~=nil then
			ui.addTextArea(-1000, ""..players_images[nick][3][1], nick, 230, 380, nil, nil, 1, 0x999999, 0.7,true)
			
			local masspl = party[players_images[nick][3][1]][3]
			local info_partys_pl = ""
			for k = 1, #masspl do
				if masspl[k][2]~=nil then
					if (#masspl[k][2])+0>1 then
						info_partys_pl = info_partys_pl..""..masspl[k][1].."<br>"
					else
						info_partys_pl = info_partys_pl..""..masspl[k][1].."<font color='#"..color_piece_mass[masspl[k][2][1]].."'>"..symbol_piece_mass[1].."</font>".."<br>"
					end
				end
			end
			
			ui.addTextArea(-1001, ""..info_partys_pl, nick, 600, 30, 180, nil, 1, 0x999999, 0.7,true)
		end
	end

	ui.addTextArea(-67, "<a href='event:open_game_s'>"..name_button[4].."</a>", nil, 120, 380, 100, nil, 1, 0x999999, 0.7,true)
	ui.addTextArea(-68, "<a href='event:new_game_s'>"..name_button[5].."</a>", nil, 10, 380, 100, nil, 1, 0x999999, 0.7,true)

	for i, adm in pairs(admins) do
		ui.addTextArea(-69, "<a href='event:return_move'>"..name_button[6].."</a>", adm, 600, 325, 130, nil, 1, 0x999999, 0.7,true)
	end

	ui.addTextArea(-71, "<a href='event:return_board'>"..name_button[7].."</a>", nil, 600, 355, 130, nil, 1, 0x999999, 0.7,true)
	ui.addTextArea(-73, "<a href='event:shah_sh'>"..name_button[11].."</a>", nil, 600, 295, 50, nil, 1, 0x999999, 0.7,true)
	ui.addTextArea(-72, "<a href='event:mat_sh'>"..name_button[12].."</a>", nil, 660, 295, 50, nil, 1, 0x999999, 0.7,true)
	ui.addTextArea(-74, "<a href='event:go_sh'>"..name_button[13].."</a>", nil, 720, 295, 70, nil, 1, 0x999999, 0.7,true)
	ui.addTextArea(-75, "<a href='event:flag_sh'>"..name_button[14].."</a>", nil, 600, 265, 130, nil, 1, 0x999999, 0.7,true)
end

function show_new_game(pl)
	local nd = "<p align='left'><font size='13'>"
	for i, j in pairs(name_chess) do
		nd = nd .. "<a href='event:new_party"..i.."'>"..i.." "..name_chess[i][1].."</a><br>"
	end
	nd = nd .. "<br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>"
	ui.addTextArea(-680, nd, pl, 5, 50, 250, nil, 1, 0x999999, 0.9,true)
end

function show_open_room(pl)
	local info_partys = ""
	local col = 0
	for i, j in pairs(party) do
		col = col + 1
		local masspl = j[3]
		local info_partys_pl = ""
		for k = 1, #masspl do
			info_partys_pl = info_partys_pl..""..masspl[k][1].." "
		end
		
		info_partys = info_partys.."<a href='event:party"..i.."'>"..i.." "..name_chess[j[5]][1].."</a>".."   ("..info_partys_pl..")".."<br>"
	end
	if col>21 then
		ui.addTextArea(-670, ""..info_partys.."<br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>", pl, 10, 60, 400, 300, 1, 0x999999, 0.9,true)
	else
		ui.addTextArea(-670, ""..info_partys.."<br><p align='center'><a href='event:cancel'>"..name_button[1].."</a>", pl, 10, 60, 400, nil, 1, 0x999999, 0.9,true)
	end
end

function show_full_move_history(pl)
	if players_images[pl] == nil or players_images[pl][3] == nil then
		return
	end
	
	local party_id = players_images[pl][3][1]
	local massplk = party[party_id][4]
	local jk = party[party_id][5]
	
	if #massplk == 0 then
		tfm.exec.chatMessage("<R>No moves recorded yet.", pl)
		return
	end
	
	-- Check if textArea already exists and remove it first
	ui.removeTextArea(-900, pl)
	
	local history_text = "<p align='center'><font size='16'><b>Complete Move History</b></font></p>\n<p align='left'><font size='11'>"
	
	local moveNumber = 1
	local isWhiteMove = true
	local charCount = 200 -- Approximate initial chars
	
	-- Limit to prevent overflow (leave room for formatting)
	local maxMoves = math.min(#massplk, 60) -- Max 60 moves (30 pairs)
	
	for k = 1, maxMoves do
		local move = massplk[k]
		local pgn = get_proper_pgn(move, jk)
		
		-- Add move number for white moves
		local moveText = ""
		if isWhiteMove then
			moveText = moveNumber .. ". " .. pgn .. " "
		else
			moveText = pgn .. " "
		end
		
		-- Check if adding this move would exceed limit
		charCount = charCount + #moveText
		if charCount > 1800 then
			history_text = history_text .. "\n<VP>...truncated (too many moves)</VP>"
			break
		end
		
		history_text = history_text .. moveText
		
		-- Add line break every 2 moves (after black's move)
		if not isWhiteMove then
			history_text = history_text .. "\n"
			moveNumber = moveNumber + 1
		end
		
		isWhiteMove = not isWhiteMove
	end
	
	history_text = history_text .. "</font>\n<p align='center'><a href='event:close_history'>Close</a></p>"
	
	ui.addTextArea(-900, history_text, pl, 150, 50, 500, 300, 0x324650, 0x999999, 0.95, true)
end

function export_pgn_to_chat(pl)
	if players_images[pl] == nil or players_images[pl][3] == nil then
		return
	end
	
	local party_id = players_images[pl][3][1]
	local massplk = party[party_id][4]
	local jk = party[party_id][5]
	
	if #massplk == 0 then
		tfm.exec.chatMessage("<R>No moves to export.", pl)
		return
	end
	
	tfm.exec.chatMessage("<VP>========== PGN Export ==========", pl)
	
	local moveNumber = 1
	local isWhiteMove = true
	local lineText = ""
	local moveCount = 0
	
	for k = 1, #massplk do
		local move = massplk[k]
		local pgn = get_proper_pgn(move, jk)
		
		-- Add move number for white moves
		if isWhiteMove then
			lineText = lineText .. moveNumber .. ". " .. pgn .. " "
		else
			lineText = lineText .. pgn .. " "
		end
		
		moveCount = moveCount + 1
		
		-- Send line every 10 moves or at the end
		if moveCount >= 10 or k == #massplk then
			if not isWhiteMove then
				lineText = lineText .. "\n"
			end
			tfm.exec.chatMessage(lineText, pl)
			lineText = ""
			moveCount = 0
		end
		
		-- Toggle between white and black moves
		if not isWhiteMove then
			moveNumber = moveNumber + 1
		end
		
		isWhiteMove = not isWhiteMove
	end
	
	-- Send any remaining text
	if lineText ~= "" then
		tfm.exec.chatMessage(lineText, pl)
	end
	
	tfm.exec.chatMessage("<VP>================================", pl)
end

-- Initialize module
for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
	tfm.exec["disable" .. v]()
end

for nick in pairs(tfm.get.room.playerList) do
    system.bindMouse(nick, true)
end

init()
tfm.exec.newGame(map_st)
