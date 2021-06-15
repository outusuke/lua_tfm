--обозначение доски a1-a4
--если короля съедают то вернуть ход назад и показать шах если 2 раза то выйгрыш
--кнопка сдаться
--время на ход
--при решении задачи выйгрыш

local lang = "RU"

local adm = "Deff83#0000"	--кто может нажимать вернуть ход

local test_mod = false

local start_party_classic = 1
local set_board = 2
local party = {}--массив, board

local players_images = {}

local mass_ob = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"}
local symbol_piece_mass = {'♚', '♛', '♜', '♝', '♞', '♟', '■', '♛', '■'}
local color_piece_mass = {'FFFFFF', 'FF00FF', 'FFFF00', 'FF0000', '00FFFF', '000000'}

local description = {}
local name_g = {}
local name_button = {}

name_g["RU"] = {
	"Ша́хматы", 
	"Ша́хматы Фишера", 
	"Ша́хматы «Альмуджаннах»", 
	"Ша́хматы с превращением", 
	"Шахматы 'мост'",
	"Мини-шахматы Гарднера",
	"Ша́шки",
	"Перестановка Гуарини 6 коней",
	"Перестановка Гуарини",
	"Перестановка коней 'мост'",
	"Перестановка шашек 'мост'",
	"Доска-«пистолет»",
	"Зигзаг В. Шинкмана",
	"Зигзаг В. Шинкмана 2",
	"Перестановка угалки",
	"Перестановка угалки 2",
	"Перестановка угалки 3"
}

description["RU"] = {
	[[<p align='center'><font size='20'><b><J>Ша́хматы</J></b></font><br><p align='left'><font size='14'>Ша́хматы (перс. شاه مات ‘шах мат’, буквальный перевод «шах умер») — настольная логическая игра со специальными фигурами на 64-клеточной доске для двух соперников, сочетающая в себе элементы искусства (в том числе в части шахматной композиции), науки и спорт. Шахматная партия ведётся между двумя соперниками на шахматной доске путём передвижения шахматных фигур. Оба партнёра должны играть по очереди, делая каждый раз один ход. Игрок, который имеет белые фигуры, начинает партию. Если король игрока находится под шахом и игрок не имеет ни одного хода, позволяющего устранить этот шах, этот игрок называется «получившим мат» и, соответственно, он терпит поражение. Цель игры и состоит в том, чтобы поставить мат королю противника.]],
	[[<p align='center'><font size='20'><b><J>Ша́хматы Фишера</J></b></font><br><p align='left'><font size='14'>Одиннадцатый чемпион мира по шахматам Роберт Фишер предложил свой вариант игры, который в последствии получил его имя. Бобби хотел уйти от хорошо изученных дебютных дорожек во многих вариантах. Он оставил классическую шахматную доску, но расположил фигуры первой и восьмой горизонталей в случайном порядке, то есть без четко определенного места. Из-за этого у "шахмат Фишера" есть еще одно название – случайные шахматы Фишера. Здесь представлен один из вариантов расположения фигур.]],
	[[<p align='center'><font size='20'><b><J>Ша́хматы «Альмуджаннах»</J></b></font><br><p align='left'><font size='14'>Одна из старых дебютных табий (начальных расположений фигур). Она может быть получена из современного начального расположения при помощи симметричных ходов белых и черных.]],
	[[<p align='center'><font size='20'><b><J>Ша́хматы с превращением</J></b></font><br><p align='left'><font size='14'>Хорошей тренировкой для начинающих шахматистов послужит последний вариант шахмат, который мы рассмотрим — шахматы с превращением в другие фигуры при каждом ходе. В такой игре конь при своем ходе превращается в слона. Сходивший слон станет ладьей, а ладья — ферзем. Ферзь замыкает цепочку превращения и после своего хода становится конем. Такой вариант шахмат помогает улучшить навыки техники расчета вариантов и глубже понять ценность шахматных фигур не только в плане материала, но и в оценке позиции.]],
	[[<p align='center'><font size='20'><b><J>Шахматы 'мост'</J></b></font><br><p align='left'><font size='14'>На этот раз фигуры расположены на разных островах.]],
	[[<p align='center'><font size='20'><b><J>Мини-шахматы Гарднера</J></b></font><br><p align='left'><font size='14'>Мини-шахматы Гарднера — вариант игры в шахматы на уменьшенной доске 5×5, предложенный в 1962 году американским популяризатором науки Мартином Гарднером (придуман им в процессе программирования электронных машин для игры в шахматы). Здесь присутствуют все традиционные фигуры (по одной), у каждого игрока — по пять пешек и пять фигур. В 2013 году мини-шахматы Гарднера были слабо решены; доказано, что при оптимальной игре обеих сторон результат партии — ничья.]],
	[[<p align='center'><font size='20'><b><J>Ша́шки</J></b></font><br><p align='left'><font size='14'>Ша́шки — логическая настольная игра для двух игроков, заключающаяся в передвижении определённым образом фишек-шашек по клеткам шашечной доски. Во время партии каждому игроку принадлежат шашки одного цвета: чёрного или белого (иногда других цветов, один из которых, считается тёмным, а другой — светлым). Цель игры — взять все шашки соперника или лишить их возможности хода (запереть). Существует несколько вариантов шашек, отличающихся правилами и размерами игрового поля. Здесь дамка при взятии ходит только через одно поле в любую сторону, а не на любое поле диагонали, как в русских или международных шашках.]],
	[[<p align='center'><font size='20'><b><J>Перестановка Гуарини 6 коней</J></b></font><br><p align='left'><font size='14'>Хотя доска больше, и на каждой стороне по три, а не по два коня как в предыдуще задачи Гарини по перестановке коней, метод пуговиц и нитей также позволяет быстро найти необходимую перестановку. Решение состоит из 22 ходов (11 белых и 11 черных).]],
	[[<p align='center'><font size='20'><b><J>Перестановка Гуарини</J></b></font><br><p align='left'><font size='14'>В противоположных углах шахматной доски 3×3 стоят два белых и два черных коня. За минимальное число ходов поменять местами белых коней с черными. Эта задача, придуманная итальянцем Гуарини еще в XVI в., хорошо известна математикам, часто предлагалась на различных олимпиадах и конкурсах. Наиболее изящно она решается при помощи так называемого метода пуговиц и нитей, придуманного известным изобретателем головоломок Г. Дьюдени. Нетрудно убедиться, что решение состоит из 16 перестановок коней (8 ходов белых и 8 ходов черных)]],
	[[<p align='center'><font size='20'><b><J>Перестановка коней "мост"</J></b></font><br><p align='left'><font size='14'>Доска имеет довольно причудливую форму, но для метода пуговиц и нитей это не является препятствием. Распутывая клубок, получаем картину, в котором поле c3 является «транзитным» - связь между «ветками» a2 - d3 и b1 - b3 возможна только через него.]],
	[[<p align='center'><font size='20'><b><J>Перестановка шашек "мост"</J></b></font><br><p align='left'><font size='14'>Необходимо переправить шашки одного цвета на другой берег. При этом шашки не должны ходить обратно.]],
	[[<p align='center'><font size='20'><b><J>Доска-«пистолет»</J></b></font><br><p align='left'><font size='14'>В «позиции» фигуры ходят по обычным правилам, но доска имеет весьма оригинальную форму. Белым на доске-«пистолете» очень тесно, но необходимо поставить мат черному королю, решение в 21 ход! ]],
	[[<p align='center'><font size='20'><b><J>Зигзаг В. Шинкмана</J></b></font><br><p align='left'><font size='14'>Белый король берет черного коня (при этом конь неподвижен, а король не становится под шах). Перестановка осуществляется за 26 ходов]],
	[[<p align='center'><font size='20'><b><J>Зигзаг В. Шинкмана 2</J></b></font><br><p align='left'><font size='14'>король и ферзь меняются местами. Здесь для перестановки короля и ферзя (остальные фигуры должны вернуться на исходные места) приходится совершить 107 (!!) перемещений.]],
	[[<p align='center'><font size='20'><b><J>Перестановка угалки</J></b></font><br><p align='left'><font size='14'>Необходимо быстрее соперника перевести все свои шашки на противоположную сторону.]],
	[[<p align='center'><font size='20'><b><J>Перестановка угалки 2</J></b></font><br><p align='left'><font size='14'>Попробуй переставить все шашки одного цвета на другую сторону за минимальное количество ходов]],
	[[<p align='center'><font size='20'><b><J>Перестановка угалки 3</J></b></font><br><p align='left'><font size='14'>Необходимо быстрее соперника перевести все свои шашки на противоположную сторону.]]
	
}

name_button["RU"] = {
	"отмена",
	"Ваш ход!",
	"GO",
	"История игр",
	"Новая патрия",
	"Вернуть ход",
	"Перевернуть доску",
	"Принять",
	"хочет с вами играть ",
	"Выберите соперника",
	"Шах",
	"Мат",
	"Нажми GO",
	"Сдаться"
}

local doppravil = {--1 сьедать чужую фигуру если false, изменять фигуру на другую если true, соперник, очередность ходов, показывать кнопку GO, перепрыгивать своих, король сьеден мат
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
	{
		nil
	}, 
	{
		nil
	}, 
	{
		nil
	},
	{
		nil
	},
	{
		nil
	},
	{
		nil
	},
	{
		nil
	},
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
		{ 19, 19, 19, 19, 0, 29, 29, 29, 29}
	},
	{
		nil
	},
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

-- Board
local setBoard = function(a)
	return masscopy(main_mass[a])
end

function showDiscription(number_game, pl)
	ui.addPopup(-100, 0, name_chess[number_game][3], pl, 100, 50, 600, true)
end

local piece_ts = {
	king = 1,
	queen = 2,
	rook = 3,--ладья
	bishop = 4,--слон
	knight = 5,--конь
	pawn = 6,--пешка
	checker = 7,--шашка
	checker_queen = 8,--дамка
	checker_per = 9--шашка для уголков
}

local piece_ts_img = {
	{--white
		{"178fee23398.png", 0, 0, 1, 1}, 
		{"178fee2a8cf.png", 0, 0, 1, 1}, 
		{"178fee40874.png", 0, 0, 1, 1}, 
		{"178fee31e06.png", 0, 0, 1, 1}, 
		{"178fee3933d.png", 0, 0, 1, 1}, 
		{"178fee47dad.png", 0, 0, 1, 1},
		
		{"178fee4f2e4.png", 0, 0, 1, 1}, 
		{"178fee50a55.png", 0, 0, 1, 1},
		
		{"178fee4f2e4.png", 0, 0, 1, 1}
	},
	{--pink
		{"178fee24b09.png", 0, 0, 1, 1}, 
		{"178fee2d7b2.png", 0, 0, 1, 1}, 
		{"178fee41fe6.png", 0, 0, 1, 1}, 
		{"178fee33577.png", 0, 0, 1, 1}, 
		{"178fee3aaaf.png", 0, 0, 1, 1}, 
		{"178fee49520.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}, 
		{"178fee5af22.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}
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
		{"178fee5af22.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}
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
		{"178fee5af22.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}
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
		{"178fee5af22.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}
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
		{"178fee5af22.png", 0, 0, 1, 1},
		
		{"178fee596ff.png", 0, 0, 1, 1}
	}
	
}


function showBoard(p, number_board, bool_show_board)
------print(p)
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
		
		--------print(i.."L"..j2)
			showBoardSquare(i, i2, p, bool_show_board)
		end
	end
end

local image_board = {
	
	{{"178fee5c66f.png", 0, 0, 1, 1}, {"178fee521c8.png", 0, 0, 1, 1}, {"178fee5f556.png", 0, 0, 1, 1}},
	{{"178fee5f556.png", 0, 0, 1, 1}, {"178fee550b0.png", 0, 0, 1, 1}, {"178fee5dde2.png", 0, 0, 1, 1}},
	{{"178fee5dde2.png", 0, 0, 1, 1}, {"178fee5393a.png", 0, 0, 1, 1}, {"178fee5c66f.png", 0, 0, 1, 1}}
	
}

local image_choose = {
	{{"178fee57f8f.png", 0, 0, 1, 1}, {"178fee5681e.png", 0, 0, 1, 1}}
}

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

masscopy = function(list)
	local out = {}
	for k,v in next, list do
		out[k] = {}
		for kx,vx in next, v do
			out[k][kx] = vx
		end
	end
	return out
end

content_in_mass = function(ch, mass)
	local bool_y = false
	for k,v in next, mass do
		if v==ch then
			bool_y=true
		end
	end
	return bool_y
end

get_mass_colors = function(list)
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
	
	-- if pl == "Deff83#0000" then
		-- testsmesh_x = 0
	-- end
	
	--------print(pl..">"..row..":"..column)
	
	
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
					------print("tyt")
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][3][1], "?2", image_board[set_board][3][2]+party[setting_pl_party][2][1][2]*44*side+200+testsmesh_x, image_board[set_board][3][3]+party[setting_pl_party][2][1][1]*44*side-22+testsmesh_y, pl, image_board[set_board][3][4], image_board[set_board][3][5], 0, 1)
				end
				if (party[setting_pl_party][2][2][1] == row) and (party[setting_pl_party][2][2][2] == column) then
				------print("tyt2")
					tfm.exec.removeImage(players_images[pl][1][row*100+column])
					
					players_images[pl][1][row*100+column] = tfm.exec.addImage(image_board[set_board][3][1], "?2", image_board[set_board][3][2]+party[setting_pl_party][2][2][2]*44*side+200+testsmesh_x, image_board[set_board][3][3]+party[setting_pl_party][2][2][1]*44*side-22+testsmesh_y, pl, image_board[set_board][3][4], image_board[set_board][3][5], 0, 1)
				end
			end
		end
		

		
		local color_piece_t = math.floor(square/10)+0
		local item_piece_t = square%10
		
		--------print(square)
		if players_images[pl][2]~=nil then
			if players_images[pl][2][row*100+column] ~= nil then
			--------print(players_images[pl][2][1*100+1])
		--	------print(row..":"..column)
				--------print(players_images[pl][2][row*100+column])
				tfm.exec.removeImage(players_images[pl][2][row*100+column])
			end
			if players_images[pl][2][row*100+column+20000] ~= nil then
				tfm.exec.removeImage(players_images[pl][2][row*100+column+20000])
			end
			
			if main_mass_solver[party[setting_pl_party][5]]~=nil and main_mass_solver[party[setting_pl_party][5]][row]~=nil and main_mass_solver[party[setting_pl_party][5]][row][column]~=nil then
				----print(party[setting_pl_party][5])
				local square_d = main_mass_solver[party[setting_pl_party][5]][row][column]
				local color_piece_t_d = math.floor(square_d/10)+0
				local item_piece_t_d = square_d%10
				if color_piece_t_d~=nil and item_piece_t_d~=nil and (square_d ~= 0) then
					players_images[pl][2][row*100+column+20000] = tfm.exec.addImage(piece_ts_img[color_piece_t_d][item_piece_t_d][1], "?4", piece_ts_img[color_piece_t_d][item_piece_t_d][2]+column*44*side+200+testsmesh_x, piece_ts_img[color_piece_t_d][item_piece_t_d][3]+row*44*side-22+testsmesh_y, pl, piece_ts_img[color_piece_t_d][item_piece_t_d][4], piece_ts_img[color_piece_t_d][item_piece_t_d][5], 0, 0.2)
					----print(color_piece_t_d)
					----print(item_piece_t_d)
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
		name_chess[k] = {name_g[lang][k], doppravil[k], description[lang][k], 0, 0}
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

kop = 0

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
	
	kop = kop + 1
	if kop%4 == 0 then
		ui.removeTextArea(-781, nil)
	end
end

-- Player left
eventPlayerLeft = function(n)
end

-- Respawn
eventPlayerDied = tfm.exec.respawnPlayer

-- New Game
eventNewPlayer = function(n)
	tfm.exec.addImage("177a312dda6.jpg","?0",0,0, n)
	tfm.exec.respawnPlayer(n)
	
	
	
	
	players_images[n] = {}
	players_images[n][1] = {}--картинки доски
	players_images[n][2] = {}--картинки фигур
	players_images[n][3] = {1}
	players_images[n][4] = {}--массив нажатий
	players_images[n][5] = 1--сторона доски
	
	-- if n == "Deff83#0000" then
		-- ------print("wwwwwwwwwwwww:"..n)
		-- players_images[n][3] = {2}
	-- end
	
	local setting_pl_party = players_images[n][3][1]
	
	if party[setting_pl_party]==nil then
		party[setting_pl_party] = {}
		party[setting_pl_party][1] = setBoard(start_party_classic)
		party[setting_pl_party][2] = {{0, 0}, {0, 0}}
		party[setting_pl_party][3] = {{n, {6, 5, 4, 3, 2, 1}}}
		party[setting_pl_party][4] = {}
		party[setting_pl_party][5] = start_party_classic
		
	else
		party[setting_pl_party][3][#party[setting_pl_party][3]+1] = {n, {6, 5, 4, 3, 2, 1}}
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
	------print (pio)
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
		------print(row.."/"..column)
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
	
						
				
	if piece_t_choose == piece_ts.rook or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per then
		local range = ((piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.checker_per) and 1 or 8)
		
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
	
	if piece_t_choose == piece_ts.bishop or piece_t_choose == piece_ts.queen or piece_t_choose == piece_ts.king or piece_t_choose == piece_ts.pawn or piece_t_choose == piece_ts.checker_per then
		local isPawn = piece_t_choose == piece_ts.pawn
		local range = ((piece_t_choose == piece_ts.king or isPawn or piece_t_choose == piece_ts.checker_per) and 1 or 8)
		
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
	
	if piece_t_choose == piece_ts.checker_per then
		local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}, {-1, 0}, {0, -1}, {1, 0}, {0, 1}}
		for i = 1, 8 do
			local newRow = row + 2*coord[i][1]
			local newColumn = column + 2*coord[i][2]
			if party[party_n][1][row + coord[i][1]]~=nil then
				local figk = party[party_n][1][row + coord[i][1]][column + coord[i][2]]
				if figk == nil or figk == 0 then
				else
					--if math.floor(figk/10)~= fig and (party[party_n][1][newRow]~=nil and party[party_n][1][newRow][newColumn] == 0) then
						showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true, true, {row, column})
					--end
				end
			end
		end
		
	end
	
	
	if piece_t_choose == piece_ts.checker then
			----print("p")
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
								showMove(pl, newRow, newColumn, party_n, piece_t_choose_full, true, true, {row, column})
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
			----print("p")
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
						showMove(pl, newRow+coord[i][1], newColumn+coord[i][2], party_n, piece_t_choose_full, false, true, {row, column})
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
						------print("@@")
						------print(column + (d > 0 and 2 or -2))
					
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
				
				
			------print(dir)
	if true then
		return
	end	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
end





--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
function getsmesh(x_count, y_count, side)
	local sm = {0, 0}
	if x_count==4 then
		sm[1] = 90*side
	end
	if y_count==4 then
		sm[2] = 90*side-40
	end
	if x_count==5 then
		sm[1] = 60*side
	end
	if y_count==5 then
		sm[2] = 60*side-40
	end
	if x_count==9 then
		sm[1] = -20*side-20
	end
	if y_count==9 then
		sm[2] = -20*side-40
	end
	if x_count==8 then
		sm[1] = 0
	end
	if y_count==8 then
		sm[2] = 0
	end
	if x_count==3 then
		sm[1] = 105*side
	end
	if y_count==3 then
		sm[2] = 105*side-40
	end
	if x_count==1 then
		sm[1] = 150*side
	end
	if y_count==1 then
		sm[2] = 150*side-40
	end
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
				----print(math.floor(last_move[1]/10))
				----print(math.floor(stor/10))
				----print(cletka1[1])
				----print(cletka1[2])
				----print(dop_resp_p_m)
				if (last_m~=nil and cletka1[1] == last_m[1] and cletka1[2] == last_m[2]) then
					--print("ht")
					-----------------TTTTTTTTTTTTTTTTTTT
					
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
	-- if  then
		
			-- players_images[pl][4][4][#players_images[pl][4][4]+1] = tfm.exec.addImage(image_choose[1][2][1], "!1", image_choose[1][2][2]+column*44*side+200, image_choose[1][2][3]+row*44*side-22, pl, image_choose[1][2][4], image_choose[1][2][5], 0, 1)
			-- players_images[pl][4][5][#players_images[pl][4][5]+1] = {row, column}
			

		-- return
	-- end
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

function eventMouse(pl, xpl, ypl)
	--------print(xpl..":"..ypl)
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
	--------print(x_click..":"..y_click)
	
	
		if (players_images[pl][4][1] ==nil) then
			if  party_local[1][y_click]~=nil and party_local[1][y_click][x_click] ~= 0 and party_local[1][y_click][x_click]~=nil then
				
				if  (((party_local[3]~=nil and  party_local[3][1]~=nil and party_local[3][1][1]==pl and content_in_mass(math.floor(party_local[1][y_click][x_click]/10), party_local[3][1][2])==true)) or ((party_local[3]~=nil and  party_local[3][2]~=nil and party_local[3][2][1]==pl and content_in_mass(math.floor(party_local[1][y_click][x_click]/10), party_local[3][2][2])==true)))==false then
					--print("tytr")
					--print(math.floor(party_local[1][y_click][x_click]/10))
					--print(party_local[3][1][2][1])
					--print(party_local[3][1][1])
					--print((party_local[3]~=nil and  party_local[3][1]~=nil and party_local[3][1][1]==pl and content_in_mass(math.floor(party_local[1][y_click][x_click]/10), party_local[3][1][2])==true))
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
								----print("tuty")
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
						------print("+++++++++++++++++++++++++")
						if players_images[pl][4][1][2] - x_click < 0 then
							changeMove({{y_click, 8}, {y_click, 6}, players_images[pl][3][1]}, false)
							changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 8}, {y_click, 6}}}}, true)
						else
							------print(y_click)
							changeMove({{y_click, 1}, {y_click, 4}, players_images[pl][3][1]}, false)
							changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1], nil, {{{y_click, 1}, {y_click, 4}}}}, true)
						end
						break
					end
					changeMove({players_images[pl][4][1], {y_click, x_click}, players_images[pl][3][1]}, true)
				end
			end
			
			tfm.exec.removeImage(players_images[pl][4][3])
			--------print(players_images[pl][3][1])
			
			
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

function win(party_j, num_color, pl_k)
	--*/*/
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
		------print("wrong party:"..party_m)
		return
	end
	
	--------------------WRONG Square------------
	if party[party_m][1][second[1]] == nil then
		------print("wrong raw:"..second[1])
		return
	end
	if (party[party_m][1][second[1]][second[2]]==nil) then
		------print("wrong column:"..second[2]..", "..second[1])
		return
	end
		if party[party_m][1][first[1]] == nil then
		------print("wrong raw:"..first[1])
		return
	end
	if (party[party_m][1][first[1]][first[2]]==nil) then
		------print("wrong column:"..first[2]..", "..first[1])
		return
	end
	------------------------------------------------------
	
	
	if (party[party_m][1][first[1]][first[2]]==0) then
		------print("wrong 0")
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

	if name_chess[party[party_m][5]][2][2] then
		if bool_up then
			if item%10 >1 and item%10<6 then
				----print(item)
				if item%10 == 5 then
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+2
				else
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+item%10 +1
				end
					----print(party[party_m][1][second[1]][second[2]])
			end
		else
			if item%10 >1 and item%10<6 then
				----print(item)
				if item%10 == 2 then
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+5
				else
					party[party_m][1][second[1]][second[2]] = math.floor(item/10)*10+item%10 - 1
				end
					----print(party[party_m][1][second[1]][second[2]])
			end
		end
	end
	
	
	
	--party[party_m][3][2][first[1]*100+first[2]] = 0
	
	-- tfm.exec.removeImage(party[party_m][3][1][100*party[party_m][2][1][1]+party[party_m][2][1][2]])
	-- tfm.exec.removeImage(party[party_m][3][1][100*party[party_m][2][2][1]+party[party_m][2][2][2]])
	
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
	
	if doppravil[party[party_m][5]][6]==true and localsave~=nil and localsave[4]~=nil and ((localsave[4]%10)==1) then
		win(party_m, math.floor((party[party_m][1][second[1]][second[2]])/10))
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
		
		--------print(cletka1[1]..":"..cletka1[2].."->"..cletka2[1]..":"..cletka2[2].."("..party[setting_pl_party][1][cletka1[1]][cletka1[2]]..")")
	end
	if cmd == "test1" then
		local cletka1 = {math.random(1, 8), math.random(1, 10)}
		local cletka2 = {math.random(1, 8), math.random(1, 10)}
		changeMove({cletka1, cletka2, 1}, true)
		
		--------print(cletka1[1]..":"..cletka1[2].."->"..cletka2[1]..":"..cletka2[2].."("..party[2][1][cletka1[1]][cletka1[2]]..")")
		
	end
	if cmd == "test3" then
	
		changeMove({{1,1}, {3,4}, 1}, true)
	end
	if cmd == "help" then
	
		showDiscription(party[setting_pl_party][5], pl)
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
		
		----print(piece_s)
		
		if piece_s == piece_ts.queen or piece_s == piece_ts.rook or piece_s == piece_ts.bishop or piece_s == piece_ts.knight then
			local xy_s = cmd:sub(11, -1)
			local xy_mass = string.split(xy_s, "k")
			----print("----------------")
			----print(xy_mass[1])
			----print(xy_mass[2])
			----print(players_images[pl][4][1][1])
			----print(players_images[pl][4][1][2])
			----print(players_images[pl][3][1])
			----print("----------------")

			local party_local = party[players_images[pl][3][1]]
			----print(party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]])
			
			if players_images[pl][4][1]==nil then
				return
			end
			
			local fig_ht = party_local[1][players_images[pl][4][1][1]][players_images[pl][4][1][2]]
			local new_piece = math.floor(fig_ht/10)*10+piece_s
			----print(new_piece)
			changeMove({players_images[pl][4][1], {xy_mass[1]+0, xy_mass[2]+0}, players_images[pl][3][1], {fig_ht, new_piece}}, true)
			
			
			
			tfm.exec.removeImage(players_images[pl][4][3])
			--------print(players_images[pl][3][1])
			
			
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
		ui.removeTextArea(-1004, pl)
		ui.removeTextArea(-670, pl)
		local party_s = cmd:sub(6, -1)
		------print(party_s)
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
		--print(apponent_so)
		--print(pl)
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
				----print("uiu")
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
				--spawn_piece(change_p_m_o[1], cletka2[1], cletka2[2], setting_pl_party)
				for j=1, #dop_p_m_o do
					local dop_p_m_o_hod = dop_p_m_o[j]
					-- --print(dop_p_m_o_hod[1][1]..":"..dop_p_m_o_hod[1][2])
					-- --print(dop_p_m_o_hod[2][1]..":"..dop_p_m_o_hod[2][2])
					changeMove({dop_p_m_o_hod[2], dop_p_m_o_hod[1], setting_pl_party}, false, true)
				end
			end
			if dop_resp_p_m~=nil then
				spawn_piece(dop_resp_p_m[1], dop_resp_p_m[2], dop_resp_p_m[3], setting_pl_party)
			end
			
			--print(math.floor(last_move[1]/10))
			--print(party[setting_pl_party][6][1])
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
	
	local masser =  get_mass_colors(party[num_new_party][1])
	
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
	
	party[num_new_party][6] = {1, masser}	--кто ходит
	if masser[2]~=nil then
		party[num_new_party][6] = {2, masser}	--кто ходит
	end
	--print(party[num_new_party][6])
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
		local mat_text = name_button[lang][11-1+num_sh].."<br><br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>"
		ui.addTextArea(-781, mat_text, p_o, 100, 150, 100, nil, 1, 0x0000ff, 0.9,true)
	end

 end
  
function show_win(p, p_n)
	local p_mass = party[p_n][3]
	for k=1, #p_mass do
		local p_o = p_mass[k][1]
		if players_images[p_o]~=nil and players_images[p_o][3]~=nil and players_images[p_o][3][1]==p_n then
			local win_text = p.."- win!!!<br><br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>"
			ui.addTextArea(-780, win_text, p_o, 200, 150, 400, nil, 1, 0x0000ff, 0.9,true)
		end
	end
end

function show_dialog_apponent(party_so, pl, app)
	local dialog_text = pl.." "..name_button[lang][9].." - " .. name_chess[party_so+0][1] .. "<br><br><p align='center'><a href='event:accept"..pl.."&"..party_so.."'>"..name_button[lang][8].."</a>    <p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>"
	ui.addTextArea(-780, dialog_text, app, 200, 150, 400, nil, 1, 0x0000ff, 0.9,true)
end

function show_choose_pl_list(pl, party_so)
	local ch_list = "<p align='center'>"..name_button[lang][10].."<br><p align='left'>"
	for nick in pairs(tfm.get.room.playerList) do
		if nick~=pl or test_mod then
			ch_list = ch_list.."<a href='event:choose"..nick.."&"..party_so.."'>"..nick.."</a><br>"
		end
	end
	ch_list = ch_list .. "<br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>"
	ui.addTextArea(-750, ch_list, pl, 200, 50, 400, nil, 1, 0x0000ff, 0.9,true)
end

function get_coord(cletka1, cletka2, party_u)
	local ht = ""
	local my = name_chess[party_u][5]
	ht = ht ..mass_ob[cletka1[2]]..(my-cletka1[1]+1).."-"..mass_ob[cletka2[2]]..(my-cletka2[1]+1)
	return ht
end

function test_hod()
	for nick in pairs(tfm.get.room.playerList) do
		----print(players_images[nick][3][1]..nick)
		
		local massplk = party[players_images[nick][3][1]][4]
		local jk = party[players_images[nick][3][1]][5]
		local info_partys_pl = ""
		local start_ma = #massplk - 30
		if start_ma < 1 then
			start_ma = 1
		end
		for k = start_ma, #massplk do
			info_partys_pl = info_partys_pl.."<font color='#"..color_piece_mass[math.floor(massplk[k][1]/10)].."'>"..symbol_piece_mass[massplk[k][1]%10].."</font>"..get_coord( massplk[k][2], massplk[k][3], jk)..""..((massplk[k][4]~=0 or massplk[k][7]~=nil) and "x" or "").." "..""
		end
		
		ui.addTextArea(-1002, ""..info_partys_pl, nick, 600, 100, 180, nil, 0x333377, 0x999999, 0.9,true)
		local myhod = party[players_images[nick][3][1]][6]
		if myhod~=nil and myhod[2][myhod[1]]~=nil then
			local masspl = party[players_images[nick][3][1]][3]
			
			for k = 1, #masspl do
				if (masspl[k][1]==nick and masspl[k][2][1]==myhod[2][myhod[1]] and doppravil[jk][3]) or test_mod  then
					ui.addTextArea(-1003, name_button[lang][2], nick, 600, 70, 90, nil, 0x770000, 0x999999, 0.9,true)
					if doppravil[jk][5] then
						ui.addTextArea(-1004, "<p align='center'><a href='event:go'>"..name_button[lang][3].."</a>", nick, 700, 70, 30, nil, 0x770000, 0x999999, 0.9,true)
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
		ui.addTextArea(-1000, ""..players_images[nick][3][1], nick, 205, 380, nil, nil, 1, 0x999999, 0.7,true)
		
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







ui.addTextArea(-67, "<a href='event:open_game_s'>"..name_button[lang][4].."</a>", nil, 120, 380, 75, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-68, "<a href='event:new_game_s'>"..name_button[lang][5].."</a>", nil, 10, 380, 100, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-69, "<a href='event:return_move'>"..name_button[lang][6].."</a>", adm, 600, 325, 130, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-71, "<a href='event:return_board'>"..name_button[lang][7].."</a>", nil, 600, 355, 130, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-73, "<a href='event:shah_sh'>"..name_button[lang][11].."</a>", nil, 600, 295, 30, nil, 1, 0x999999, 0.7,true)
ui.addTextArea(-72, "<a href='event:mat_sh'>"..name_button[lang][12].."</a>", nil, 640, 295, 30, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-74, "<a href='event:go_sh'>"..name_button[lang][13].."</a>", nil, 680, 295, 70, nil, 1, 0x999999, 0.7,true)

ui.addTextArea(-75, "<a href='event:flag_sh'>"..name_button[lang][14].."</a>", nil, 600, 265, 130, nil, 1, 0x999999, 0.7,true)

end

function show_new_game(pl)
	local nd = "<p align='left'><font size='13'>"
	for i, j in pairs(name_chess) do
		nd = nd .. "<a href='event:new_party"..i.."'>"..i.." "..name_chess[i][1].."</a><br>"
	end
	nd = nd .. "<br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>"
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
		ui.addTextArea(-670, ""..info_partys.."<br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>", pl, 10, 60, 400, 300, 1, 0x999999, 0.9,true)
	else
		ui.addTextArea(-670, ""..info_partys.."<br><p align='center'><a href='event:cancel'>"..name_button[lang][1].."</a>", pl, 10, 60, 400, nil, 1, 0x999999, 0.9,true)
	end
end

-- Init
for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
	tfm.exec["disable" .. v]()
end

for nick in pairs(tfm.get.room.playerList) do
    system.bindMouse(nick, true)
end

init()
tfm.exec.newGame(7852876)
--table.foreach(tfm.get.room.playerList, eventNewPlayer)


