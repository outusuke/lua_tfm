tfm.exec.chatMessage = function(message, player)
	print(string.format("> [%s] %s", player or "everyone", message))
end

---------------------- PROPERTIES ----------------------
local admins = {"user#0000"}
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
	[[<p align='center'><font size='20'><b><J>Chess</J></b></font><br><p align='left'><font size='14'>Chess (Persian.  شاه مات - Checkmate) is a board puzzle game with special pieces on a 64-cell board for two opponents, combining elements of art, science and sports. The goal of the game is to checkmate the opponent's king.]],
	[[<p align='center'><font size='20'><b><J>Fischer Chess</J></b></font><br><p align='left'><font size='14'>The eleventh world chess champion Robert Fischer proposed his own version of the game. Bobby wanted to move away from well-studied debut tracks. He kept the classic chessboard but placed the pieces of the first and eighth ranks in a random order.]],
	[[<p align='center'><font size='20'><b><J>Chess «Almujannah»</J></b></font><br><p align='left'><font size='14'>One of the old opening tabs (the initial positions of the pieces). It can be obtained from the modern starting position by using the symmetrical moves of white and black.]],
	[[<p align='center'><font size='20'><b><J>Chess with transformation</J></b></font><br><p align='left'><font size='14'>Good training for novice chess players. In this game, the knight turns into a bishop when it moves. The bishop becomes the rook, the rook becomes the queen, and the queen becomes a knight after her turn.]],
	[[<p align='center'><font size='20'><b><J>Bridge-Chess</J></b></font><br><p align='left'><font size='14'>This time the figures are located on different islands.]],
	[[<p align='center'><font size='20'><b><J>Gardner Mini-Chess</J></b></font><br><p align='left'><font size='14'>Gardner's Mini-chess is a variant of chess on a reduced 5×5 board, proposed in 1962. In 2013 it was weakly solved; with optimal play by both sides the result is a draw.]],
	[[<p align='center'><font size='20'><b><J>Checkers</J></b></font><br><p align='left'><font size='14'>Checkers - a logical board game for two players. The goal of the game is to take all the opponent's checkers or to deprive them of the opportunity to move.]],
	[[<p align='center'><font size='20'><b><J>Rearrangement of Guarini 6 horses</J></b></font><br><p align='left'><font size='14'>Although the board is larger and there are three knights on each side, rather than two as in the original Guarini problem, the solution consists of 22 moves (11 white and 11 black).]],
	[[<p align='center'><font size='20'><b><J>Rearrangement of Guarini</J></b></font><br><p align='left'><font size='14'>In the opposite corners of the 3×3 chessboard are two white and two black knights. Swap the white horses with the black ones in the minimum number of moves. The solution consists of 16 permutations (8 white, 8 black).]],
	[[<p align='center'><font size='20'><b><J>Rearranging the 'bridge' horses</J></b></font><br><p align='left'><font size='14'>The board has a rather fancy shape, but for the method of buttons and threads, this is not an obstacle.]],
	[[<p align='center'><font size='20'><b><J>Rearranging the 'bridge' checkers</J></b></font><br><p align='left'><font size='14'>Transfer checkers of the same color to the other side. The checkers should not go back.]],
	[[<p align='center'><font size='20'><b><J>Board-«gun»</J></b></font><br><p align='left'><font size='14'>The pieces move according to the usual rules, but the board has a very original shape. White must checkmate the black king — the solution is in 21 moves!]],
	[[<p align='center'><font size='20'><b><J>V.Shankman's Zigzag</J></b></font><br><p align='left'><font size='14'>The white king takes the black horse (while the horse is stationary and the king does not get under check). The permutation is carried out in 26 moves.]],
	[[<p align='center'><font size='20'><b><J>V.Shankman's Zigzag 2</J></b></font><br><p align='left'><font size='14'>The king and queen change places. To rearrange them (other pieces must return to their original places) requires 107 moves.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners</J></b></font><br><p align='left'><font size='14'>Move all your checkers to the opposite side faster than the opponent.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners 2</J></b></font><br><p align='left'><font size='14'>Try to move all the checkers of the same color to the other side in the minimum number of moves.]],
	[[<p align='center'><font size='20'><b><J>Rearranging corners 3</J></b></font><br><p align='left'><font size='14'>Move all your checkers to the opposite side faster than the opponent.]]
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

-- Piece type constants
local piece_ts = {
	king         = 1,
	queen        = 2,
	rook         = 3,
	bishop       = 4,
	knight       = 5,
	pawn         = 6,
	checker      = 7,
	checker_queen = 8,
	checker_per  = 9
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

--------------------- UTILITY FUNCTIONS ---------------------

function string.split(s, delimiter)
	local result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

table.copy = function(list)
	local out = {}
	for k, v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end

function masscopy(list)
	local out = {}
	for k, v in next, list do
		out[k] = {}
		for kx, vx in next, v do
			out[k][kx] = vx
		end
	end
	return out
end

function content_in_mass(ch, mass)
	for _, v in next, mass do
		if v == ch then return true end
	end
	return false
end

function get_mass_colors(list)
	local out = {}
	for _, v in next, list do
		for _, vx in next, v do
			if vx ~= nil and vx ~= 0 and not content_in_mass(math.floor(vx / 10), out) then
				out[#out + 1] = math.floor(vx / 10)
			end
		end
	end
	return out
end

-- Safe player image table initializer
local function ensurePlayerImages(pl)
	if players_images[pl] == nil then
		players_images[pl] = {}
	end
	players_images[pl][1] = players_images[pl][1] or {}
	players_images[pl][2] = players_images[pl][2] or {}
	players_images[pl][3] = players_images[pl][3] or {1}
	players_images[pl][4] = players_images[pl][4] or {}
	players_images[pl][5] = players_images[pl][5] or 1
end

-- Safe move selection table initializer
local function ensureMoveTable(pl)
	if players_images[pl] == nil then return end
	players_images[pl][4] = players_images[pl][4] or {}
	players_images[pl][4][4] = players_images[pl][4][4] or {}
	players_images[pl][4][5] = players_images[pl][4][5] or {}
end

--------------------- CHESS VALIDATION FUNCTIONS ---------------------

local function isWhitePiece(piece)
	return math.floor(piece / 10) == 1
end

local function getPieceInfo(piece)
	return piece % 10, math.floor(piece / 10)
end

-- Returns true if the square contains a piece (not nil, not 0)
local function ispiece_tSquare(row, column, partyk)
	if party[partyk] == nil then return false end
	if party[partyk][1][row] == nil then return false end
	local sq = party[partyk][1][row][column]
	return sq ~= nil and sq ~= 0
end

-- Returns true if a square exists on the board (even if empty)
local function isValidSquare(board, row, col)
	return board[row] ~= nil and board[row][col] ~= nil
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
	if not isValidSquare(board, fromRow, fromCol) then return false end
	local piece = board[fromRow][fromCol]
	if piece == nil or piece == 0 then return false end
	local pieceType, pieceColor = getPieceInfo(piece)
	local dir = (pieceColor == 1) and -1 or 1

	if pieceType == piece_ts.pawn then
		return toRow == fromRow + dir and math.abs(toCol - fromCol) == 1
	end
	if pieceType == piece_ts.knight then
		local dr, dc = math.abs(toRow - fromRow), math.abs(toCol - fromCol)
		return (dr == 2 and dc == 1) or (dr == 1 and dc == 2)
	end
	if pieceType == piece_ts.king then
		return math.abs(toRow - fromRow) <= 1 and math.abs(toCol - fromCol) <= 1
	end
	if pieceType == piece_ts.bishop or pieceType == piece_ts.queen then
		if math.abs(toRow - fromRow) == math.abs(toCol - fromCol) then
			return isPathClear(board, fromRow, fromCol, toRow, toCol)
		end
	end
	if pieceType == piece_ts.rook or pieceType == piece_ts.queen then
		if fromRow == toRow or fromCol == toCol then
			return isPathClear(board, fromRow, fromCol, toRow, toCol)
		end
	end
	return false
end

local function isKingInCheck(board, kingColor)
	local kingRow, kingCol = nil, nil
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				local sq = board[row][col]
				if sq ~= nil and sq ~= 0 then
					local pt, pc = getPieceInfo(sq)
					if pt == piece_ts.king and pc == kingColor then
						kingRow, kingCol = row, col
					end
				end
			end
		end
	end
	if not kingRow then return false end

	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				local sq = board[row][col]
				if sq ~= nil and sq ~= 0 then
					local _, pc = getPieceInfo(sq)
					if pc ~= kingColor then
						if canPieceAttackSquare(board, row, col, kingRow, kingCol) then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

-- Simulate a move on a copied board and check if own king is exposed
local function isMoveLegal(board, fromRow, fromCol, toRow, toCol)
	if not isValidSquare(board, fromRow, fromCol) then return false end
	if not isValidSquare(board, toRow, toCol) then return false end
	local piece = board[fromRow][fromCol]
	if piece == nil or piece == 0 then return false end
	local _, pieceColor = getPieceInfo(piece)

	-- Shallow copy board rows that will be modified
	local testBoard = {}
	for i = 1, #board do
		if board[i] then
			testBoard[i] = {}
			for j = 1, #board[i] do
				testBoard[i][j] = board[i][j]
			end
		end
	end
	testBoard[toRow][toCol] = piece
	testBoard[fromRow][fromCol] = 0
	return not isKingInCheck(testBoard, pieceColor)
end

local function canEnPassant(board, fromRow, fromCol, toRow, toCol, lastMove)
	if not lastMove or lastMove[1] % 10 ~= piece_ts.pawn then return false end
	local lastFrom, lastTo = lastMove[2], lastMove[3]
	if math.abs(lastFrom[1] - lastTo[1]) ~= 2 then return false end
	if lastTo[1] ~= fromRow or math.abs(lastTo[2] - fromCol) ~= 1 then return false end
	local piece = board[fromRow][fromCol]
	local dir = isWhitePiece(piece) and -1 or 1
	return toRow == fromRow + dir and toCol == lastTo[2]
end

local function canCastle(board, fromRow, fromCol, toRow, toCol, pieceColor, castlingRights)
	if castlingRights == nil then return false end
	local isWhite = pieceColor == 1
	local kingMoved = isWhite and castlingRights[1] or castlingRights[4]
	if kingMoved then return false end

	local isKingSide = toCol > fromCol
	local rookMoved
	if isWhite then
		rookMoved = isKingSide and castlingRights[2] or castlingRights[3]
	else
		rookMoved = isKingSide and castlingRights[5] or castlingRights[6]
	end
	if rookMoved then return false end

	local rookCol = isKingSide and 8 or 1
	if not isPathClear(board, fromRow, fromCol, fromRow, rookCol) then return false end

	local rookSq = board[fromRow] and board[fromRow][rookCol]
	if rookSq == nil or rookSq == 0 or rookSq % 10 ~= piece_ts.rook then return false end

	if isKingInCheck(board, pieceColor) then return false end

	-- Check the transit square
	local midCol = isKingSide and fromCol + 1 or fromCol - 1
	local testBoard = {}
	for i = 1, #board do
		if board[i] then
			testBoard[i] = {}
			for j = 1, #board[i] do
				testBoard[i][j] = board[i][j]
			end
		end
	end
	testBoard[fromRow][midCol] = testBoard[fromRow][fromCol]
	testBoard[fromRow][fromCol] = 0
	if isKingInCheck(testBoard, pieceColor) then return false end

	return true
end

-- *** FIX: generate legal moves for a piece to correctly detect checkmate/stalemate ***
-- This mirrors trans() logic but is pure (no UI calls), used for checkmate detection.
local function generateLegalMovesForPiece(board, row, col, party_m, lastMove)
	local moves = {}
	if not isValidSquare(board, row, col) then return moves end
	local piece = board[row][col]
	if piece == nil or piece == 0 then return moves end

	local pieceType = piece % 10
	local pieceColor = math.floor(piece / 10)
	local isWhite = pieceColor == 1
	local dir = isWhite and -1 or 1
	local castlingRights = party[party_m] and party[party_m][7] or {false,false,false,false,false,false}

	local function tryAdd(toRow, toCol)
		if not isValidSquare(board, toRow, toCol) then return false end
		local target = board[toRow][toCol]
		if target == nil then return false end
		if math.floor((target == 0 and 0 or target) / 10) == pieceColor and target ~= 0 then
			return false -- blocked by own piece
		end
		if isMoveLegal(board, row, col, toRow, toCol) then
			moves[#moves + 1] = {toRow, toCol}
		end
		return target ~= 0 -- true = was blocked (stop sliding)
	end

	-- Pawn
	if pieceType == piece_ts.pawn then
		-- Determine if pawn is on its starting rank
		local onStart = (isWhite and (board[row + 2] == nil or board[row + 2][col] == nil) == false)
		            or (not isWhite and (board[row - 2] == nil or board[row - 2][col] == nil) == false)
		local maxFwd = 1
		if (isWhite and row == 7) or (not isWhite and row == 2) then maxFwd = 2 end

		for i = 1, maxFwd do
			local nr = row + i * dir
			if not isValidSquare(board, nr, col) then break end
			if board[nr][col] ~= 0 then break end
			if isMoveLegal(board, row, col, nr, col) then
				moves[#moves + 1] = {nr, col}
			end
		end
		-- Diagonal captures + en passant
		for _, dc in ipairs({-1, 1}) do
			local nr, nc = row + dir, col + dc
			if isValidSquare(board, nr, nc) then
				local target = board[nr][nc]
				if target ~= 0 and target ~= nil and math.floor(target / 10) ~= pieceColor then
					if isMoveLegal(board, row, col, nr, nc) then
						moves[#moves + 1] = {nr, nc}
					end
				elseif canEnPassant(board, row, col, nr, nc, lastMove) then
					if isMoveLegal(board, row, col, nr, nc) then
						moves[#moves + 1] = {nr, nc}
					end
				end
			end
		end
	end

	-- Knight
	if pieceType == piece_ts.knight then
		for _, d in ipairs({{-2,-1},{-1,-2},{-2,1},{-1,2},{1,-2},{2,-1},{1,2},{2,1}}) do
			tryAdd(row + d[1], col + d[2])
		end
	end

	-- Rook / Queen (straight lines)
	if pieceType == piece_ts.rook or pieceType == piece_ts.queen then
		for _, d in ipairs({{-1,0},{1,0},{0,-1},{0,1}}) do
			for j = 1, 8 do
				if tryAdd(row + j*d[1], col + j*d[2]) then break end
			end
		end
	end

	-- Bishop / Queen (diagonals)
	if pieceType == piece_ts.bishop or pieceType == piece_ts.queen then
		for _, d in ipairs({{-1,-1},{-1,1},{1,-1},{1,1}}) do
			for j = 1, 8 do
				if tryAdd(row + j*d[1], col + j*d[2]) then break end
			end
		end
	end

	-- King (single step + castling)
	if pieceType == piece_ts.king then
		for _, d in ipairs({{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}}) do
			tryAdd(row + d[1], col + d[2])
		end
		-- Castling
		if col == 5 then
			for _, d in ipairs({2, -2}) do
				local toCol = col + d
				if canCastle(board, row, col, row, toCol, pieceColor, castlingRights) then
					moves[#moves + 1] = {row, toCol}
				end
			end
		end
	end

	return moves
end

-- *** FIX: checkmate/stalemate now use proper move generation ***
local function hasAnyLegalMove(board, colorToMove, party_m, lastMove)
	for row = 1, #board do
		if board[row] then
			for col = 1, #board[row] do
				local sq = board[row][col]
				if sq ~= nil and sq ~= 0 then
					local _, pc = getPieceInfo(sq)
					if pc == colorToMove then
						local legalMoves = generateLegalMovesForPiece(board, row, col, party_m, lastMove)
						if #legalMoves > 0 then return true end
					end
				end
			end
		end
	end
	return false
end

local function isCheckmate(board, kingColor, party_m, lastMove)
	if not isKingInCheck(board, kingColor) then return false end
	return not hasAnyLegalMove(board, kingColor, party_m, lastMove)
end

local function isStalemate(board, colorToMove, party_m, lastMove)
	if isKingInCheck(board, colorToMove) then return false end
	return not hasAnyLegalMove(board, colorToMove, party_m, lastMove)
end

--------------------- BOARD SETUP ---------------------

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
	if party[number_board] == nil then return end
	if players_images[p] == nil then return end

	if players_images[p][1] ~= nil then
		for _, imgId in pairs(players_images[p][1]) do
			if imgId ~= nil then tfm.exec.removeImage(imgId) end
		end
	end
	if players_images[p][2] ~= nil then
		for _, imgId in pairs(players_images[p][2]) do
			if imgId ~= nil then tfm.exec.removeImage(imgId) end
		end
	end

	for i, _ in pairs(party[number_board][1]) do
		for i2, _ in pairs(party[number_board][1][i]) do
			showBoardSquare(i, i2, p, bool_show_board)
		end
	end
end

function init()
	for k, _ in pairs(main_mass) do
		name_chess[k] = {name_g[k], doppravil[k], description[k], 0, 0}
	end
	for i, _ in pairs(name_chess) do
		local x_max, y_max = 0, 0
		for k, _ in pairs(main_mass[i]) do
			y_max = y_max + 1
			local x_max_y = 0
			for _ in pairs(main_mass[i][k]) do
				x_max_y = x_max_y + 1
			end
			if x_max_y > x_max then x_max = x_max_y end
		end
		name_chess[i][4] = x_max
		name_chess[i][5] = y_max
	end
end

local kop = 0

function eventLoop()
	if boolstartlua then
		startcount = startcount + 1
		if startcount > 4 then
			boolstartlua = false
			table.foreach(tfm.get.room.playerList, eventNewPlayer)
			init()
			test()
		end
	end
	kop = kop + 1
	if kop % 4 == 0 then
		ui.removeTextArea(-781, nil)
	end
end

function eventPlayerLeft(n)
	-- Clean up images for disconnected players
	if players_images[n] ~= nil then
		if players_images[n][1] then
			for _, imgId in pairs(players_images[n][1]) do
				if imgId then tfm.exec.removeImage(imgId) end
			end
		end
		if players_images[n][2] then
			for _, imgId in pairs(players_images[n][2]) do
				if imgId then tfm.exec.removeImage(imgId) end
			end
		end
		players_images[n] = nil
	end
end

eventPlayerDied = tfm.exec.respawnPlayer

function eventNewPlayer(n)
	tfm.exec.addImage("177a312dda6.jpg", "?0", 0, 0, n)
	tfm.exec.respawnPlayer(n)

	players_images[n] = {
		[1] = {},    -- board tile images
		[2] = {},    -- piece images
		[3] = {1},   -- party index
		[4] = {},    -- move selection state
		[5] = 1      -- board orientation (1 = normal, -1 = flipped)
	}

	local setting_pl_party = players_images[n][3][1]

	if party[setting_pl_party] == nil then
		party[setting_pl_party] = {
			[1] = setBoard(start_party_classic),
			[2] = {{0, 0}, {0, 0}},
			[3] = {{n, {6, 5, 4, 3, 2, 1}}},
			[4] = {},
			[5] = start_party_classic,
			[7] = {false, false, false, false, false, false}
		}
	else
		party[setting_pl_party][3][#party[setting_pl_party][3] + 1] = {n, {6, 5, 4, 3, 2, 1}}
	end

	showBoard(n, players_images[n][3][1], true)
	system.bindMouse(n, true)
	test()
end

function getsmesh(x_count, y_count, side)
	local sm = {0, 0}
	local xOffset = {[1]=150,[3]=105,[4]=90,[5]=60,[8]=0,[9]=-20}
	local yOffset = {[1]=105,[3]=105,[4]=90,[5]=60,[8]=0,[9]=-20}
	sm[1] = (xOffset[x_count] or 0) * side
	sm[2] = (yOffset[y_count] or 0) * side - (y_count ~= 8 and 40 or 0)
	if x_count == 9 then sm[1] = sm[1] - 20 end
	if side == -1 then
		sm[1] = sm[1] + 396
		sm[2] = sm[2] + 396
	end
	sm[1] = sm[1] - 20
	return sm
end

function showMove(pl, row, column, party_n, stor, bool_show_p, bool_second_move, last_m)
	if party[party_n] == nil or party[party_n][1][row] == nil then return end
	local fig = party[party_n][1][row][column]
	local last_move = party[party_n][4][#party[party_n][4]]

	if last_move ~= nil and math.floor(last_move[1] / 10) ~= math.floor(stor / 10) then
		-- different color's turn
	else
		if doppravil[party[party_n][5]][4] then
			if last_move ~= nil and bool_second_move then
				local cletka1 = last_move[3]
				local cletka2 = last_move[2]
				local dop_resp_p_m = last_move[4]
				if last_m ~= nil and cletka1[1] == last_m[1] and cletka1[2] == last_m[2] then
					if ((dop_resp_p_m ~= nil and dop_resp_p_m ~= 0) and (stor % 10 == piece_ts.checker or stor % 10 == piece_ts.checker_queen))
					   or (stor % 10 == piece_ts.checker_per and (math.abs(cletka1[1] - cletka2[1]) > 1 or math.abs(cletka1[2] - cletka2[2]) > 1)) then
						-- allow
					else
						return
					end
				else
					return
				end
			else
				if last_move ~= nil then return end
			end
		end
	end

	if name_chess[party[party_n][5]][2][1] then
		bool_show_p = false
	end

	local side = players_images[pl][5]
	local sm = getsmesh(name_chess[party[party_n][5]][4], name_chess[party[party_n][5]][5], side)

	if fig ~= nil and (not (math.floor(fig / 10) == math.floor(stor / 10))) and (fig == 0 or bool_show_p) then
		ensureMoveTable(pl)
		players_images[pl][4][4][#players_images[pl][4][4] + 1] = tfm.exec.addImage(
			image_choose[1][2][1], "!1",
			image_choose[1][2][2] + column * 44 * side + 200 + sm[1],
			image_choose[1][2][3] + row * 44 * side - 22 + sm[2],
			pl, image_choose[1][2][4], image_choose[1][2][5], 0, 1
		)
		players_images[pl][4][5][#players_images[pl][4][5] + 1] = {row, column}
	end
end

function showBoardSquare(row, column, pl, bool_show_board)
	if players_images[pl] == nil then return end
	local setting_pl_party = players_images[pl][3][1]
	if party[setting_pl_party] == nil then return end
	if party[setting_pl_party][1][row] == nil then return end

	local square = party[setting_pl_party][1][row][column]
	local side = players_images[pl][5]
	local sm = getsmesh(name_chess[party[setting_pl_party][5]][4], name_chess[party[setting_pl_party][5]][5], side)

	if square == nil then return end

	if bool_show_board then
		local tileImg = image_board[set_board][(row + column) % 2 == 1 and 1 or 2]
		if players_images[pl][1][row * 100 + column] ~= nil then
			tfm.exec.removeImage(players_images[pl][1][row * 100 + column])
		end
		players_images[pl][1][row * 100 + column] = tfm.exec.addImage(
			tileImg[1], "?1",
			tileImg[2] + side * column * 44 + 200 + sm[1],
			tileImg[3] + side * row * 44 - 22 + sm[2],
			pl, tileImg[4], tileImg[5], 0, 1
		)

		-- Highlight last move squares
		if party[setting_pl_party][2] ~= nil then
			for _, sq in ipairs(party[setting_pl_party][2]) do
				if sq[1] == row and sq[2] == column then
					local hlImg = image_board[set_board][3]
					tfm.exec.removeImage(players_images[pl][1][row * 100 + column])
					players_images[pl][1][row * 100 + column] = tfm.exec.addImage(
						hlImg[1], "?2",
						hlImg[2] + sq[2] * 44 * side + 200 + sm[1],
						hlImg[3] + sq[1] * 44 * side - 22 + sm[2],
						pl, hlImg[4], hlImg[5], 0, 1
					)
				end
			end
		end
	end

	-- Draw solver ghost
	if players_images[pl][2] == nil then players_images[pl][2] = {} end
	if players_images[pl][2][row * 100 + column] ~= nil then
		tfm.exec.removeImage(players_images[pl][2][row * 100 + column])
	end
	if players_images[pl][2][row * 100 + column + 20000] ~= nil then
		tfm.exec.removeImage(players_images[pl][2][row * 100 + column + 20000])
	end

	local solver = main_mass_solver[party[setting_pl_party][5]]
	if solver ~= nil and solver[row] ~= nil and solver[row][column] ~= nil then
		local sq_d = solver[row][column]
		if sq_d ~= 0 and sq_d ~= nil then
			local cpd = math.floor(sq_d / 10)
			local ipd = sq_d % 10
			if cpd ~= 0 and ipd ~= 0 and piece_ts_img[cpd] and piece_ts_img[cpd][ipd] then
				local img = piece_ts_img[cpd][ipd]
				players_images[pl][2][row * 100 + column + 20000] = tfm.exec.addImage(
					img[1], "?4",
					img[2] + column * 44 * side + 200 + sm[1],
					img[3] + row * 44 * side - 22 + sm[2],
					pl, img[4], img[5], 0, 0.2
				)
			end
		end
	end

	-- Draw actual piece
	if square ~= 0 then
		local colorIdx = math.floor(square / 10)
		local typeIdx = square % 10
		if colorIdx ~= 0 and typeIdx ~= 0 and piece_ts_img[colorIdx] and piece_ts_img[colorIdx][typeIdx] then
			local img = piece_ts_img[colorIdx][typeIdx]
			players_images[pl][2][row * 100 + column] = tfm.exec.addImage(
				img[1], "?5",
				img[2] + column * 44 * side + 200 + sm[1],
				img[3] + row * 44 * side - 22 + sm[2],
				pl, img[4], img[5], 0, 1
			)
		end
	end
end

function trans(pl)
	if players_images[pl] == nil or players_images[pl][4] == nil or players_images[pl][4][1] == nil then return end
	local choose_square = players_images[pl][4][1]
	local row, column = choose_square[1], choose_square[2]
	local party_n = players_images[pl][3][1]
	if party[party_n] == nil then return end

	local piece_t_choose_full = party[party_n][1][row][column]
	if piece_t_choose_full == nil then return end
	local piece_t_choose = piece_t_choose_full % 10
	local fig = math.floor(piece_t_choose_full / 10)
	local whitePiece = isWhitePiece(piece_t_choose_full)
	local dir = whitePiece and -1 or 1

	-- Pawn
	if piece_t_choose == piece_ts.pawn then
		local maxFwd = 2
		-- Only allow 2-square advance if the rank ahead exists (i.e. not near edge)
		local r2 = row + 2 * dir
		if (party[party_n][1][r2] == nil or party[party_n][1][r2][column] == nil) then
			maxFwd = 1
		end
		for i = 1, maxFwd do
			local newRow = row + i * dir
			if ispiece_tSquare(newRow, column, party_n) then break end
			showMove(pl, newRow, column, party_n, piece_t_choose_full, true)
		end
		-- Diagonal captures only (NOT en passant — that's handled below via explicit check)
		for _, dc in ipairs({-1, 1}) do
			local newRow = row + dir
			local newColumn = column + dc
			if party[party_n][1][newRow] ~= nil and party[party_n][1][newRow][newColumn] ~= nil then
				local targetPiece = party[party_n][1][newRow][newColumn]
				if targetPiece ~= 0 and math.floor(targetPiece / 10) ~= fig then
					showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
				else
					-- En passant
					local last_move = party[party_n][4][#party[party_n][4]]
					if canEnPassant(party[party_n][1], row, column, newRow, newColumn, last_move) then
						showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true)
					end
				end
			end
		end
	end

	-- Rook / Queen / King / checker_per (straight)
	if piece_t_choose == piece_ts.rook or piece_t_choose == piece_ts.queen
	   or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per then
		local range = (piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per) and 1 or 8
		for _, d in ipairs({{-1,0},{0,-1},{1,0},{0,1}}) do
			for j = 1, range do
				local nr, nc = row + j*d[1], column + j*d[2]
				showMove(pl, nr, nc, party_n, piece_t_choose_full, true)
				if ispiece_tSquare(nr, nc, party_n) then break end
			end
		end
	end

	-- Knight
	if piece_t_choose == piece_ts.knight then
		for _, d in ipairs({{-2,-1},{-1,-2},{-2,1},{-1,2},{1,-2},{2,-1},{1,2},{2,1}}) do
			showMove(pl, row+d[1], column+d[2], party_n, piece_t_choose_full, true)
		end
	end

	-- Bishop / Queen / King (diagonals) — pawn diagonals handled ABOVE only for captures, not here
	if piece_t_choose == piece_ts.bishop or piece_t_choose == piece_ts.queen
	   or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per then
		local range = (piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per) and 1 or 8
		for _, d in ipairs({{-1,-1},{-1,1},{1,-1},{1,1}}) do
			for j = 1, range do
				local nr, nc = row + j*d[1], column + j*d[2]
				showMove(pl, nr, nc, party_n, piece_t_choose_full, true)
				if ispiece_tSquare(nr, nc, party_n) then break end
			end
		end
	end

	-- Castling
	if piece_t_choose == piece_ts.king then
		if column == 5 then
			for _, d in ipairs({2, -2}) do
				local toCol = column + d
				local castlingRights = party[party_n][7] or {false,false,false,false,false,false}
				-- Verify same-row edge conditions (ensure king is at correct rank)
				local isWhiteRank = (party[party_n][1][row+1] == nil or party[party_n][1][row+1][column] == nil)
				local isBlackRank = (party[party_n][1][row-1] == nil or party[party_n][1][row-1][column] == nil)
				if (isWhiteRank and whitePiece) or (isBlackRank and not whitePiece) then
					if canCastle(party[party_n][1], row, column, row, toCol, fig, castlingRights) then
						showMove(pl, row, toCol, party_n, piece_t_choose_full, true)
					end
				end
			end
		end
	end

	-- Checker jump captures
	if piece_t_choose == piece_ts.checker_per then
		for _, d in ipairs({{-1,-1},{-1,1},{1,-1},{1,1},{-1,0},{0,-1},{1,0},{0,1}}) do
			local midR, midC = row + d[1], column + d[2]
			if party[party_n][1][midR] ~= nil then
				local figk = party[party_n][1][midR][midC]
				if figk ~= nil and figk ~= 0 then
					showMove(pl, row + 2*d[1], column + 2*d[2], party_n, piece_t_choose_full, true, true, {row, column})
				end
			end
		end
	end

	if piece_t_choose == piece_ts.checker then
		local coord = {{-1,-1},{-1,1},{1,-1},{1,1}}
		for _, d in ipairs(coord) do
			-- Forward non-capture
			local nr, nc = row + d[1], column + d[2]
			if d[1] == dir then
				showMove(pl, nr, nc, party_n, piece_t_choose_full, false)
			end
			-- Jump capture
			local jnr, jnc = row + 2*d[1], column + 2*d[2]
			if party[party_n][1][nr] ~= nil then
				local figk = party[party_n][1][nr][nc]
				if figk ~= nil and figk ~= 0 and math.floor(figk / 10) ~= fig then
					if party[party_n][1][jnr] ~= nil and party[party_n][1][jnr][jnc] == 0 then
						showMove(pl, jnr, jnc, party_n, piece_t_choose_full, true, true, {row, column})
					end
				end
			end
		end
	end

	if piece_t_choose == piece_ts.checker_queen then
		for _, d in ipairs({{-1,-1},{-1,1},{1,-1},{1,1}}) do
			for j = 1, 8 do
				local nr, nc = row + j*d[1], column + j*d[2]
				showMove(pl, nr, nc, party_n, piece_t_choose_full, false)
				if ispiece_tSquare(nr, nc, party_n) then
					local figk = party[party_n][1][nr][nc]
					if math.floor(figk / 10) ~= fig then
						showMove(pl, nr + d[1], nc + d[2], party_n, piece_t_choose_full, false, true, {row, column})
					end
					break
				end
			end
		end
	end
end

function eventMouse(pl, xpl, ypl)
	if players_images[pl] == nil or players_images[pl][3] == nil or players_images[pl][3][1] == nil then return end
	local party_local = party[players_images[pl][3][1]]
	if party_local == nil then return end

	local side = players_images[pl][5]
	local sm = getsmesh(name_chess[party_local[5]][4], name_chess[party_local[5]][5], side)

	local x_click = math.floor((xpl - 200 - sm[1]) / 44 * side)
	local y_click = math.floor((ypl + 22 - sm[2]) / 44 * side)

	if side == -1 then
		x_click = x_click + 1
		y_click = y_click + 1
	end

	ensureMoveTable(pl)

	if players_images[pl][4][1] == nil then
		-- Select a piece
		if party_local[1][y_click] ~= nil and party_local[1][y_click][x_click] ~= nil
		   and party_local[1][y_click][x_click] ~= 0 then
			local pieceHere = party_local[1][y_click][x_click]
			local allowed = false
			if party_local[3] ~= nil then
				for _, plEntry in ipairs(party_local[3]) do
					if plEntry[1] == pl and content_in_mass(math.floor(pieceHere / 10), plEntry[2]) then
						allowed = true
						break
					end
				end
			end
			if not allowed and not test_mod then return end

			if party_local[6] ~= nil and doppravil[party_local[5]][4] then
				if party_local[6][2][party_local[6][1]] ~= math.floor(pieceHere / 10) then return end
			end

			players_images[pl][4][1] = {y_click, x_click}
			players_images[pl][4][3] = tfm.exec.addImage(
				image_choose[1][1][1], "!1",
				image_choose[1][1][2] + x_click * 44 * side + 200 + sm[1],
				image_choose[1][1][3] + y_click * 44 * side - 22 + sm[2],
				pl, image_choose[1][1][4], image_choose[1][1][5], 0, 1
			)
			for _, imgId in pairs(players_images[pl][4][4]) do
				tfm.exec.removeImage(imgId)
			end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			trans(pl)
		end
	else
		-- Try to make a move
		if players_images[pl][4][1][1] == y_click and players_images[pl][4][1][2] == x_click then
			-- Clicked same square — deselect
			tfm.exec.removeImage(players_images[pl][4][3])
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			for _, imgId in pairs(players_images[pl][4][4]) do tfm.exec.removeImage(imgId) end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
			return
		end

		for _, dest in pairs(players_images[pl][4][5]) do
			if dest[1] == y_click and dest[2] == x_click then
				local fromRow = players_images[pl][4][1][1]
				local fromCol = players_images[pl][4][1][2]

				-- *** FIX: Validate that move doesn't expose own king ***
				if doppravil[party_local[5]][6] then
					if not isMoveLegal(party_local[1], fromRow, fromCol, y_click, x_click) then
						tfm.exec.chatMessage("<R>Illegal move: your king would be in check.", pl)
						break
					end
				end

				local movingPiece = party_local[1][fromRow][fromCol]

				-- Checker jump
				if movingPiece % 10 == piece_ts.checker and (x_click + fromCol) % 2 == 0 then
					changeMove({players_images[pl][4][1], {(y_click+fromRow)/2, (x_click+fromCol)/2}, players_images[pl][3][1]}, false)
					changeMove({{(y_click+fromRow)/2, (x_click+fromCol)/2}, {y_click, x_click}, players_images[pl][3][1]}, true)
					break
				end

				-- Checker queen jump
				if movingPiece % 10 == piece_ts.checker_queen then
					local kx_dir = (x_click - fromCol) < 0 and -1 or 1
					local ky_dir = (y_click - fromRow) < 0 and -1 or 1
					changeMove({players_images[pl][4][1], {y_click-ky_dir, x_click-kx_dir}, players_images[pl][3][1]}, false)
					changeMove({{y_click-ky_dir, x_click-kx_dir}, {y_click, x_click}, players_images[pl][3][1]}, true)
					break
				end

				-- Pawn promotion or en passant
				if movingPiece % 10 == piece_ts.pawn then
					local isWhite = isWhitePiece(movingPiece)
					local atEnd = (isWhite and (party_local[1][y_click-1] == nil or party_local[1][y_click-1][x_click] == nil))
					           or (not isWhite and (party_local[1][y_click+1] == nil or party_local[1][y_click+1][x_click] == nil))
					if atEnd then
						local text = "<textformat leading='40'><p align='center'><font size='25'>PAWN PROMOTION<font size='15'>\n<B>"
						for _, v in next, {{'<ROSE>Queen', 2}, {'<J>Rook', 3}, {'<PT>Bishop', 4}, {'<BV>Knight', 5}} do
							text = text .. "<a href='event:transform" .. v[2] .. y_click .. "k" .. x_click .. "'>" .. v[1] .. "</a> "
						end
						ui.addTextArea(-700000, text, pl, 247, 45, 306, 306, nil, nil, 0.9, true)
						return
					else
						-- En passant
						if math.abs(x_click - fromCol) == 1 and math.abs(y_click - fromRow) == 1
						   and party_local[1][y_click][x_click] == 0 then
							local captured_pawn = party_local[1][fromRow][x_click]
							changeMove({players_images[pl][4][1], {fromRow, x_click}, players_images[pl][3][1]}, false)
							changeMove({{fromRow, x_click}, {y_click, x_click}, players_images[pl][3][1], nil, nil, {captured_pawn, fromRow, x_click}, players_images[pl][4][1]}, true)
						else
							changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
						end
					end
					break
				end

				-- Castling
				if movingPiece % 10 == piece_ts.king and math.abs(fromCol - x_click) == 2 then
					if x_click > fromCol then
						-- King-side
						changeMove({{y_click, 8}, {y_click, 6}, players_images[pl][3][1]}, false)
						changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 8}, {y_click, 6}}}}, true)
					else
						-- Queen-side
						changeMove({{y_click, 1}, {y_click, 4}, players_images[pl][3][1]}, false)
						changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 1}, {y_click, 4}}}}, true)
					end
					break
				end

				changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
				break
			end
		end

		-- Always clear selection after attempting a move
		if players_images[pl][4][3] ~= nil then
			tfm.exec.removeImage(players_images[pl][4][3])
		end
		players_images[pl][4][1] = nil
		players_images[pl][4][3] = nil
		for _, imgId in pairs(players_images[pl][4][4]) do
			tfm.exec.removeImage(imgId)
		end
		players_images[pl][4][4] = {}
		players_images[pl][4][5] = {}
	end
end

function spawn_piece(item, row, column, party_m)
	if party[party_m] == nil then return end
	if party[party_m][1][row] == nil then return end
	if party[party_m][1][row][column] == nil then return end
	party[party_m][1][row][column] = item
	for nick in pairs(tfm.get.room.playerList) do
		showBoardSquare(row, column, nick, true)
	end
end

-- *** FIX: determine player's color in their current party ***
local function getPlayerColor(pl, party_m)
	if party[party_m] == nil then return nil end
	local masspl = party[party_m][3]
	for _, entry in ipairs(masspl) do
		if entry[1] == pl then
			return entry[2][1]
		end
	end
	return nil
end

function win(party_j, num_color, pl_k)
	if party[party_j] == nil then return end
	local masspl = party[party_j][3]
	if pl_k == nil then
		-- Find the player(s) who have this color and show them as winner
		for _, entry in ipairs(masspl) do
			if content_in_mass(num_color, entry[2]) then
				show_win(entry[1], party_j)
			end
		end
	else
		-- Show win for everyone except pl_k (pl_k gave up)
		for _, entry in ipairs(masspl) do
			if entry[1] ~= pl_k then
				show_win(entry[1], party_j)
			end
		end
	end
end

function changeMove(move, bool_writed, bool_up)
	local first        = move[1]
	local second       = move[2]
	local party_m      = move[3]
	local change_p_m   = move[4]
	local dop_move_p_m = move[5]
	local dop_resp_p_m = move[6]
	local dop_savemovefirst_p_m = move[7]

	if first[1] == second[1] and first[2] == second[2] then return end
	if party[party_m] == nil then return end
	if not isValidSquare(party[party_m][1], second[1], second[2]) then return end
	if not isValidSquare(party[party_m][1], first[1], first[2]) then return end
	if party[party_m][1][first[1]][first[2]] == 0 then return end

	local item = party[party_m][1][first[1]][first[2]]
	local pieceType  = item % 10
	local pieceColor = math.floor(item / 10)

	-- Ensure castling rights table exists
	if party[party_m][7] == nil then
		party[party_m][7] = {false, false, false, false, false, false}
	end

	-- Track king moves
	if pieceType == piece_ts.king then
		if pieceColor == 1 then party[party_m][7][1] = true
		else                     party[party_m][7][4] = true end
	end

	-- Track rook moves
	if pieceType == piece_ts.rook then
		if pieceColor == 1 then
			if first[1] == 8 and first[2] == 8 then party[party_m][7][2] = true
			elseif first[1] == 8 and first[2] == 1 then party[party_m][7][3] = true end
		else
			if first[1] == 1 and first[2] == 8 then party[party_m][7][5] = true
			elseif first[1] == 1 and first[2] == 1 then party[party_m][7][6] = true end
		end
	end

	-- Track rook captures (invalidate castling for captured rooks)
	local capturedPiece = party[party_m][1][second[1]][second[2]]
	if capturedPiece ~= nil and capturedPiece ~= 0 and capturedPiece % 10 == piece_ts.rook then
		local capColor = math.floor(capturedPiece / 10)
		if capColor == 1 then
			if second[1] == 8 and second[2] == 8 then party[party_m][7][2] = true
			elseif second[1] == 8 and second[2] == 1 then party[party_m][7][3] = true end
		else
			if second[1] == 1 and second[2] == 8 then party[party_m][7][5] = true
			elseif second[1] == 1 and second[2] == 1 then party[party_m][7][6] = true end
		end
	end

	-- Checker queen promotion check
	local bool_ch = false
	if pieceType == piece_ts.checker then
		if (isWhitePiece(item) and party[party_m][1][second[1] - 1] == nil)
		or (not isWhitePiece(item) and party[party_m][1][second[1] + 1] == nil) then
			bool_ch = true
			change_p_m = {item, item + 1}
		end
	end

	-- Record move in history
	local localsave = nil
	if bool_writed then
		if pieceType == piece_ts.checker or pieceType == piece_ts.checker_queen then
			localsave = {item, tmp_move_square ~= nil and tmp_move_square or {first[1], first[2]}, {second[1], second[2]}, tmp_savefig, change_p_m, dop_move_p_m, dop_resp_p_m}
			tmp_savefig = 0
			tmp_move_square = nil
		else
			localsave = {item, {first[1], first[2]}, {second[1], second[2]}, party[party_m][1][second[1]][second[2]], change_p_m, dop_move_p_m, dop_resp_p_m}
		end
		if dop_savemovefirst_p_m ~= nil then
			localsave[2] = dop_savemovefirst_p_m
		end
		party[party_m][4][#party[party_m][4] + 1] = localsave
	end

	-- Execute the move
	party[party_m][1][first[1]][first[2]] = 0
	if (pieceType == piece_ts.checker or pieceType == piece_ts.checker_queen) and not bool_writed then
		tmp_savefig = party[party_m][1][second[1]][second[2]]
		tmp_move_square = {first[1], first[2]}
	else
		tmp_savefig = 0
		tmp_move_square = nil
	end
	party[party_m][1][second[1]][second[2]] = item

	-- Piece transformation rule (Chess with transformation variant)
	if name_chess[party[party_m][5]][2][2] and pieceType > 1 and pieceType < 6 then
		if bool_up then
			party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10 + (pieceType == 5 and 2 or pieceType + 1)
		else
			party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10 + (pieceType == 2 and 5 or pieceType - 1)
		end
	end

	local pr2 = party[party_m][2]
	party[party_m][2] = {{first[1], first[2]}, {second[1], second[2]}}

	-- Checker promotion
	if pieceType == piece_ts.checker then
		if (isWhitePiece(item) and party[party_m][1][second[1] - 1] == nil)
		or (not isWhitePiece(item) and party[party_m][1][second[1] + 1] == nil) then
			party[party_m][1][second[1]][second[2]] = item + 1
		end
	end

	-- Advance turn counter
	if party[party_m][6] ~= nil and bool_writed and doppravil[party[party_m][5]][5] == false then
		party[party_m][6][1] = party[party_m][6][1] + 1
		if party[party_m][6][2][party[party_m][6][1]] == nil then
			party[party_m][6][1] = 1
		end
	end

	-- *** FIX: use proper move generation for check/checkmate/stalemate detection ***
	if doppravil[party[party_m][5]][6] == true and localsave ~= nil then
		local opponentColor = pieceColor == 1 and 6 or 1
		local lastMoveForDetection = localsave

		if isCheckmate(party[party_m][1], opponentColor, party_m, lastMoveForDetection) then
			if localsave then localsave[8] = true end
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<R>Checkmate! Game over.", nick)
				end
			end
			win(party_m, pieceColor)
		elseif isKingInCheck(party[party_m][1], opponentColor) then
			if localsave then localsave[9] = true end
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<J>Check!", nick)
				end
			end
		elseif isStalemate(party[party_m][1], opponentColor, party_m, lastMoveForDetection) then
			for nick in pairs(tfm.get.room.playerList) do
				if players_images[nick] and players_images[nick][3][1] == party_m then
					tfm.exec.chatMessage("<BV>Stalemate! Draw.", nick)
				end
			end
		end
	end

	-- Win by king capture (non-chess variants)
	if doppravil[party[party_m][5]][6] == true and localsave ~= nil
	   and localsave[4] ~= nil and localsave[4] ~= 0 and (localsave[4] % 10) == piece_ts.king then
		win(party_m, pieceColor)
	end

	-- Refresh visuals for affected squares
	for nick in pairs(tfm.get.room.playerList) do
		if pr2 ~= nil then
			showBoardSquare(pr2[1][1], pr2[1][2], nick, true)
			showBoardSquare(pr2[2][1], pr2[2][2], nick, true)
		end
		showBoardSquare(first[1], first[2], nick, true)
		showBoardSquare(second[1], second[2], nick, true)
	end

	test_hod()
end

function eventTextAreaCallback(id, pl, cmd)
	if players_images[pl] == nil then return end
	local setting_pl_party = players_images[pl][3][1]

	if cmd == "show_full_history" then show_full_move_history(pl) return end
	if cmd == "export_pgn"        then export_pgn_to_chat(pl) return end
	if cmd == "close_history"     then ui.removeTextArea(-900, pl) return end
	if cmd == "new_game_s"        then show_new_game(pl) return end
	if cmd == "open_game_s"       then show_open_room(pl) return end
	if cmd == "cancel"            then ui.removeTextArea(id, pl) return end
	if cmd == "help"              then showDiscription(party[setting_pl_party][5], pl) return end

	-- Pawn promotion
	if cmd:sub(1, 9) == "transform" then
		local piece_s = tonumber(cmd:sub(10, 10))
		ui.removeTextArea(-700000, pl)
		if piece_s and (piece_s == piece_ts.queen or piece_s == piece_ts.rook
		             or piece_s == piece_ts.bishop or piece_s == piece_ts.knight) then
			local xy_s    = cmd:sub(11)
			local xy_mass = string.split(xy_s, "k")
			local party_local = party[setting_pl_party]
			if players_images[pl][4][1] == nil then return end

			local fig_ht    = party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]
			local new_piece = math.floor(fig_ht / 10) * 10 + piece_s
			local destRow   = tonumber(xy_mass[1])
			local destCol   = tonumber(xy_mass[2])

			changeMove({players_images[pl][4][1], {destRow, destCol}, setting_pl_party, {fig_ht, new_piece}}, true)
			spawn_piece(new_piece, destRow, destCol, setting_pl_party)

			if players_images[pl][4][3] ~= nil then tfm.exec.removeImage(players_images[pl][4][3]) end
			players_images[pl][4][1] = nil
			players_images[pl][4][3] = nil
			for _, imgId in pairs(players_images[pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
			players_images[pl][4][4] = {}
			players_images[pl][4][5] = {}
		end
		return
	end

	-- Switch to party
	if cmd:sub(1, 5) == "party" then
		ui.removeTextArea(-1004, pl)
		ui.removeTextArea(-670, pl)
		local party_s = tonumber(cmd:sub(6))
		if party_s == nil then return end
		players_images[pl][3][1] = party_s
		if players_images[pl][4][1] ~= nil then
			if players_images[pl][4][3] then tfm.exec.removeImage(players_images[pl][4][3]) end
			for _, imgId in pairs(players_images[pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
		end
		players_images[pl][4] = {}
		ui.removeTextArea(-700000, pl)
		showBoard(pl, players_images[pl][3][1], true)
		test_hod()
		test()
		return
	end

	-- Start new party
	if cmd:sub(1, 9) == "new_party" then
		ui.removeTextArea(-680, pl)
		local party_so = cmd:sub(10)
		local gameIdx  = tonumber(party_so)
		if gameIdx == nil then return end
		if doppravil[gameIdx] and doppravil[gameIdx][3] then
			show_choose_pl_list(pl, party_so)
			return
		end
		start_g(party_so, pl, nil)
		return
	end

	-- Choose opponent from list
	if cmd:sub(1, 6) == "choose" then
		ui.removeTextArea(id, pl)
		local rest = cmd:sub(7)
		if rest ~= nil and rest ~= "" then
			local parts = string.split(rest, "&")
			if parts[1] and parts[2] then
				show_dialog_apponent(parts[2], pl, parts[1])
			end
		end
		return
	end

	-- Accept invitation
	if cmd:sub(1, 6) == "accept" then
		ui.removeTextArea(id, pl)
		local rest = cmd:sub(7)
		if rest ~= nil and rest ~= "" then
			local parts = string.split(rest, "&")
			if parts[1] and parts[2] then
				start_g(parts[2], pl, parts[1])
			end
		end
		return
	end

	if cmd == "go_sh" then
		local masspl = party[setting_pl_party][3]
		for _, entry in ipairs(masspl) do
			show_sh_funt(3, entry[1], setting_pl_party)
		end
		return
	end

	-- *** FIX: flag_sh now correctly finds the opponent, not undefined num_color ***
	if cmd == "flag_sh" then
		win(setting_pl_party, nil, pl)
		return
	end

	if cmd == "shah_sh" then
		local masspl = party[setting_pl_party][3]
		for _, entry in ipairs(masspl) do show_sh_funt(1, entry[1], setting_pl_party) end
		return
	end

	if cmd == "mat_sh" then
		local masspl = party[setting_pl_party][3]
		for _, entry in ipairs(masspl) do show_sh_funt(2, entry[1], setting_pl_party) end
		return
	end

	if cmd == "return_board" then
		players_images[pl][5] = players_images[pl][5] * (-1)
		if players_images[pl][4][1] ~= nil then
			if players_images[pl][4][3] then tfm.exec.removeImage(players_images[pl][4][3]) end
			for _, imgId in pairs(players_images[pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
		end
		players_images[pl][4] = {}
		ui.removeTextArea(-700000, pl)
		showBoard(pl, players_images[pl][3][1], true)
		test_hod()
		test()
		return
	end

	if cmd == "go" then
		local partyData = party[setting_pl_party]
		local last_move = partyData[4][#partyData[4]]
		if last_move ~= nil and partyData[6] ~= nil then
			if partyData[6][2][partyData[6][1]] ~= math.floor(last_move[1] / 10) then return end
		end
		ui.removeTextArea(id, pl)
		if players_images[pl][4][1] ~= nil then
			if players_images[pl][4][3] then tfm.exec.removeImage(players_images[pl][4][3]) end
			for _, imgId in pairs(players_images[pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
		end
		if partyData[6] ~= nil then
			partyData[6][1] = partyData[6][1] + 1
			if partyData[6][2][partyData[6][1]] == nil then partyData[6][1] = 1 end
		end
		test_hod()
		return
	end

	if cmd == "return_move" then
		local partyData = party[setting_pl_party]
		local last_move = partyData[4][#partyData[4]]
		if last_move == nil then return end

		local cletka1        = last_move[3]
		local cletka2        = last_move[2]
		local change_p_m_o   = last_move[5]
		local dop_p_m_o      = last_move[6]
		local dop_resp_p_m   = last_move[7]

		if (last_move[1] % 10 == piece_ts.checker or last_move[1] % 10 == piece_ts.checker_queen) and last_move[4] ~= 0 then
			changeMove({cletka1, cletka2, setting_pl_party}, false, true)
			local midR = cletka1[1] + ((cletka2[1] - cletka1[1]) > 0 and 1 or -1)
			local midC = cletka1[2] + ((cletka2[2] - cletka1[2]) > 0 and 1 or -1)
			spawn_piece(last_move[4], midR, midC, setting_pl_party)
		else
			changeMove({cletka1, cletka2, setting_pl_party}, false, true)
			spawn_piece(last_move[4], cletka1[1], cletka1[2], setting_pl_party)
		end

		if change_p_m_o ~= nil then
			spawn_piece(change_p_m_o[1], cletka2[1], cletka2[2], setting_pl_party)
		end
		if dop_p_m_o ~= nil then
			for _, hop in ipairs(dop_p_m_o) do
				changeMove({hop[2], hop[1], setting_pl_party}, false, true)
			end
		end
		if dop_resp_p_m ~= nil then
			spawn_piece(dop_resp_p_m[1], dop_resp_p_m[2], dop_resp_p_m[3], setting_pl_party)
		end

		if partyData[6] ~= nil then
			for i, colorVal in ipairs(partyData[6][2]) do
				if colorVal == math.floor(last_move[1] / 10) then
					partyData[6][1] = i
				end
			end
		end

		partyData[4][#partyData[4]] = nil
		ui.removeTextArea(-700000, pl)
		if players_images[pl][4][3] ~= nil then tfm.exec.removeImage(players_images[pl][4][3]) end
		players_images[pl][4][1] = nil
		players_images[pl][4][3] = nil
		for _, imgId in pairs(players_images[pl][4][4] or {}) do
			if imgId then tfm.exec.removeImage(imgId) end
		end
		players_images[pl][4][4] = {}
		players_images[pl][4][5] = {}
		tmp_savefig = 0
		tmp_move_square = nil
		test_hod()
		return
	end
end

function start_g(party_so, pl, add_pl)
	local num_new_party = #party + 1
	players_images[pl][3] = {num_new_party}
	if players_images[pl][4] and players_images[pl][4][1] ~= nil then
		if players_images[pl][4][3] then tfm.exec.removeImage(players_images[pl][4][3]) end
		for _, imgId in pairs(players_images[pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
	end
	players_images[pl][4] = {}

	local gameIdx = tonumber(party_so)
	party[num_new_party] = {
		[1] = setBoard(gameIdx),
		[2] = {{0, 0}, {0, 0}},
		[4] = {},
		[5] = gameIdx,
		[7] = {false, false, false, false, false, false}
	}

	local masser = get_mass_colors(party[num_new_party][1])

	if add_pl ~= nil then
		if masser[2] ~= nil then
			party[num_new_party][3] = {{pl, {masser[2]}}, {add_pl, {masser[1]}}}
		else
			party[num_new_party][3] = {{pl, {6}}, {add_pl, {1}}}
		end

		players_images[add_pl][3] = {num_new_party}
		if players_images[add_pl][4] and players_images[add_pl][4][1] ~= nil then
			if players_images[add_pl][4][3] then tfm.exec.removeImage(players_images[add_pl][4][3]) end
			for _, imgId in pairs(players_images[add_pl][4][4] or {}) do tfm.exec.removeImage(imgId) end
		end
		players_images[add_pl][5] = -1
		players_images[add_pl][4] = {}
		ui.removeTextArea(-700000, add_pl)
	else
		party[num_new_party][3] = {{pl, {6, 5, 4, 3, 2, 1}}}
	end

	if masser[2] ~= nil then
		party[num_new_party][6] = {2, masser}
	else
		party[num_new_party][6] = {1, masser}
	end

	showBoard(pl, players_images[pl][3][1], true)
	if add_pl ~= nil then showBoard(add_pl, players_images[add_pl][3][1], true) end

	ui.removeTextArea(-1002, pl)
	ui.removeTextArea(-700000, pl)
	test_hod()
	test()
end

function show_sh_funt(num_sh, p_o, p_n)
	if players_images[p_o] ~= nil and players_images[p_o][3] ~= nil and players_images[p_o][3][1] == p_n then
		local mat_text = name_button[10 + num_sh] .. "<br><br><p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>"
		ui.addTextArea(-781, mat_text, p_o, 100, 150, 100, nil, 1, 0x0000ff, 0.9, true)
	end
end

function show_win(p, p_n)
	local masspl = party[p_n][3]
	for _, entry in ipairs(masspl) do
		local p_o = entry[1]
		if players_images[p_o] ~= nil and players_images[p_o][3] ~= nil and players_images[p_o][3][1] == p_n then
			local win_text = "<p align='center'><font size='18'><B>" .. p .. " wins!!!</B></font><br><br><p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>"
			ui.addTextArea(-780, win_text, p_o, 200, 150, 400, nil, 1, 0x0000ff, 0.9, true)
		end
	end
end

function show_dialog_apponent(party_so, pl, app)
	local gameIdx = tonumber(party_so)
	local gameName = name_chess[gameIdx] and name_chess[gameIdx][1] or "?"
	local dialog_text = pl .. " " .. name_button[9] .. "- " .. gameName ..
		"<br><br><p align='center'><a href='event:accept" .. pl .. "&" .. party_so .. "'>" .. name_button[8] ..
		"</a>    <p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>"
	ui.addTextArea(-780, dialog_text, app, 200, 150, 400, nil, 1, 0x0000ff, 0.9, true)
end

function show_choose_pl_list(pl, party_so)
	local ch_list = "<p align='center'>" .. name_button[10] .. "<br><p align='left'>"
	for nick in pairs(tfm.get.room.playerList) do
		if nick ~= pl or test_mod then
			ch_list = ch_list .. "<a href='event:choose" .. nick .. "&" .. party_so .. "'>" .. nick .. "</a><br>"
		end
	end
	ch_list = ch_list .. "<br><p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>"
	ui.addTextArea(-750, ch_list, pl, 200, 50, 400, nil, 1, 0x0000ff, 0.9, true)
end

-- Coordinate to algebraic notation
function get_coord(from, to, party_u)
	local my = name_chess[party_u][5]
	return mass_ob[from[2]] .. (my - from[1] + 1) .. "-" .. mass_ob[to[2]] .. (my - to[1] + 1)
end

-- *** FIX: correct PGN notation generation ***
function get_proper_pgn(move, party_u)
	if move == nil then return "?" end
	local piece    = move[1]
	local pieceType = piece % 10
	local from     = move[2]
	local to       = move[3]
	local captured = move[4]
	local my       = name_chess[party_u] and name_chess[party_u][5] or 8
	local toSq     = mass_ob[to[2]] .. (my - to[1] + 1)

	-- Castling
	if pieceType == piece_ts.king and from and to and math.abs(from[2] - to[2]) == 2 then
		return to[2] > from[2] and "O-O" or "O-O-O"
	end

	local prefix = ""
	if     pieceType == piece_ts.king   then prefix = "K"
	elseif pieceType == piece_ts.queen  then prefix = "Q"
	elseif pieceType == piece_ts.rook   then prefix = "R"
	elseif pieceType == piece_ts.bishop then prefix = "B"
	elseif pieceType == piece_ts.knight then prefix = "N"
	end

	-- Pawn captures include source file
	local isCapture = (captured ~= nil and captured ~= 0) or (move[7] ~= nil)
	if pieceType == piece_ts.pawn and isCapture then
		prefix = from and mass_ob[from[2]] or ""
	end

	local captureStr = isCapture and "x" or ""

	local notation = prefix .. captureStr .. toSq

	-- Promotion
	if move[5] ~= nil and move[5][2] ~= nil then
		local promotedType = move[5][2] % 10
		local promStr = ({[2]="=Q",[3]="=R",[4]="=B",[5]="=N"})[promotedType] or ""
		notation = notation .. promStr
	end

	-- Check / Checkmate annotations
	if move[8] then notation = notation .. "#"
	elseif move[9] then notation = notation .. "+" end

	return notation
end

-- *** FIX: correct move numbering (white = odd index, black = even index in history) ***
function test_hod()
	for nick in pairs(tfm.get.room.playerList) do
		if players_images[nick] ~= nil then
			local partyData = party[players_images[nick][3][1]]
			if partyData ~= nil then
				local massplk = partyData[4]
				local jk      = partyData[5]

				local totalMoves = #massplk
				local startIdx   = math.max(1, totalMoves - 14) -- show last ~15 half-moves

				-- move index 1 = white's 1st move (move number 1)
				-- move index 2 = black's 1st move (still move number 1)
				-- move index 3 = white's 2nd move (move number 2), etc.
				local info = ""
				for k = startIdx, totalMoves do
					local move        = massplk[k]
					local pgn         = get_proper_pgn(move, jk)
					local moveNum     = math.ceil(k / 2)
					local isWhiteTurn = (k % 2 == 1)
					if isWhiteTurn then
						info = info .. moveNum .. ". " .. pgn .. " "
					else
						info = info .. pgn .. "\n"
					end
				end

				local hasMore = startIdx > 1
				local nav = (hasMore and "<a href='event:show_full_history'>Full History</a> | " or "")
				         .. "<a href='event:export_pgn'>Export PGN</a>\n"

				ui.addTextArea(-1002, nav .. info, nick, 600, 100, 180, nil, 0x333377, 0x999999, 0.9, true)

				-- Show "Your turn" indicator
				local myhod = partyData[6]
				if myhod ~= nil and myhod[2][myhod[1]] ~= nil then
					local masspl = partyData[3]
					for _, entry in ipairs(masspl) do
						if entry[1] == nick then
							if (content_in_mass(myhod[2][myhod[1]], entry[2]) and doppravil[jk][3]) or test_mod then
								ui.addTextArea(-1003, name_button[2], nick, 600, 70, 90, nil, 0x770000, 0x999999, 0.9, true)
								if doppravil[jk][5] then
									ui.addTextArea(-1004, "<p align='center'><a href='event:go'>" .. name_button[3] .. "</a>", nick, 700, 70, 30, nil, 0x770000, 0x999999, 0.9, true)
								end
							else
								ui.removeTextArea(-1003, nick)
								ui.removeTextArea(-1004, nick)
							end
						end
					end
				end
			end
		end
	end
end

function test()
	ui.addTextArea(-66, "<a href='event:help'> ?</a>", nil, 5, 25, 18, nil, 1, 0x999999, 0.7, true)

	for nick in pairs(tfm.get.room.playerList) do
		if players_images[nick] ~= nil then
			ui.addTextArea(-1000, "" .. players_images[nick][3][1], nick, 230, 380, nil, nil, 1, 0x999999, 0.7, true)

			local masspl = party[players_images[nick][3][1]][3]
			local info_partys_pl = ""
			for _, entry in ipairs(masspl) do
				if entry[2] ~= nil then
					if #entry[2] > 1 then
						info_partys_pl = info_partys_pl .. entry[1] .. "<br>"
					else
						info_partys_pl = info_partys_pl .. entry[1]
							.. "<font color='#" .. color_piece_mass[entry[2][1]] .. "'>"
							.. symbol_piece_mass[1] .. "</font><br>"
					end
				end
			end
			ui.addTextArea(-1001, info_partys_pl, nick, 600, 30, 180, nil, 1, 0x999999, 0.7, true)
		end
	end

	ui.addTextArea(-67, "<a href='event:open_game_s'>" .. name_button[4] .. "</a>", nil, 120, 380, 100, nil, 1, 0x999999, 0.7, true)
	ui.addTextArea(-68, "<a href='event:new_game_s'>" .. name_button[5] .. "</a>", nil, 10, 380, 100, nil, 1, 0x999999, 0.7, true)

	for _, adm in ipairs(admins) do
		ui.addTextArea(-69, "<a href='event:return_move'>" .. name_button[6] .. "</a>", adm, 600, 325, 130, nil, 1, 0x999999, 0.7, true)
	end

	ui.addTextArea(-71, "<a href='event:return_board'>" .. name_button[7] .. "</a>", nil, 600, 355, 130, nil, 1, 0x999999, 0.7, true)
	ui.addTextArea(-73, "<a href='event:shah_sh'>"   .. name_button[11] .. "</a>", nil, 600, 295, 50,  nil, 1, 0x999999, 0.7, true)
	ui.addTextArea(-72, "<a href='event:mat_sh'>"    .. name_button[12] .. "</a>", nil, 660, 295, 50,  nil, 1, 0x999999, 0.7, true)
	ui.addTextArea(-74, "<a href='event:go_sh'>"     .. name_button[13] .. "</a>", nil, 720, 295, 70,  nil, 1, 0x999999, 0.7, true)
	ui.addTextArea(-75, "<a href='event:flag_sh'>"   .. name_button[14] .. "</a>", nil, 600, 265, 130, nil, 1, 0x999999, 0.7, true)
end

function show_new_game(pl)
	local nd = "<p align='left'><font size='13'>"
	for i, _ in pairs(name_chess) do
		nd = nd .. "<a href='event:new_party" .. i .. "'>" .. i .. " " .. name_chess[i][1] .. "</a><br>"
	end
	nd = nd .. "<br><p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>"
	ui.addTextArea(-680, nd, pl, 5, 50, 250, nil, 1, 0x999999, 0.9, true)
end

function show_open_room(pl)
	local info_partys = ""
	local col = 0
	for i, j in pairs(party) do
		col = col + 1
		local info_partys_pl = ""
		for _, entry in ipairs(j[3]) do
			info_partys_pl = info_partys_pl .. entry[1] .. " "
		end
		info_partys = info_partys
			.. "<a href='event:party" .. i .. "'>" .. i .. " " .. name_chess[j[5]][1] .. "</a>"
			.. "   (" .. info_partys_pl .. ")<br>"
	end
	local h = col > 21 and 300 or nil
	ui.addTextArea(-670, info_partys .. "<br><p align='center'><a href='event:cancel'>" .. name_button[1] .. "</a>", pl, 10, 60, 400, h, 1, 0x999999, 0.9, true)
end

-- *** FIX: move numbering now uses index-based logic matching test_hod ***
function show_full_move_history(pl)
	if players_images[pl] == nil or players_images[pl][3] == nil then return end
	local party_id = players_images[pl][3][1]
	local partyData = party[party_id]
	if partyData == nil then return end
	local massplk = partyData[4]
	local jk = partyData[5]

	if #massplk == 0 then
		tfm.exec.chatMessage("<R>No moves recorded yet.", pl)
		return
	end

	ui.removeTextArea(-900, pl)

	local history_text = "<p align='center'><font size='14'><b>Complete Move History</b></font></p>\n<p align='left'><font size='11'>"
	local charCount   = 200
	local maxMoves    = math.min(#massplk, 80)

	for k = 1, maxMoves do
		local move    = massplk[k]
		local pgn     = get_proper_pgn(move, jk)
		local moveNum = math.ceil(k / 2)
		local isWhite = (k % 2 == 1)

		local chunk = isWhite and (moveNum .. ". " .. pgn .. " ") or (pgn .. "\n")
		charCount = charCount + #chunk
		if charCount > 1900 then
			history_text = history_text .. "<VP>... (truncated)</VP>"
			break
		end
		history_text = history_text .. chunk
	end

	history_text = history_text .. "</font>\n<p align='center'><a href='event:close_history'>Close</a>"
	ui.addTextArea(-900, history_text, pl, 150, 50, 500, 300, 0x324650, 0x999999, 0.95, true)
end

-- *** FIX: PGN export move numbering fixed ***
function export_pgn_to_chat(pl)
	if players_images[pl] == nil or players_images[pl][3] == nil then return end
	local party_id  = players_images[pl][3][1]
	local partyData = party[party_id]
	if partyData == nil then return end
	local massplk   = partyData[4]
	local jk        = partyData[5]

	if #massplk == 0 then
		tfm.exec.chatMessage("<R>No moves to export.", pl)
		return
	end

	local gameName = name_chess[jk] and name_chess[jk][1] or "Unknown"
	tfm.exec.chatMessage("<VP>===== PGN: " .. gameName .. " =====", pl)

	local line     = ""
	local halfMove = 0

	for k = 1, #massplk do
		local move    = massplk[k]
		local pgn     = get_proper_pgn(move, jk)
		local moveNum = math.ceil(k / 2)
		local isWhite = (k % 2 == 1)

		if isWhite then
			line = line .. moveNum .. ". " .. pgn .. " "
		else
			line = line .. pgn .. " "
		end

		halfMove = halfMove + 1
		if halfMove >= 10 or k == #massplk then
			tfm.exec.chatMessage(line, pl)
			line     = ""
			halfMove = 0
		end
	end

	if line ~= "" then
		tfm.exec.chatMessage(line, pl)
	end

	tfm.exec.chatMessage("<VP>=========================", pl)
end

function eventChatCommand(pl, cmd)
	if not content_in_mass(pl, admins) then return end
	local args = string.split(cmd, " ")
	local command = args[1]

	if command == "spawn" and args[2] and args[3] and args[4] then
		local pieceCode = tonumber(args[2])
		local row       = tonumber(args[3])
		local col       = tonumber(args[4])
		if pieceCode and row and col then
			local party_m = players_images[pl] and players_images[pl][3][1] or 1
			spawn_piece(pieceCode, row, col, party_m)
			tfm.exec.chatMessage("<J>Spawned piece " .. pieceCode .. " at (" .. row .. "," .. col .. ")", pl)
		end
	end

	if command == "reset" then
		local party_m = players_images[pl] and players_images[pl][3][1] or 1
		if party[party_m] then
			party[party_m][1] = setBoard(party[party_m][5])
			party[party_m][4] = {}
			party[party_m][7] = {false, false, false, false, false, false}
			for nick in pairs(tfm.get.room.playerList) do
				showBoard(nick, party_m, true)
			end
			tfm.exec.chatMessage("<J>Board reset.", pl)
		end
	end

	if command == "info" then
		local party_m = players_images[pl] and players_images[pl][3][1] or 1
		if party[party_m] then
			tfm.exec.chatMessage("<J>Party " .. party_m .. ": " .. name_chess[party[party_m][5]][1]
				.. " | Moves: " .. #party[party_m][4], pl)
		end
	end
end

--------------------- INITIALIZATION ---------------------

for _, flag in ipairs({"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"}) do
	tfm.exec["disable" .. flag]()
end

for nick in pairs(tfm.get.room.playerList) do
	system.bindMouse(nick, true)
end

init()
tfm.exec.newGame(map_st)
