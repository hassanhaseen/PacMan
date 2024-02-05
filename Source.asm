INCLUDE Irvine32.inc
includelib Winmm.lib
INCLUDE macros.inc

.386
;.model flat,stdcall
.stack 4096
BUFFER_SIZE = 1000
BUFFER_SIZE2 = 5000
.data

	nextline DB 0ah,0dh , 0

GameMenu BYTE "                                                                                                                        ",0ah
		     BYTE "                                                                                                                        ",0ah
			 BYTE "                                                                                                                        ",0ah
             BYTE "                        _______     _        ______  ____    ____       _       ____  _____                             ",0ah
             BYTE "                       |_   __ \   / \     .' ___  ||_   \  /   _|     / \     |_   \|_   _|                            ",0ah
             BYTE "                         | |__) | / _ \   / .'   \_|  |   \/   |      / _ \      |   \ | |                              ",0ah
             BYTE "                         |  ___/ / ___ \  | |         | |\  /| |     / ___ \     | |\ \| |                              ",0ah
             BYTE "                        _| |_  _/ /   \ \_\ `.___.'\ _| |_\/_| |_  _/ /   \ \_  _| |_\   |_                             ",0ah
             BYTE "                       |_____||____| |____|`.____ .'|_____||_____||____| |____||_____|\____|                            ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             1. START GAME                                                              ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             2. SHOW INSTRUCTIONS                                                       ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             3. SHOW HIGH SCORE                                                         ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             4. EXIT GAME                                                               ",0ah
             BYTE "                                                                                                                        ",0

Pausemenu BYTE "                                                                                                                        ",0ah
             BYTE "                        _______     _        ______  ____    ____       _       ____  _____                             ",0ah
             BYTE "                       |_   __ \   / \     .' ___  ||_   \  /   _|     / \     |_   \|_   _|                            ",0ah
             BYTE "                         | |__) | / _ \   / .'   \_|  |   \/   |      / _ \      |   \ | |                              ",0ah
             BYTE "                         |  ___/ / ___ \  | |         | |\  /| |     / ___ \     | |\ \| |                              ",0ah
             BYTE "                        _| |_  _/ /   \ \_\ `.___.'\ _| |_\/_| |_  _/ /   \ \_  _| |_\   |_                             ",0ah
             BYTE "                       |_____||____| |____|`.____ .'|_____||_____||____| |____||_____|\____|                            ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             1. CONTINUE                                                                ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             2. SHOW INSTRUCTIONS                                                       ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                             3. EXIT GAME                                                               ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0ah
             BYTE "                                                                                                                        ",0

INSTRUCTIONS     BYTE "                                                                                                                    ",0ah
                 BYTE "                         ___ _   _ ____ _____ ____  _   _  ____ _____ ___ ___  _   _ ____                           ",0ah
                 BYTE "                        |_ _| \ | / ___|_   _|  _ \| | | |/ ___|_   _|_ _/ _ \| \ | / ___|						   ",0ah
                 BYTE "                         | ||  \| \___ \ | | | |_) | | | | |     | |  | | | | |  \| \___ \			       		   ",0ah
                 BYTE "                         | || |\  |___) || | |  _ <| |_| | |___  | |  | | |_| | |\  |___) |			       		   ",0ah
                 BYTE "                        |___|_| \_|____/ |_| |_| \_\\___/ \____| |_| |___\___/|_| \_|____/			      		   ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "           Movement : Move LEFT [A]                                      Move RIGHT [D]                             ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "                      Move UP   [W]                                      Move DOWN  [S]                             ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "           Collect All Dots to Advance to next Level . With Increase in every Level Diffculty Increases             ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "  LEVEL1  : Most Easy Level with Simple Ghost that just move around Randomly and do not Follow Player               ",0ah
                 BYTE "                                                                                                                    ",0ah
                 BYTE "  LEVEL2  : Ghost Become Fast and Follow Player if Player come in there Line of Sight . Fruit[o] will Spawn         ",0ah
                 BYTE "            Randomly. Collect them to get more Points                                                               ",0ah
				 BYTE "                                                                                                                    ",0ah
                 BYTE "  LEVEL3  : ALmost Same as Level 2 but new type of Ghost are Introduced which will follow player even more          ",0ah
                 BYTE "            Faster and Teleport after some time to a Position near to Player                                        ",0ah
				 BYTE "                                                                                                                    ",0ah
                 BYTE "                                                                                                                    ",0

HIGHSCORE    BYTE "                                                                                                                     ",0ah
             BYTE "                                                                                                                     ",0ah
             BYTE "              __    __   __    _______  __    __          _______.  ______   ______   .______       _______          ",0ah
             BYTE "             |  |  |  | |  |  /  _____||  |  |  |        /       | /      | /  __  \  |   _  \     |   ____|         ",0ah
             BYTE "             |  |__|  | |  | |  |  __  |  |__|  |       |   (----`|  ,----'|  |  |  | |  |_)  |    |  |__            ",0ah
             BYTE "             |   __   | |  | |  | |_ | |   __   |        \   \    |  |     |  |  |  | |      /     |   __|           ",0ah
             BYTE "             |  |  |  | |  | |  |__| | |  |  |  |    .----)   |   |  `----.|  `--'  | |  |\  \----.|  |____          ",0ah
             BYTE "             |__|  |__| |__|  \______| |__|  |__|    |_______/     \______| \______/  | _| `._____||_______|         ",0ah
             BYTE "                                                                                                                     ",0ah
             BYTE "                                                                                                                     ",0
	;---------------- LEVEL 1
   GameMaze1  BYTE" ---------------------------------------------------------------------------------------------------------------------",0ah
			 BYTE " |.   .   .   .   .   .  .  .   .   .   .   .   .  .   .   .   .   .   .   .   .   .   .   .  |||||||||||||||  .    .|",0ah
		     BYTE " |.|||.|||||||||||||||||||||.||||||||||||||||||||||||||||||.|||||||||||||||.|||.|||||||||.|||. . . . . . . . .|||||| |",0ah
			 BYTE " |.   .   .   .   .   .  .  .   .   .   .   .   .  .   .   .   .   .   .   .   .   .   .  |||.||||||||||||||||| .   .|",0ah
	         BYTE " ||||| |||.||||.||||||||||||||||.||||||||||||.||||||||| |||||||||.|||.||||||||| ||||||||| .   .   .   . .  .   .|||| |",0ah
			 BYTE " |    .||| |||| |||      |||.   .|||||||||||| ||||||       |||||| |||   .   .   .   .   . |||.|||||||||||||||||.     |",0ah
			 BYTE " ||||| |||.||||.|||      ||| |||  .     . |||. . |||       ||||||.|||.|||||||||||||||||||.|||. . . . . . . . . .||||||",0ah
			 BYTE " |.   .||| |||| |||      |||.|||.|||||||||||||||.|||||||||||||||| |||.||   .   .   .   .  . . ||||||| |||||||||.    .|",0ah
	         BYTE " | |||.|||.||||.|||      |||  .  |||   .   .  .  .   .   .   .   .   .  .||||||||||||||||.|||.   .   .   .   .  |||| |",0ah
		     BYTE " |.||| ||| |||| ||||||||||||||||.||||||||||||.|||||||.||||||||.|||.||||||||||||||||||||||.   .||||||||||||||||| ||||.|",0ah
			 BYTE " |.   .   .   .   .   .  .  .   .   .   .   . |||||||. . . . .X|||  .   .   .   .   .   . |||.|||||||||||||||||.|||| |",0ah
			 BYTE " ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| . . ||||||||||||||||||||||  .   .   .   .   .    .   .|",0ah
			 BYTE " --------------------------------------------------------------------------------------------------------------------- ",0
                                                                                                                                               
   GameMaze2 BYTE " ---------------------------------------------------------------------------------------------------------------------",0ah
             BYTE " |.   .|||.||||||||. . .||||||||||||||.   .   .   .   . ||||||||||||||  +  |||||||||||||. . .||||||||||    |||||||||||",0ah
             BYTE " | |||  .   .   .   |||.   .   .   .   |||||| |||||||||.||||||||| .   .|||.   .   .   .  |||.   .   .   ||  .   +|||||",0ah
             BYTE " |.|||.|||.|||||||||||| ||||||||||||||.  .   .   .   .   .   .   .||||||||||||||||||.||||||||||||.||||||||||||||.|||||",0ah
             BYTE " | ||| ||| |||      |||.   .||||||||||||||||| ||||||||| |||||||||.   .   .   .   .    .  ||||||||.||     .    .   . ||",0ah
             BYTE " |.|||.|||.|||      ||| |||.   .   + |||.   . |||||        |||||| ||||||||||||||||||||||. .  .   . . |||| |||||| |||||",0ah
             BYTE " | ||| ||| |||      |||.||| |||||||||||||||.|||||||        ||||||.||||||.   .   .   .   .||||||||.|||||||.   .   .||||",0ah
             BYTE " |.|||.|||.|||      |||  . .|||.   .   .   .   ||||||||||||||||||  .   . |||||||||||||||.   .   .   .   . || |||| ||||",0ah
             BYTE " | ||| ||| ||||||||||||.||||||||||||||.|||||||.||||||||||||||||||||| ||||||||||||||||||| ||||||||||||||||||| ||||.||||",0ah
             BYTE " |. + .|||.   .   .   .   .   .  . .   .   .  .||||.   .   .   |||||.   .   .   .   .   .||||. .   . |||.   .   .   .|",0ah
             BYTE " | |||  .  ||||||||||||||||.||||||.|||||||||||.   . ||||.|||||X .   .||| |||||||||||||||. . . |||.||||||.||||||||||| |",0ah
             BYTE " |.|||.|||.||||||.     .||| |||||| ||||||||||| ||||||||| ||||| ||||| |||.  .  .|||||||||.|||||||| ||||||.||||||||.  .|",0ah
             BYTE " |  .  |||.   .   |||||.   .||||||.   .   .   .|||||||||.  .  .|||||.|||||||| .   .   .   .  .   .   .   .   .   .||||",0ah
             BYTE " --------------------------------------------------------------------------------------------------------------------- ",0
                                                                                                                                                    
   GameMaze3 BYTE " ---------------------------------------------------------------------------------------------------------------------",0ah
			 BYTE " |.   .   .   .|||||||||||||||||||| . |||||||||||||||||. . + .|||||||||||||||||||||||||||||||||||||||||||||||  .    .|",0ah
			 BYTE " |.|||||||||||.   .   .   .|||.   .   .   .  |||||||||| |||||.   .   .   .   .   .  .  .  .   .   .   .   .  .|||||| |",0ah
			 BYTE " |.   . + .   .||| |||||||.|||.||.|| |||||||.   .   .   .   . ||||| |||||||||||||||||||| || |||||||| || |||||  .    .|",0ah
			 BYTE " |||||||.|||||.   .|||||||.||| || ||.  . .|| |||||||||| ||||||||||| ||||||||||||||||||||.|| |||||||| ||.|||||.||.|||||",0ah
			 BYTE " |.   .   .   .|||    .   .|||.||.|| |||| || |||||           ||||||.   .   .   .   .   . ||    +     || ||||| ||     |",0ah
			 BYTE " ||| |||||||||.|||.||||| |.   .   ||.||||.||.|||||||||||||||||||||| ||||||||||||||||||||.||||||||||||||.|||||.||.|||||",0ah
			 BYTE " ||| |||||||||.||| ||.||.|||||||.||| ||||.   .   .   .   .   .  . .   .   .   .   .   .  . .   .   .   .   .   .  .  |",0ah
			 BYTE " |.   .   .   .   .|| || |||||||.|||.|||| ||||| ||||| ||||||||||||| ||||||||||||||||||||||||||| ||| ||||.|||||||||||.|",0ah
			 BYTE " | |||||||||||||||.||.   .   .   ||| ||||.|| .   . ||.   .   .   .|.   .   .   .   ||.   .   .  ||| |||| |||   .   . |",0ah
			 BYTE " |.   .   .   . || || ||||||||||||||.||||  . |||||.|| ||||||||X||||.|||||||| |||||||| |||.||||||||| ||||.|||.|||||||.|",0ah
			 BYTE " | ||||||||||||.||.   .   .   .   .   .   || .   .   .||| .   .   .   .   .   .  .   .|||.   .   .   .   ||| ||||||| |",0ah
			 BYTE " |.||||||||||||  + ||||||||||. . ||||||||.||||||||||| |||||||||||||.|||||||||||||||||.||||||||||||||||||.   .   .   +|",0ah
			 BYTE " --------------------------------------------------------------------------------------------------------------------- ",0

	GameMaze BYTE 1700 DUP(?)

	
	ground BYTE "------------------------------------------------------------------------------------------------------------------------",0

	TotalPLayerLifes DWORD 3
	level WORD 1

	FruitSpawnTime DWORD 300

	GhostEatenTimer DWORD 0 , 0, 0 ,0 ,0 
	GhostEaten DWORD 0
	NoOfGhost DWORD 3
	GhostMovementKey DWORD 0 , 0 , 0 , 0 , 0
	GhostsIndexInGameMaze DWORD 650 ,650 ,650 ,650 , 769
	GhostIndexPreviousData BYTE " " , " " ," "  , " " , " "
	GhostMovementTimer DWORD 0 , 0 , 0 , 0 , 0
	DefaultGhostPosition DWORD 650
	GhostChar db "G"

	AdvancedGhostMovementTimer DWORD 0 , 0
	AdvancedGhostPosition DWORD 121 , 235
	AdvancedGhostMovementKey   DWORD 0 , 0
	AdvancedGhostPreviousData BYTE " ", " "
	AdvancedChar BYTE "#"
	AdvancedTelportTime DWORD 300 , 500

	strScore BYTE "SCORE : ",0
	score DWORD 0

	PlayerIndexInGameMaze DWORD 1252
	DefaultPlayerIndexInGameMaze DWORD 1252

	MaxMazeIndexSize DWORD 1546
	TotalNumberOfDotinMap DWORD 313

	GameMazeLength DWORD 1546 , 1666  , 1666
	TotalNumberOfDots DWORD 313 , 298  , 321

	player BYTE "X" , 0
	PowerUp BYTE 0
	PowerUpTimer DWORD 0

	EndGame BYTE 0


	PromptLostLive db "You Lost A live" , 0
	PromptEnterKey db "Press ENTER to Continue" , 0
	PromptPoweUp db "PowerUp" , 0
	PromptHeading BYTE "PAC-MAN" , 0
	PromptStartGame BYTE "1 . START GAME" , 0
	PromptDies BYTE "!YOU DIED!" , 0
	PromptGameEnd BYTE "Game END" , 0
	PromptEnterName BYTE "Enter You Name" , 0
	PromptLevelFinished BYTE "!LEVEL COMPLETED!" , 0
	PromptGameWon BYTE "CONGRATULATION! YOU WON" , 0
	

	Continue DB 255 DUP(0)
	continueChar BYTE ?
	inputChar BYTE ?
	Timer DWORD 0
	SpacetohideContent db "                                                                                                                       " , 0

	PlayerName BYTE 255 DUP(0)

	File BYTE "score.txt" , 0
	buffer BYTE BUFFER_SIZE DUP(?)

	fileHandle  HANDLE ?

	lengthofData DWORD 0

	buffer2 BYTE BUFFER_SIZE2 DUP(?)
	buffer2size DWORD 0

	AlreadyExistPlayer BYTE 0
	AlreadyExistPlayerIndex DWORD  0

	StartChecking BYTE 1
	Swap BYTE 0

	mainindex1 DWORD 0
	mainindex2 DWORD 0

	index1 DWORD 0
	index2 DWORD 0
	Score1 DWORD 0
	Score2 DWORD 0

	StartSound db 'E:\Programming\COAL\Projects\Irvine_Template\sounds\pacman_beginning.wav' , 0
	deathSound db 'E:\Programming\COAL\Projects\Irvine_Template\sounds\pacman_death.wav' , 0
	FruitSound db 'E:\Programming\COAL\Projects\Irvine_Template\sounds\pacman_eatfruit.wav' , 0
	wakawakaSound db 'E:\Programming\COAL\Projects\Irvine_Template\sounds\pac-man-waka-waka.wav' , 0

	PlaySound   PROTO,
	pszSound:PTR BYTE,
	hmod:DWORD,
	fdwSound:DWORD

	SND_LOOP    equ 8 ; Define the loop flag value
.code

ResetAllVariable PROC
	mov TotalPLayerLifes ,3
	mov level , 1

	mov FruitSpawnTime , 300

	mov GhostEatenTimer[0] , 0 
	mov GhostEatenTimer[4] , 0 
	mov GhostEatenTimer[8] , 0 
	mov GhostEatenTimer[12] , 0 
	mov GhostEatenTimer[16] , 0 

	mov GhostEaten , 0
	mov NoOfGhost , 3

	mov GhostMovementKey[0] , 0
	mov GhostMovementKey[4] , 0
	mov GhostMovementKey[8] , 0
	mov GhostMovementKey[12] , 0
	mov GhostMovementKey[16] , 0

	mov GhostsIndexInGameMaze[0] , 650 
	mov GhostsIndexInGameMaze[4] , 650 
	mov GhostsIndexInGameMaze[8] , 650 
	mov GhostsIndexInGameMaze[12] , 650 
	mov GhostsIndexInGameMaze[16] , 650 

	mov GhostIndexPreviousData[0] , " "
	mov GhostIndexPreviousData[1] , " "
	mov GhostIndexPreviousData[2] , " "
	mov GhostIndexPreviousData[3] , " "
	mov GhostIndexPreviousData[4] , " "

	mov GhostMovementTimer[0] ,  0 
	mov GhostMovementTimer[4] ,  0 
	mov GhostMovementTimer[8] ,  0 
	mov GhostMovementTimer[12] ,  0 
	mov GhostMovementTimer[16] ,  0 


	mov DefaultGhostPosition , 650
	mov GhostChar , "G"

	mov AdvancedGhostMovementTimer[0] , 0
	mov AdvancedGhostMovementTimer[4] , 0

	mov AdvancedGhostPosition[0] , 121 
	mov AdvancedGhostPosition[4] , 235

	mov AdvancedGhostMovementKey[0]  , 0
	mov AdvancedGhostMovementKey[4]  , 0


	mov AdvancedGhostPreviousData[0] ," "
	mov AdvancedGhostPreviousData[1] ," "

	mov AdvancedChar , "#"

	mov AdvancedTelportTime[0] , 300
	mov AdvancedTelportTime[4] , 500

	mov score , 0

	mov PlayerIndexInGameMaze , 1252
	mov DefaultPlayerIndexInGameMaze ,1252

	mov MaxMazeIndexSize , 1546
	mov TotalNumberOfDotinMap , 313


	mov PowerUp , 0
	mov PowerUpTimer , 0

	mov Timer , 0

	mov EndGame , 0
	ret
ResetAllVariable ENDP

main PROC
	
	mov eax,White +(Black*16)
	call SetTextColor
	call clrscr


	MainMenu:
		INVOKE PlaySound, OFFSET StartSound, NULL , 11h
		mov dl,0   ;Col
		mov dh,1
		call gotoxy
		mov eax , lightMagenta + (black * 16)
		call setTextColor

		mov edx , offset GameMenu
		call WriteString
		mov eax , 0
		call readchar
		
		cmp al , 50
		jne no_ins_Called
		call show_instruction
		mov eax , 0
		no_ins_Called:
		cmp al , 49
		je start_Game
		cmp al , 51
		jne no_score_called
			call ShowHighScore
		no_score_called:
	jmp exitGame2 
	start_Game:
	call clrscr

	
	mov dl , 50
	mov dh , 13
	call gotoxy
	mov edx , offset PromptEnterName
	call writeString

	mov eax , white + (black * 16)
	call SetTextColor

	mov dl , 54
	mov dh , 15
	call gotoxy
	mov edx , offset PlayerName
	mov ecx , 255
	call readString

	;setting up initial Maze for level 1
	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count:
		mov al , GameMaze1[esi]
		mov GameMaze[esi] , al
		inc esi
		cmp GameMaze1[esi] , 0
		jne count
	mov al , 0
	mov GameMaze[esi] , al

	gameLoop:
		
		inc Timer
		;--------------- LEVEL Management
		mov ax , level
		cmp ax , 1
			jne Check_Level2
			PUSH offset GhostIndexPreviousData
			PUSH offset GhostsIndexInGameMaze
			PUSH offset PlayerIndexInGameMaze
			PUSH offset TotalPLayerLifes
			PUSH offset GhostChar
			PUSH offset TotalNumberOfDots
			PUSH offset GameMazeLength
			PUSH offset NoOfGhost 
			PUSH offset level
			PUSH offset TotalNumberOfDotinMap
			PUSH offset score
			call Level1
		Check_Level2:
		cmp ax , 2
			jne Check_Level3
			PUSH offset GhostIndexPreviousData
			PUSH offset GhostsIndexInGameMaze
			PUSH offset PlayerIndexInGameMaze
			PUSH offset TotalPLayerLifes
			PUSH offset FruitSpawnTime 
			PUSH offset TotalNumberOfDots
			PUSH offset GameMazeLength
			PUSH offset NoOfGhost 
			PUSH offset level
			PUSH offset TotalNumberOfDotinMap
			PUSH offset score
			call Level2
		Check_Level3:
		cmp ax , 3
			jne Check_end_Game
			PUSH offset AdvancedGhostMovementTimer
			PUSH offset AdvancedTelportTime
			PUSH offset AdvancedChar
			PUSH offset GhostChar
			PUSH offset PlayerIndexInGameMaze
			PUSH offset AdvancedGhostPosition
			PUSh offset AdvancedGhostPreviousData
			PUSH offset GameMaze
			call AdvancedGhostMovement

			PUSH offset AdvancedGhostPreviousData
			PUSH offset AdvancedGhostPosition
			PUSH offset TotalPLayerLifes
			PUSH offset NoOfGhost
			PUSH offset GameMaze
			PUSH offset GhostMovementKey
			PUSH offset GhostsIndexInGameMaze
			PUSH offset GhostIndexPreviousData
			PUSH offset PlayerIndexInGameMaze
			call AdvancedGhostPlayerCollision

			PUSH offset EndGame
			PUSH offset GameMaze
			call Level3
		Check_end_Game:
			
		call DrawMaze
	
		;-------------- draw score:
			mov eax,lightCyan+(black * 16)
			call SetTextColor

			mov dl,53
			mov dh,3
			call Gotoxy

			mov edx,OFFSET strScore
			call WriteString

			mov eax,score
			call WriteInt

		;--------------cheking if player dies

		cmp EndGame , 1
		jne no_game_end
			jmp show_game_end

		no_game_end:

		cmp TotalPLayerLifes , 0
		jne not_dead
			mov dl , 51
			mov dh , 13
			call gotoXY
			mov eax , white + (black * 16)
			mov edx , offset PromptDies
			call writeString
			show_game_end:
			mov dl , 52
			mov dh , 14
			call gotoXY
			mov edx , offset PromptGameEnd
			call writeString

			mov dl , 44
			mov dh , 15
			call gotoXY
			mov edx , offset PromptEnterKey
			call writeString

			PUSH offset level
			PUSH offset PlayerName
			PUSH offset score
			call SavePlayerData

			mov eax , 0
			continue_loop:
				mov eax , 0
				call readchar

				cmp al , 13
				jne continue_loop

			call ResetAllVariable
		jmp exitGame
		not_dead:

		;--------------- Draw Lives
			mov eax , white + (Black * 16)
			call setTextColor
			mov ecx , 2

			mov ebx , TotalPLayerLifes
			mov al , 3
			DrawLives:
				mov dl, al
				mov dh, 22
				call Gotoxy
				mov edx , offset player
				call WriteString
				add al , 3
				dec ebx
				cmp ebx , 0
				jne DrawLives
		mov dl, 3
		mov dh, 29
		call Gotoxy

		;---------------Fruit Spawn
			 mov eax , 1
			 cmp level , 1
			 je no_fruit_spawn
			 	PUSH offset MaxMazeIndexSize
			 	PUSH offset FruitSpawnTime
			 	PUSH offset GameMaze
			 	call FruitSpawnRandom
			 no_fruit_spawn:

		;---------------Working with eaten Ghost Due to Power Up
			cmp GhostEaten , 0
			je no_eaten_ghost
				PUSH offset NoOfGhost
				PUSH offset GhostEatenTimer
				PUSH offset GhostEaten
				call SpawningEatenGhost
			no_eaten_ghost:

		;---------------Power Up Working
			mov al , 1
			cmp PowerUp , 1
			jne no_Power_up
				PUSH NoOfGhost
				PUSH offset PowerUp
				PUSH offset PowerUpTimer
				call PowerUpWorking

			no_Power_up:
		
		;---------------Ghost Working And Movement / Collision
			PUSH offset GhostMovementTimer
			PUSH offset AdvancedChar
			PUSH offset PowerUp
			PUSH offset GhostChar
			PUSH offset GhostsIndexInGameMaze
			PUSh offset GhostIndexPreviousData
			PUSH offset NoOfGhost
			PUSH offset GameMaze
			call GhostMovement

			mov eax , 1
			cmp PowerUp , al
			je power_up_on
			
			PUSH offset TotalPLayerLifes
			PUSH offset NoOfGhost
			PUSH offset GameMaze
			PUSH offset GhostMovementKey
			PUSH offset GhostsIndexInGameMaze
			PUSH offset GhostIndexPreviousData
			PUSH offset PlayerIndexInGameMaze
			call CheckPlayerGhostCollision
			jmp power_up_off
			power_up_on:

			PUSH offset score
			PUSH offset GhostEatenTimer
			PUSH offset GhostEaten
			PUSH offset NoOfGhost
			PUSH offset GameMaze
			PUSH offset GhostMovementKey
			PUSH offset GhostsIndexInGameMaze
			PUSH offset GhostIndexPreviousData
			PUSH offset PlayerIndexInGameMaze
			call CheckPLayerEatGhost
			
			power_up_off:
		
		;-------------- get user key input
		call ReadKey
		mov inputChar,al

		;-------------- exit game if user types 'x'
		cmp inputChar , "p"
		jne no_pause
			call PauseGame
			cmp al , 51
			je exitGame
		no_pause:

		cmp inputChar,"x"  
		je exitGame
		 
		;--------------Check for Player Movement Key Pressed(W A S D)
		cmp inputChar,"w"  
			je moveUp

		cmp inputChar,"s"
			je moveDown

		cmp inputChar,"a"
			je moveLeft

		cmp inputChar,"d"
			je moveRight
		
		jmp afterMoveMent

		moveUp:
			PUSH offset PowerUpTimer
			PUSH offset PowerUp
			PUSH PlayerIndexInGameMaze
			PUSH offset GameMaze
			PUSH offset score
			call MovePlayerUp
			jmp afterMoveMent	

		moveDown:
			PUSH offset PowerUpTimer
			PUSH offset PowerUp
			PUSH PlayerIndexInGameMaze
			PUSH offset GameMaze
			PUSH offset score
			call MovePlayerDown
			jmp afterMoveMent

		moveLeft:
			PUSH offset PowerUpTimer
			PUSH offset PowerUp
			PUSH PlayerIndexInGameMaze
			PUSH offset GameMaze
			PUSH offset score
			call MovePlayerLeft
			jmp afterMoveMent

		moveRight:
			PUSH offset PowerUpTimer
			PUSH offset PowerUp
			PUSH PlayerIndexInGameMaze
			PUSH offset GameMaze
			PUSH offset score
			call MovePlayerRight
			jmp afterMoveMent
	
	;-------------------- Default Game Flow After checking Movement Key
	afterMoveMent:
	mov eax,40
	call Delay
		
	jmp gameLoop

	exitGame:
	call clrscr
	exitGame2:
	cmp al , 52
	jne MainMenu

	exit
main ENDP

SortBuffer PROC
		
		;First Move to second Player start them compare
		sort_untill_no_swap:
			mov swap , 0
			mov StartChecking , 0
			mov esi , 0
			mov edi , 0
			move_to_scnd_player_name:
				inc edi
			cmp buffer2[edi] , 0ah
			jne move_to_scnd_player_name
			inc edi
			keep_swaping:
				mov mainindex1 , esi
				mov mainindex2, edi
				mov eax , esi
				mov ebx , edi
				find_score1:           ;going to index where player Score end on File Buffer of index esi
					inc eax
				cmp buffer2[eax] , 0dh
				jne find_score1
				dec eax
				mov index1 , eax     
				
				find_score2:           ;going to index where player Score end on File Buffer  index edi
					inc ebx
				cmp buffer2[ebx] , 0dh
				jne check_null
					jmp out_loop
				check_null:
				cmp buffer2[ebx] , 0
				jne find_score2

				out_loop:
				dec ebx
				mov index2 , ebx

				mov esi , index1
				mov ebx , 0
				mov bx , 1
				mov ecx , 0
				mov eax , 0
				get_score:         ;getting Player Score and converting from String to intergers
					mov al , Buffer2[esi]
					sub al , 48
					cmp al , 0
					mul bx
					add ecx, eax

					mov eax , ebx
					mov bx , 10
					mul bx 
					mov ebx , eax

					dec esi
				cmp Buffer2[esi] , 32
				jne get_score
				mov Score1 , ecx

				mov esi , index2
				mov ebx , 0
				mov bx , 1
				mov ecx , 0
				mov eax , 0
				get_score1:         ;getting Player Score and converting from String to intergers
					mov al , Buffer2[esi]
					sub al , 48
					mul bx
					add ecx, eax

					mov eax , ebx
					mov bx , 10
					mul bx 
					mov ebx , eax

					dec esi
				cmp Buffer2[esi] , 32
				jne get_score1
				mov Score2 , ecx

				cmp Score1 , ecx
				ja no_swap
					mov swap , 1
					mov esi , mainindex1       ;Move First Player data to temp
					mov edi , 0
					move_buffer_to_temp:
						mov al , buffer2[esi]
						mov buffer[edi] , al
						inc esi
						inc edi

					cmp buffer2[esi-1] , 0Ah
					jne move_buffer_to_temp
					mov buffer[edi] , 0

					mov esi , mainindex1        ;Swap Second Player with First Player
					mov edi , mainindex2
					swapData:
						mov al , buffer2[edi]     ;Take Second Player Data
						mov buffer2[esi] , al     ;Move to First Player
						inc edi
						inc esi

						cmp buffer2[edi] , 0
						jne keep_loop
							mov StartChecking , 1
							jmp out_loop1
						keep_loop:
						cmp buffer2[edi-1] , 0ah
						jne swapData

					out_loop1:
					cmp StartChecking , 1
					jne no_end
						mov al , 0dh
						mov buffer2[esi] ,al
						inc esi
						mov al , 0ah
						mov buffer2[esi] ,al
						inc esi

					no_end:
					mov edx , esi
					mov edi , 0
					move_temp_to_buffer:
						mov al , buffer[edi]
						mov buffer2[esi] , al

						inc esi
						inc edi

						cmp buffer[edi] , 0
						jne move_temp_to_buffer
			
					cmp StartChecking , 1
					jne no_end1
						dec esi 
						mov al , 0
						mov buffer2[esi] , al
						dec esi
						mov buffer2[esi] , al

					no_end1:
					mov esi , edx
					jmp out_condition3
				no_swap:
				mov esi , index1
				add esi , 3

				out_condition3:
				mov edi , index2
				cmp buffer2[edi+1] , 0
				je out_condition
				add edi , 3
				cmp buffer2[edi] , 0
				jne keep_swaping
			out_condition:
			cmp swap ,1
			je sort_untill_no_swap

		ret
SortBuffer ENDP

SavePlayerData PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 16] ==  level
	;[ebp + 12] ==  PlayerName
	;[ebp + 8] ==  score

	

	mov ecx , [ebp + 12]
	mov ebx , 0
	mov bh , 0
	mov esi , 0
	copy_untill_end:
		mov bl , [ecx + esi]
		mov buffer[esi] , bl
		inc esi
		cmp [ecx + esi] , bh
		jne copy_untill_end

	mov edi , esi
	add edi , 4
	mov bh , " "
	copy_space:
		mov buffer[esi] , bh
		inc esi
		cmp esi , edi
		jne copy_space

	;COMMENT @
	mov ecx , [ebp + 16]
	mov bx , [ecx]
	add bl , 48
	mov buffer[esi] , bl

	inc esi

	mov edi , esi
	add edi , 4
	mov bh , " "
	copy_space1:
		mov buffer[esi] , bh
		inc esi
		cmp esi , edi
		jne copy_space1
	
	;Convert Score into String
	mov edx , offset buffer
	mov ecx , [ebp + 8]
	mov eax , [ecx]
	cmp eax , 10
	jnb not_below_10
		add eax , 48
		mov buffer[esi] , al
		inc esi
		jmp out_condition
	not_below_10:
	cmp eax , 100
	jnb no_below_100
		mov bl , 10
		div bl
		add al , 48
		mov buffer[esi] , al
		inc esi
		add ah , 48
		mov buffer[esi] , ah
		inc esi
		jmp out_condition
	no_below_100:
	cmp eax , 1000
	jnb no_below_1000
		add esi , 2
		mov bl , 10
		div bl
		add ah , 48
		mov buffer[esi] , ah
		dec esi
		movzx eax , al
		div bl
		add ah , 48
		mov buffer[esi] , ah
		dec esi

		add al , 48
		mov buffer[esi] ,  al

		add esi , 3

		jmp out_condition
	no_below_1000:
		add esi , 3
		mov bl , 10
		div bl
		add ah , 48
		mov buffer[esi] , ah
		dec esi

		movzx eax , al
		div bl
		add ah , 48
		mov buffer[esi] , ah
		dec esi

		movzx eax , al
		div bl
		add ah , 48
		mov buffer[esi] , ah
		dec esi

		add al , 48
		mov buffer[esi] ,  al

		add esi , 4
		jmp out_condition
	out_condition:
	mov buffer[esi] , 0
	mov lengthofData , esi

	mov edx , offset File
	call OpenInputFile
	mov fileHandle , eax 
	
	mov edx , offset buffer2
	mov ecx , BUFFER_SIZE2
	call ReadFromFile
	mov buffer2[eax] , 0
	mov buffer2size , eax

	mov eax , FileHandle
	call CloseFile

	;Checking if Player Aleady Exist
	mov esi , 0
	mov edi , 0
	mov eax , esi
	keep_comparing:
		cmp startChecking , 1
		jne dont_check
			mov dl , PlayerName[edi]
			cmp buffer2[esi] , dl
			je char_are_equal
				mov startChecking , 0
				mov edi , 0
				jmp dont_check
			char_are_equal:
			inc edi
			cmp PlayerName[edi] , 0
			jne no_player_name_end
				mov AlreadyExistPlayer , 1
				jmp player_found
			no_player_name_end:
		dont_check:

		cmp buffer2[esi] , 0ah        ;if next line start checking again if player name are equal
		jne no_checking_again
			mov startChecking , 1
			mov edi , 0
			mov eax , esi             ;saving the start index if new player name Comes
			inc eax
		no_checking_again:

		inc esi

	cmp buffer2[esi] , 0
	jne keep_comparing

	player_found:
	mov AlreadyExistPlayerIndex , eax
	

	cmp AlreadyExistPlayer , 1
	jne player_no_already_exit
		mov dl , " "
		mov esi , eax
		find_score:           ;going to index where player Score end on File Buffer
			inc esi
			cmp buffer2[esi] , 0dh
			jne check_null
				jmp out_loop
			check_null:
			cmp buffer2[esi] , 0
			jne find_score
		out_loop:
		mov ebx , 0
		mov bx , 1
		mov ecx , 0
		mov eax , 0
		dec esi
		get_score:         ;getting Player Score and converting from String to intergers
			mov al , Buffer2[esi]
			sub al , 48
			mul bx
			add ecx, eax

			mov eax , ebx
			mov bx , 10
			mul bx 
			mov ebx , eax

			dec esi
		cmp Buffer2[esi] , 32
		jne get_score

		cmp ecx , score       ;comparing previous and new Score 
		ja previous_score_greater
			;if new Socre is Greater
			mov esi , AlreadyExistPlayerIndex
			mov edi , 0
			copy_untill_end1:
				mov ah , buffer[edi]
				mov buffer2[esi] , ah
				inc esi
				inc edi
			cmp edi , lengthofData
			jne copy_untill_end1

			previous_score_greater:
		jmp out_condition1
	player_no_already_exit:
	mov esi , buffer2size
		mov al , 0dh
		mov buffer2[esi] , al
		inc esi
		mov al , 0ah
		mov buffer2[esi] , al
		inc esi
		mov edi , 0
		copy_untill_end2:
			mov ah , buffer[edi]
			mov buffer2[esi] , ah
			inc esi
			inc edi
		cmp edi , lengthofData
		jne copy_untill_end2


	mov buffer2size , esi



	out_condition1:
	call SortBuffer
	;jmp Quit
	mov edx , offset File
	call CreateOutputFile

	mov fileHandle,eax

	cmp eax, INVALID_HANDLE_VALUE ; error found?
	jne file_ok
	jmp Quit
	file_ok:

	mov edx , offset buffer2
	mov ecx , buffer2size
	call writeToFile

	mov eax , fileHandle
	call CloseFile


	Quit:

	POP ebp
	ret 12
SavePlayerData ENDP

ShowHighScore PROC
	call clrscr
	mov edx , offset File
	call OpenInputFile
	mov fileHandle , eax 
	
	mov edx , offset buffer2
	mov ecx , BUFFER_SIZE2
	call ReadFromFile
	mov buffer2[eax] , 0
	mov buffer2size , eax

	mov eax , FileHandle
	call CloseFile

	mov dl,0   ;Col
	mov dh,1
	call gotoxy

	mov edx , offset HIGHSCORE
	call WriteString

	mov eax , white + (black * 16)
	call SetTextColor

	mov dl , 45
	mov dh , 15
	call gotoXY
	mov esi , 0
	mov edi , 1
	mov eax , 0
	mov bh , 0
	Write_file_data:
		cmp edi , 1
		jne no_name_print
			call gotoxy
			mov al , buffer2[esi]
			call writeChar
			inc dl
		no_name_print:

		cmp buffer2[esi] , 32
		jne no_end_name
			mov edi , 0
		no_end_name:

		mov bl , 0ah
		cmp buffer2[esi] , bl
		jne no_new_name_Start
			mov edi , 1
			add dh , 2
			mov dl , 45
			inc bh

		no_new_name_Start:
		inc esi
	cmp bh , 3
	je three_player_completed
	cmp buffer2[esi] , 0
	jne Write_file_data

	three_player_completed:

	mov dl , 60
	mov dh , 15
	call gotoXY
	mov esi , 0
	mov edi , 0
	mov eax , 0
	mov bh , 0
	Write_file_data1:
		cmp edi , 4
		jne no_name_print1
			call gotoxy
			mov al , buffer2[esi]
			call writeChar
			inc dl
			add edi , 5
		no_name_print1:

		cmp buffer2[esi] , 32
		jne no_end_name1
			add edi , 1
		no_end_name1:

		mov bl , 0ah
		cmp buffer2[esi] , bl
		jne no_new_name_Start1
			mov edi , 1
			add dh , 2
			mov dl , 60
			inc bh
			mov edi , 0
		no_new_name_Start1:
		inc esi
	cmp bh , 3
	je three_player_completed1
	cmp buffer2[esi] , 0
	jne Write_file_data1

	three_player_completed1:


	mov dl , 75
	mov dh , 15
	call gotoXY
	mov esi , 0
	mov edi , 0
	mov eax , 0
	mov bh , 0
	Write_file_data2:
		cmp edi , 8
		jne no_name_print2
			call gotoxy
			mov al , buffer2[esi]
			call writeChar
			inc dl

		no_name_print2:

		cmp buffer2[esi] , 32
		jne no_end_name2
			add edi , 1
		no_end_name2:

		mov bl , 0ah
		cmp buffer2[esi] , bl
		jne no_new_name_Start2
			mov edi , 1
			add dh , 2
			mov dl , 75
			inc bh
			mov edi , 0
		no_new_name_Start2:
		inc esi
	cmp bh , 3
	je three_player_completed2
	cmp buffer2[esi] , 0
	jne Write_file_data2

	three_player_completed2:

	call readChar
	ret
ShowHighScore ENDP

PauseGame PROC
	call clrscr
	show:
		mov dl,0   ;Col
		mov dh,2
		call gotoxy
		mov eax , lightMagenta + (black * 16)
		call setTextColor

		mov edx , offset Pausemenu
		call WriteString

		call readchar
		
		cmp al , 50
		jne no_ins_Called
		call show_instruction
		no_ins_Called:
		cmp al , 49
		je exit_pause
		cmp al , 51
		je exit_pause
	jmp show

	exit_Pause:
	call clrscr
	ret
PauseGame ENDP

show_instruction PROC
	show:
		call clrscr
		mov dl,0   ;Col
		mov dh,2
		call gotoxy
		mov eax , lightMagenta + (black * 16)
		call setTextColor

		mov edx , offset INSTRUCTIONS
		call WriteString

		call readChar

	call clrscr
	ret
show_instruction ENDP

AdvancedGhostPlayerCollision PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 40] == AdvancedGhostPreviousData
	;[ebp + 36] == AdvancedGhostPosition
	;[ebp + 32] == PlayeLives
	;[ebp + 28] == NoOfGhost
	;[ebp + 24] == GameMaze
	;[ebp + 20] == GhostMovementKey
	;[ebp + 16] == GhostsIndexInGameMaze
	;[ebp + 12] == GhostIndexPreviousData
	;[ebp + 8] == PlayerIndexInGameMaze

	mov eax , [ebp + 36]
	mov ebx , [ebp + 8]
	mov ebx , [ebx]
	mov edx , [ebp + 28]
	mov edx , [edx]

	mov esi , 0
	CheckCollision:
		mov ecx , [eax + esi * 4]
		inc ecx
		cmp ecx , ebx 
			je Collision_Found
		dec ecx
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		sub ecx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		add ecx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		inc esi

	cmp esi , 2
	jne CheckCollision

	jmp no_collision

	Collision_Found:
		mov edx , [ebp + 12]
		mov ecx , [ebp + 24]

		mov esi , 0
		L1:
			mov edx , [ebp + 12]
			mov eax , [ebp + 16]

			mov bl ,[edx + esi]         ;previous Data of That Index
			mov edi , [eax  + esi * 4]  ;current Ghost Position
			mov [ecx + edi] , bl        ;GameMaze Address + Ghost Index
			mov bl , " "
			mov [edx + esi] , bl
			inc esi
			mov edi , [ebp + 28]
		cmp esi , [edi] 
		jne L1
		mov ecx , [ebp + 24]
		mov esi , 0
		L2:
			mov edx , [ebp + 40]
			mov eax , [ebp + 36]

			mov bl ,[edx + esi]         ;previous Data of That Index
			mov edi , [eax  + esi * 4]  ;current Ghost Position
			mov [ecx + edi] , bl        ;GameMaze Address + Ghost Index
			mov bl , " "
			mov [edx + esi] , bl
			inc esi
		cmp esi , 2
		jne L2

		mov edx , [ebp + 36]
		mov ebx , 121
		mov [edx] , ebx
		mov ebx , 235
		mov [edx+4] , ebx

		;Setting Ghots Back to There Default Position
		mov eax , [ebp + 16]
		mov edx , 650
		mov [eax + 0] , edx
		mov edx , 649
		mov [eax + 4] , edx
		mov edx , 769
		mov [eax + 8] , edx
		mov edx , 649
		mov [eax + 12] , edx
		mov edx , 769
		mov [eax + 16] , edx

		mov eax , [ebp + 8]   ;current player position
		mov ecx , [ebp + 24] ; GameMaze
		mov ebx , DefaultPlayerIndexInGameMaze  ;delault player position
		mov edx , [eax]
		mov al , " "
		mov [ecx + edx ] ,al

		mov eax , [ebp + 8]   ;current player position
		mov [eax] , ebx

		
		mov al , "X"
		mov [ecx + ebx ] ,al

		mov ecx , TotalPLayerLifes
		mov dl , 3
			DrawLives:
				mov dh, 22
				call Gotoxy
				mov al , " "
				call WriteChar
				add dl , 3
				dec ecx
				cmp ecx , 0
				jne DrawLives
		mov dl, 3
		call DrawMaze
		mov ecx ,[ebp + 32]
		mov edx , 1
		sub [ecx] , edx
	;Prompt Working when Player Lost a Life
	mov dl , 50
	mov dh , 14
	call gotoXY

	mov edx , offset PromptLostLive 
	call writeString

	mov dl , 45
	mov dh , 15
	call gotoxy
	mov edx , offset PromptEnterKey
	call writeString

	mov eax , 0
	continue_loop:
		mov eax , 0
		call readchar

		cmp al , 13
		jne continue_loop

	
	no_collision:

	POP ebp
	ret 36
AdvancedGhostPlayerCollision ENDP

AdvancedGhostMovement PROC
	PUSH ebp
	mov ebp , esp
	;[ebp + 36] ==  AdvancedGhostMovementTimer
	;[ebp + 32] ==  AdvancedTelportTime
	;[ebp + 28] == Advanced Char
	;[ebp + 24] == Ghost Char
	;[ebp + 20] == PlayerIndexInGameMaze
	;[ebp + 16] == AdvancedGhostPosition
	;[ebp + 12] == AdvancedGhostPreviousData
	;[ebp + 8] == GameMaze

	mov esi , 0
	mov eax , [ebp + 16]

	mov ecx , [ebp + 8]

	MoveGhost:
		mov eax , [ebp + 36]
		mov edx , 2
		cmp [eax + esi *4] ,  edx
		je move_ghost
			mov edx , 1
			add [eax + esi * 4] , edx
			jmp Out_Condition
		move_ghost:

		mov edx , 0
		mov [eax + esi * 4] , edx

		mov eax , [ebp + 32]
		mov edx , Timer
		cmp [eax + esi * 4] , edx
		jg no_teleport
			mov edx , 300
			add [eax + esi * 4] , edx      ;inc the Timer for teleport
			mov edx , [ebp + 20]
			mov edx , [edx]
			add edx , 119       ;setting up teleport position
			add edx , 5
			mov bh , "-"
			cmp edx, 1666
			jng not_out_of_map
				sub  edx , 20
			not_out_of_map:
			cmp [ecx + edx ] , bh    ;check if may not lead out of map
			jne in_bound
				sub edx , 119        ;if out of map find space on other side
				sub edx , 119
			

			in_bound:
				mov bl , " "
				mov edi , edx
				find_empty_space:
					cmp [ecx + edx] , bl
					jne no_space
						mov eax , [ebp + 16] 
						mov edi , [eax+esi*4]
						mov [ecx + edi] , bl

						mov [eax+esi*4] , edx
						mov bl , "#"
						mov [ecx + edx] , bl
						jmp Out_Condition
					no_space:
					cmp [ecx + edi ] , bl
					jne no_space2
						mov bl , " "
						mov eax , [ebp + 16] 
						mov edx , [eax+esi*4]
						mov [ecx + edx] , bl

						mov [eax+esi*4] , edi
						mov bl , "#"
						mov [ecx + edi] , bl
						jmp Out_Condition
					no_space2:
					inc edx 
					dec edi
					jmp find_empty_space
			

		no_teleport:


		mov eax , [ebp + 16]  ;Ghost Position Array
		mov edx ,[eax+esi*4]  ;Specfic Ghost Position
		
		cmp edx , 649
			je moveRight
		cmp edx , 769   ;If current Ghost Pois is 768
			je moveUP
		cmp edx , 650   ;If current Ghost Pois is 650
			je moveUP
		cmp edx , 531   ;if current Ghost Posi is 531
			je moveUP


		call CheckDeadEndRight   ;checking if Dead End Reached
		cmp bh , 3
		je check_condition_1
		call CheckDeadEndLeft    ;checking if Dead End Reached
		cmp bh , 3
		je check_condition_2
		call CheckDeadEndDown
		cmp bh , 3
		je check_condition_3
		call CheckDeadEndUp
		cmp bh , 3
		je check_condition_4

		mov bl , "."
		mov bh , " "
		
		cmp AdvancedGhostMovementKey[esi*4] , 1   ;if already moving in one direction dont change Direction intill Path Found
			je no_left_right
		cmp AdvancedGhostMovementKey[esi*4 ] , 2
			je no_left_right


		call Randomize   ;creating Random Possibility to move Left or Right
		mov eax , 2
		call RandomRange
		cmp eax , 1        ;If one (move Right) Else (move Left)
			jne else_if_1

		cmp [ecx + edx - 1] , bl   ;if  posi == "." 
			je check_Condition_1
		cmp [ecx + edx - 1] , bh   ;else posi == " "
			jne else_if_1
			check_condition_1:
				dead_end_move:
				mov AdvancedGhostMovementKey[esi*4] , 1
					jmp else_if_4
		else_if_1:
		
		call Randomize 
		cmp [ecx + edx + 1] , bl   ;if  posi right == "."
			je check_Condition_2
		cmp [ecx + edx + 1] , bh   ;else posi right == " "
			jne else_if_2
		check_condition_2:
			dead_end_move1:
			mov AdvancedGhostMovementKey[esi*4] , 2
				jmp else_if_4

		else_if_2:
		jmp else_if_4
		no_left_right:

		call Randomize   ;creating Random Possibility to move Up or Down
		mov eax , 2
		call RandomRange
		cmp eax , 1        ;If one (move UP) Else (move Down)
			jne else_if_3

		cmp [ecx + edx - 119] , bl   ;if  posi up == "."
			je check_Condition_3
		cmp [ecx + edx - 119] , bh   ;else posi up == " "
			jne else_if_3
		check_condition_3:
			dead_end_move2:
			mov AdvancedGhostMovementKey[esi*4] , 3
			jmp else_if_4

		else_if_3:
		call Randomize 
		cmp [ecx + edx + 119] , bl   ;if  posi down == "."
			je check_Condition_4
		cmp [ecx + edx + 119] , bh   ;else posi down == " "
			jne else_if_4
		check_condition_4:
			dead_end_move3:
			mov AdvancedGhostMovementKey[esi*4] , 4
			jmp else_if_4
		
		else_if_4:

		mov ah , 1
		cmp PowerUp , ah
		je do_not_follow
		call CheckPlayerFollowDown
		cmp ah , 1
			je moveDown
		call CheckPlayerFollowUp
		cmp ah , 1
			je moveUp
		call CheckPlayerFollowRight
		cmp ah , 1
			je moveRight
		call CheckPlayerFollowLeft
		cmp ah , 1
			je moveleft
		do_not_follow:
		

		to_movement:
		cmp AdvancedGhostMovementKey[esi*4], 1
			je moveLeft
		cmp AdvancedGhostMovementKey[esi*4], 2
			je moveRight
		cmp AdvancedGhostMovementKey[esi*4], 3
			je moveUp
		cmp AdvancedGhostMovementKey[esi*4], 4
			je moveDown

		moveUp:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx -119] , bl
				je Out_Condition
			cmp [ecx + edx -119] , bh
				je Out_Condition
			
			mov edi , [ebp + 12]         ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl       ;Moving Previous Data back 
			sub edx , 119                ;Updating Posi
			mov bl ,  [ecx + edx]        ;Fetching new Posi Data
			mov eax , [ebp + 24]
			cmp bl , [eax]                 ;checking AGhost Ghost Collision
				jne no_ghost_collision1
			mov bl , " "
			no_ghost_collision1:
			mov eax , [ebp + 28]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision11
			mov bl , " "
			no_ghost_collision11:
			mov [edi + esi] , bl          ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl          ;Placing Ghost to new Posi
			mov eax , [ebp + 16]
			mov [eax + esi * 4] , edx
			jmp Out_Condition

		moveLeft:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx -1] , bl
				je Out_Condition

			mov edi , [ebp + 12]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			sub edx , 1             ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data
			mov eax , [ebp + 24]
			cmp bl , [eax]            
				jne no_ghost_collision2
			mov bl , " "
			no_ghost_collision2:
			mov eax , [ebp + 28]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision22
			mov bl , " "
			no_ghost_collision22:
			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 16]
			mov [eax + esi*4] , edx
			jmp Out_Condition

		moveRight:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx +1] , bl
				je Out_Condition
			mov edi , [ebp + 12]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			add edx , 1             ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data

			mov eax , [ebp + 24]
			cmp bl , [eax]
				jne no_ghost_collision3
			mov bl , " "
			no_ghost_collision3:
			mov eax , [ebp + 28]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision33
			mov bl , " "
			no_ghost_collision33:

			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]           
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 16]
			mov [eax + esi*4] , edx  ;setting up new Position of Ghost in Ghost Posi Array
			jmp Out_Condition

		moveDown:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx + 119] , bl
				je Out_Condition
			cmp [ecx + edx + 119] , bh
				je Out_Condition
			mov edi , [ebp + 12]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			add edx , 119           ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data

			mov eax , [ebp + 24]    ;Ghost Char
			cmp bl , [eax]
				jne no_ghost_collision4
			mov bl , " "
			no_ghost_collision4:
			mov eax , [ebp + 28]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision44
			mov bl , " "
			no_ghost_collision44:

			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 16]
			mov [eax + esi*4] , edx  ;setting up new Position of Ghost in Ghost Posi Array
			jmp Out_Condition


	Out_Condition:
	inc esi
	cmp esi , 2
	jne MoveGhost

		

	POP ebp
	ret 32
AdvancedGhostMovement ENDP

FruitSpawnRandom PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 16] ==  MaxMazeIndexSize
	;[ebp + 12] ==  FruitSpawnTime
	;[ebp + 8] ==  GameMaze

	mov eax , [ebp + 8]
	mov ebx , [ebp + 12]
	mov edx , [ebp + 16]
	mov edx , [edx]

	mov ecx , Timer
	cmp [ebx] , ecx
	ja no_fruit_spawn 
	mov ecx , 400
	add [ebx] , ecx
	mov ecx , 0
	mov bl , "."
	mov bh , "o"
	call Randomize

	create_Random:
		call Randomize 
		mov eax , 1550
		call RandomRange
		mov esi , eax
		mov eax , [ebp + 8]
		cmp [eax + esi] , bl
		jne no_space_found
			mov [eax+esi] , bh
			inc ecx
		no_space_found:
	cmp ecx , 1
	jne create_Random

	no_fruit_spawn :
	POP ebp
	ret 12
FruitSpawnRandom ENDP

PowerUpWorking PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 12] == PowerUp
	;[ebp + 8] == PowerUpTimer

	mov edx , [ebp + 8]
	mov ecx , [edx]
	cmp ecx , Timer
	jne dont_remove_power_up
		mov eax , [ebp + 12]
		mov ecx , 0
		mov [eax] , ecx
		mov edx , [ebp + 8]
		mov [edx] , ecx

		mov dl , 2
		mov dh , 6
		call gotoxy
		mov edx , offset SpacetohideContent
		call writeString
	dont_remove_power_up:

	POP ebp
	ret 8
PowerUpWorking ENDP

Level3 PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 12] EndGame
	;[ebp + 8] GameMaze

	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count1:
		cmp GameMaze[esi] , bl
		jne no_dot_found
		inc ecx
		no_dot_found:
		inc esi
		cmp GameMaze1[esi] , 0
		jne count1

	cmp ecx , 0
	jne main_out_condition
		mov ebx,[ebp+12]
		mov al , 1
		mov [ebx] , al

		call clrscr
		
		mov edx , offset PromptGameWon
		mov dl , 47
		mov dh , 13
		call gotoXY
		call writeString


	main_out_condition:

	POP ebp
	ret 8
level3 ENDP

Level2 PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 48] ==  GhostIndexPreviousData
	;[ebp + 44] ==  GhostsIndexInGameMaze
	;[ebp + 40] ==  PlayerIndexInGameMaze
	;[ebp + 36] == TotalPLayerLifes
	;[ebp + 32] == FruitSpawnTime 
	;[ebp + 28] == TotalNumberOfDots
	;[ebp + 24] == GameMazeLength
	;[ebp + 20] == address no of ghost
	;[ebp + 16] == address level
	;[ebp + 12] == address total dots in level
	;[ebp + 8] == address score value

	mov eax , [ebp + 12] ;getting Total Score required
	mov ebx , [ebp + 8]  ;getting current Score
	mov eax , [eax]      ;check if total score made is equal to the number of dots on map
	                     ;if equal then advance to new level

	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count1:
		cmp GameMaze[esi] , bl
		jne no_dot_found
		inc ecx
		no_dot_found:
		inc esi
		cmp GameMaze1[esi] , 0
		jne count1


	cmp ecx , 0
	jne main_out_condition
	mov Timer , 0

	mov ecx , [ebp + 28]
	mov ecx , [ecx + 8]   ;get the total Number of Dots in new Level
	mov eax , 0
	mov [ebx] , eax       ;Making current Score Zero

	mov ebx , [ebp + 12]
	mov [ebx] , ecx       ;set the max number of Dots in new Level

	mov ebx , [ebp + 20]
	mov ecx , 2
	mov [ebx] , ecx       ;set up the number of ghost for new Level

	mov ebx , [ebp + 24]
	mov ebx , [ebx + 8]
	mov MaxMazeIndexSize , ebx  ;set up the game maze Length

	mov ebx , [ebp + 16]
	mov eax , 1
	add [ebx] , eax             ;inc level

	mov ebx , [ebp + 32]
	mov al , "€"
	mov [ebx] , al

	mov ebx , [ebp + 36]
	mov eax , 3
	mov [ebx] , eax

	mov ebx , [ ebp + 40]
	mov eax , DefaultPlayerIndexInGameMaze
	mov [ebx] , eax

	mov eax , [ebp + 44]
	mov edx , 650
	mov [eax + 0] , edx
	mov [eax + 4] , edx
	mov [eax + 8] , edx
	mov [eax + 12] , edx
	mov [eax + 16] , edx

	mov eax , [ebp + 48]
	mov bl , " "
	mov [eax + 0] , bl
	mov [eax + 1] , bl
	mov [eax + 2] , bl
	mov [eax + 3] , bl
	mov [eax + 4] , bl

	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count:
		mov al , GameMaze3[esi]
		mov GameMaze[esi] , al
		inc esi
		cmp GameMaze3[esi] , 0
		jne count
	mov al , 0
	mov GameMaze[esi] , al



	mov dl , 51
	mov dh , 13
	call gotoXY
	mov eax , white + (black * 16)
	mov edx , offset PromptLevelFinished
	call writeString


	mov eax , 0
	continue_loop:
		mov eax , 0
		call readchar

		cmp al , 13
		jne continue_loop
		
	main_out_condition:

	POP ebp
	ret 44
Level2 ENDP

Level1 PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 48] ==  GhostIndexPreviousData
	;[ebp + 44] ==  GhostsIndexInGameMaze
	;[ebp + 40] ==  PlayerIndexInGameMaze
	;[ebp + 36] == TotalPLayerLifes
	;[ebp + 32] == GhostChar
	;[ebp + 28] == TotalNumberOfDots
	;[ebp + 24] == GameMazeLength
	;[ebp + 20] == address no of ghost
	;[ebp + 16] == address level
	;[ebp + 12] == address total dots in level
	;[ebp + 8]  == address score value

	mov ebx , [ebp + 20]
	mov ecx , [ebp + 8]
	
	mov ax , [ecx]
	mov edx , 4
	cmp ax , 150          ;Ghost inc after 150 points collected
		jne out_condition
	cmp [ebx] , edx
		je out_condition
		mov eax , 1
		add [ebx] , eax
		jmp out_condition
	out_condition:


	mov eax , [ebp + 12] ;getting Total Score required
	mov ebx , [ebp + 8]  ;getting current Score
	mov eax , [eax]      ;check if total score made is equal to the number of dots on map
	                     ;if equal then advance to new level

	;count number of dots present on level
	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count1:
		cmp GameMaze[esi] , bl
		jne no_dot_found
		inc ecx
		no_dot_found:
		inc esi
		cmp GameMaze[esi] , 0
		jne count1

	cmp ecx , 0
	jne main_out_condition
	mov Timer , 0

	mov ecx , [ebp + 28]
	mov ecx , [ecx + 4]   ;get the total Number of Dots in new Level
	mov eax , 298
	mov [ebx] , eax       ;Making current Score Zero

	mov ebx , [ebp + 12]
	mov [ebx] , ecx       ;set the max number of Dots in new Level

	mov ebx , [ebp + 20]
	mov ecx , 3
	mov [ebx] , ecx       ;set up the number of ghost for new Level

	mov ebx , [ebp + 24]
	mov ebx , [ebx + 4]
	mov MaxMazeIndexSize , ebx  ;set up the game maze Length

	mov ebx , [ebp + 16]
	mov eax , 1
	add [ebx] , eax             ;inc level

	mov ebx , [ebp + 32]
	mov al , "€"
	mov [ebx] , al

	mov ebx , [ebp + 36]
	mov eax , 3
	mov [ebx] , eax

	mov ebx , [ ebp + 40]
	mov eax , DefaultPlayerIndexInGameMaze
	mov [ebx] , eax

	mov eax , [ebp + 44]
	mov edx , 650
	mov [eax + 0] , edx
	mov [eax + 4] , edx
	mov [eax + 8] , edx
	mov [eax + 12] , edx
	mov [eax + 16] , edx

	mov eax , [ebp + 48]
	mov bl , " "
	mov [eax + 0] , bl
	mov [eax + 1] , bl
	mov [eax + 2] , bl
	mov [eax + 3] , bl
	mov [eax + 4] , bl


	mov esi  ,0
	mov ecx , 0
	mov bl , "."
	count:
		mov al , GameMaze2[esi]
		mov GameMaze[esi] , al
		inc esi
		cmp GameMaze2[esi] , 0
		jne count
	mov al , 0
	mov GameMaze[esi] , al

		
	mov dl , 51
	mov dh , 13
	call gotoXY
	mov eax , white + (black * 16)
	mov edx , offset PromptLevelFinished
	call writeString


	mov eax , 0
	continue_loop:
		mov eax , 0
		call readchar

		cmp al , 13
		jne continue_loop
	main_out_condition:

	POP ebp
	ret 44
Level1 ENDP

SpawningEatenGhost PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 16] == NoOfGhost
	;[ebp + 12] == GhostEatenTimer
	;[ebp + 8] == GhostEaten


	mov eax , [ebp + 12]
	mov ebx , [ebp + 8]
	mov ebx , [ebx]
	mov esi , 0

	check_Time_End:
		mov ecx , Timer
		cmp ecx , [eax + esi *4 ] 
		jna time_is_remaining
			jmp release_Ghost
		time_is_remaining:
		inc esi
	cmp esi , ebx
	jne check_Time_End
		
	jmp out_condition
	release_Ghost:
		
		remove_Timer:
			mov ecx , [ebp + 12]
			inc esi
			mov eax , [ecx + esi * 4 ]
			dec esi 
			mov [ecx + esi * 4] , eax
			inc esi
		cmp esi , ebx
		jne remove_Timer

		mov ecx , [ebp + 8]
		mov eax , 1
		sub [ecx] , eax

		mov ecx , [ebp + 16]
		mov eax , 1
		add [ecx] , eax


	out_condition:
	POP ebp
	ret 12
SpawningEatenGhost ENDP

CheckPLayerEatGhost PROC
	PUSH ebp
	mov ebp , esp
	
	;[ebp + 40] = Score
	;[ebp+36] =  GhostEatenTimer
	;[ebp+32] =  GhostEaten
	;[ebp+28] =  NoOfGhost
	;[ebp+24] =  GameMaze
	;[ebp+20] =  GhostMovementKey
	;[ebp+16] =  GhostsIndexInGameMaze
	;[ebp+12] =  GhostIndexPreviousData
	;[ebp+8] =   PlayerIndexInGameMaze

	mov eax , [ebp + 16]
	mov ebx , [ebp + 8]
	mov ebx , [ebx]
	mov edx , [ebp + 28]
	mov edx , [edx]

	mov esi , 0
	CheckCollision:
		cmp edx , 0
		je out_no_collision
		mov ecx , [eax + esi * 4]   ;getting Ghost Position
		mov ebx , [ebp + 8]
		mov ebx , [ebx]

		cmp ecx , ebx               ;checking Player Collision with Any Ghost  
			je Collision_Found

		cmp [eax + esi * 4 ] , ebx   ;checking Collsion for Every Side [UP , Down , Left , Right]
			je Collision_Found
		sub ebx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		add ebx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		inc esi
	cmp esi , edx
	jne CheckCollision

	jmp out_no_collision
	Collision_Found:
	mov ecx , [ebp + 40]
	mov ebx , 10
	add [ecx] , ebx 

	mov ecx , [ebp + 16]    ;GhostsIndexInGameMaze
	mov edi , [ebp + 24]
	
	;mov ebx , [ecx + esi * 4]
	;mov al , "X"
	;mov [edi + ebx] , al      ;Removing Ghost form Game Maze    

	mov eax , [ebp + 12]    ;GhostIndexPreviousData
	mov ebx , [ebp + 20]    ;GhostMovementKey
	remove_Ghost:
		mov ecx , [ebp + 16]
		inc esi
		mov eax , [ecx + esi * 4 ]
		dec esi 
		mov [ecx + esi * 4] , eax

		mov ecx , [ebp + 12]
		inc esi
		mov al , [ecx + esi ]
		cmp al , "X"
		jne no_player
			mov al , " "
		no_player:
		dec esi 
		mov [ecx + esi] , al

		mov ecx , [ebp + 20]
		inc esi
		mov eax , [ecx + esi * 4 ]
		dec esi 
		mov [ecx + esi * 4] , eax

		inc esi
	cmp esi , edx
	jne remove_Ghost

	clear_previous_data:
		mov ecx , [ebp + 12]
		mov al , " "
		mov [ecx + esi] , al

		mov ecx , [ebp + 16]
		mov eax , 650
		mov [ecx + esi * 4] , eax


		inc esi
	cmp esi , 5
	jne clear_previous_data


	mov eax , [ebp + 32]     ;inc the ghost that are eaten
	mov ebx , 1           
	add [eax] , ebx
	mov esi , [eax]
	dec esi

	mov eax   , [ebp + 36]   ;set up time when they come Back
	mov ebx   , Timer
	add ebx   , 350
	mov [eax + esi * 4] , ebx

	mov eax , [ebp + 28]    ;reducing actual Number of Ghost
	mov ebx , 1
	sub [eax] , ebx

		
	out_no_collision:
	POP ebp
	ret 36
CheckPLayerEatGhost ENDP

CheckPlayerGhostCollision PROC
	PUSH ebp
	mov ebp , esp

	;[ebp + 32] == PlayeLives
	;[ebp + 28] == NoOfGhost
	;[ebp + 24] == GameMaze
	;[ebp + 20] == GhostMovementKey
	;[ebp + 16] == GhostsIndexInGameMaze
	;[ebp + 12] == GhostIndexPreviousData
	;[ebp + 8] == PlayerIndexInGameMaze

	mov eax , [ebp + 16]
	mov ebx , [ebp + 8]
	mov ebx , [ebx]
	mov edx , [ebp + 28]
	mov edx , [edx]

	mov esi , 0
	CheckCollision:
		cmp edx , 0
		je no_collision
		mov ecx , [eax + esi * 4]
		inc ecx
		cmp ecx , ebx 
			je Collision_Found
		dec ecx
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		sub ecx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		add ecx , 199
		cmp [eax + esi * 4 ] , ebx
			je Collision_Found
		inc esi

	cmp esi , edx
	jne CheckCollision

	jmp no_collision

	Collision_Found:
		INVOKE PlaySound, OFFSET deathSound, NULL , 11h
		mov edx , [ebp + 12]
		mov ecx , [ebp + 24]

		mov esi , 0
		L1:
			mov eax , [ebp + 16]
			mov edx , [ebp + 12]
			mov eax , [ebp + 16]

			mov bl ,[edx + esi]         ;previous Data of That Index
			mov edi , [eax  + esi * 4]  ;current Ghost Position
			mov [ecx + edi] , bl        ;GameMaze Address + Ghost Index
			mov bl , " "
			mov [edx + esi] , bl
			inc esi
			mov edi , [ebp + 28]
		cmp esi , [edi] 
		jne L1

		;Setting Ghots Back to There Default Position
		mov eax , [ebp + 16]
		mov edx , 650
		mov [eax + 0] , edx
		mov edx , 649
		mov [eax + 4] , edx
		mov edx , 769
		mov [eax + 8] , edx
		mov edx , 649
		mov [eax + 12] , edx
		mov edx , 769
		mov [eax + 16] , edx

		mov eax , [ebp + 8]   ;current player position
		mov ecx , [ebp + 24] ; GameMaze
		mov ebx , DefaultPlayerIndexInGameMaze  ;delault player position
		mov edx , [eax]
		mov al , " "
		mov [ecx + edx ] ,al

		mov eax , [ebp + 8]   ;current player position
		mov [eax] , ebx

		
		mov al , "X"
		mov [ecx + ebx ] ,al

		mov ecx , TotalPLayerLifes
		mov dl , 3
			DrawLives:
				mov dh, 22
				call Gotoxy
				mov al , " "
				call WriteChar
				add dl , 3
				dec ecx
				cmp ecx , 0
				jne DrawLives
		mov dl, 3
		call DrawMaze
		mov ecx ,[ebp + 32]
		mov edx , 1
		sub [ecx] , edx
	;Prompt Working when Player Lost a Life
	mov dl , 50
	mov dh , 14
	call gotoXY

	mov edx , offset PromptLostLive 
	call writeString

	mov dl , 45
	mov dh , 15
	call gotoxy
	mov edx , offset PromptEnterKey
	call writeString

	mov eax , 0
	continue_loop:
		mov eax , 0
		call readchar

		cmp al , 13
		jne continue_loop

	no_collision:

	POP ebp
	ret 28
CheckPlayerGhostCollision ENDP

GhostMovement PROC
	PUSH ebp
	mov ebp , esp
	
	mov eax , [ebp + 20]  ;Ghost Position
	mov edi , [ebp + 16]  ;Previous Data of Index
	mov ebx , [ebp + 12]  ;total Ghost
	mov ecx , [ebp + 8 ]  ;Game Maze
	mov esi , 0

	call Randomize 

	MoveGhost:
		mov ebx , [ebp + 12]
		mov ebx , [ebx]
		cmp ebx , 0
		je Quit
		mov eax , [ebp + 36]
		mov edx , 2
		cmp [eax + esi *4] ,  edx
		je move_ghost
			mov edx , 1
			add [eax + esi * 4] , edx
			jmp Out_Condition
		move_ghost:

		mov edx , 0
		mov [eax + esi * 4] , edx

		mov eax , [ebp + 20]  ;Ghost Position Array
		mov edx ,[eax+esi*4]  ;Specfic Ghost Position
		
		cmp edx , 649
			je moveRight
		cmp edx , 769   ;If current Ghost Pois is 768
			je moveUP
		cmp edx , 650   ;If current Ghost Pois is 650
			je moveUP
		cmp edx , 531   ;if current Ghost Posi is 531
			je moveUP


		call CheckDeadEndRight   ;checking if Dead End Reached
		cmp bh , 3
		je check_condition_1
		call CheckDeadEndLeft    ;checking if Dead End Reached
		cmp bh , 3
		je check_condition_2
		call CheckDeadEndDown
		cmp bh , 3
		je check_condition_3
		call CheckDeadEndUp
		cmp bh , 3
		je check_condition_4

		mov eax , [ebp + 20]
		mov bl , "."
		mov bh , " "
		
		cmp GhostMovementKey[esi*4] , 1   ;if already moving in one direction dont change Direction intill Path Found
			je no_left_right
		cmp GhostMovementKey[esi*4 ] , 2
			je no_left_right


		call Randomize   ;creating Random Possibility to move Left or Right
		mov eax , 2
		call RandomRange
		cmp eax , 1        ;If one (move Right) Else (move Left)
			jne else_if_1
		mov al , "o"
		cmp [ecx + edx - 1] , bl   ;if  posi == "." 
			je check_Condition_1
		cmp [ecx + edx -1] , al
			je check_Condition_1
		cmp [ecx + edx - 1] , bh   ;else posi == " "
			jne else_if_1
			check_condition_1:
				dead_end_move:
				mov GhostMovementKey[esi*4] , 1
					jmp else_if_4
		else_if_1:
		mov al , "o"
		call Randomize 
		cmp [ecx + edx + 1] , bl   ;if  posi right == "."
			je check_Condition_2
		cmp [ecx + edx -1] , al    ;posi right == "o"
			je check_Condition_2
		cmp [ecx + edx + 1] , bh   ;else posi right == " "
			jne else_if_2
		check_condition_2:
			dead_end_move1:
			mov GhostMovementKey[esi*4] , 2
				jmp else_if_4

		else_if_2:
		jmp else_if_4
		no_left_right:

		call Randomize   ;creating Random Possibility to move Up or Down
		mov eax , 2
		call RandomRange
		cmp eax , 1        ;If one (move UP) Else (move Down)
			jne else_if_3
		mov al , "o"
		cmp [ecx + edx - 119] , bl   ;if  posi up == "."
			je check_Condition_3
		cmp [ecx + edx - 119] , al   ;if  posi up == "o"
			je check_Condition_3
		cmp [ecx + edx - 119] , bh   ;else posi up == " "
			jne else_if_3
		check_condition_3:
			dead_end_move2:
			mov GhostMovementKey[esi*4] , 3
			jmp else_if_4

		else_if_3:
		mov al , 'o'
		call Randomize 
		cmp [ecx + edx + 119] , bl   ;if  posi down == "."
			je check_Condition_4
		cmp [ecx + edx + 119] , al   ;if  posi down == "o"
			je check_Condition_4
		cmp [ecx + edx + 119] , bh   ;else posi down == " "
			jne else_if_4
		check_condition_4:
			dead_end_move3:
			mov GhostMovementKey[esi*4] , 4
			jmp else_if_4
		
		else_if_4:

		mov edi , 0
		cmp level , 1      ;if level 1 Ghost do not follow Player
		je no_follow
		mov edi , [ebp + 28]   ;Power Up Bool
		mov eax , 0
		cmp [edi] , eax
		jne no_follow
		call CheckPlayerFollowDown
		cmp ah , 1
		je moveDown
		call CheckPlayerFollowUp
		cmp ah , 1
		je moveUp
		call CheckPlayerFollowRight
		cmp ah , 1
		je moveRight
		call CheckPlayerFollowLeft
		cmp ah , 1
		je moveleft

		no_follow:
		
		cmp GhostMovementKey[esi*4], 1
			je moveLeft
		cmp GhostMovementKey[esi*4], 2
			je moveRight
		cmp GhostMovementKey[esi*4], 3
			je moveUp
		cmp GhostMovementKey[esi*4], 4
			je moveDown

		jmp Out_Condition
		
		moveUp:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx -119] , bl
				je Out_Condition
			cmp [ecx + edx -119] , bh
				je Out_Condition
			
			mov edi , [ebp + 16]         ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl       ;Moving Previous Data back 
			sub edx , 119                ;Updating Posi
			mov bl ,  [ecx + edx]        ;Fetching new Posi Data

			mov eax , [ebp + 32]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision44
			mov bl , " "
			no_ghost_collision44:
			mov eax , [ebp + 24]
			cmp bl , [eax]                 ;checking Ghost Ghost Collision
				jne no_ghost_collision1
			mov bl , " "
			no_ghost_collision1:
			
			mov [edi + esi] , bl          ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl          ;Placing Ghost to new Posi
			mov eax , [ebp + 20]
			mov [eax + esi * 4] , edx
			jmp Out_Condition

		moveLeft:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx -1] , bl
				je Out_Condition

			mov edi , [ebp + 16]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			sub edx , 1             ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data

			mov eax , [ebp + 32]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision22
			mov bl , " "
			no_ghost_collision22:
			mov eax , [ebp + 24]
			cmp bl , [eax]            
				jne no_ghost_collision2
			mov bl , " "
			no_ghost_collision2:

			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 20]
			mov [eax + esi*4] , edx
			jmp Out_Condition

		moveRight:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx +1] , bl
				je Out_Condition
			mov edi , [ebp + 16]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			add edx , 1             ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data

			mov eax , [ebp + 32]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision33
			mov bl , " "
			no_ghost_collision33:
			mov eax , [ebp + 24]
			cmp bl , [eax]
				jne no_ghost_collision3
			mov bl , " "
			no_ghost_collision3:

			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]           
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 20]
			mov [eax + esi*4] , edx  ;setting up new Position of Ghost in Ghost Posi Array
			jmp Out_Condition

		moveDown:
			mov bl , "|"
			mov bh , "-"
			cmp [ecx + edx + 119] , bl
				je Out_Condition
			cmp [ecx + edx + 119] , bh
				je Out_Condition
			mov edi , [ebp + 16]  ;Previous Data of Index
			mov bl , [edi + esi]   
			mov [ ecx + edx] ,  bl  ;Moving Previous Data back 
			add edx , 119           ;Updating Posi
			mov bl ,  [ecx + edx]   ;Fetching new Posi Data

			mov eax , [ebp + 32]
			cmp bl , [eax]                 ;checking AGhost AGhost Collision
				jne no_ghost_collision11
			mov bl , " "
			no_ghost_collision11:
			mov eax , [ebp + 24]    ;Ghost Char
			cmp bl , [eax]
				jne no_ghost_collision4
			mov bl , " "
			no_ghost_collision4:

			mov [edi + esi] , bl    ;Putting new Data in Data Array
			mov bl , [eax]            
			mov [ecx + edx] , bl    ;Placing Ghost to new Posi
			mov eax , [ebp + 20]
			mov [eax + esi*4] , edx  ;setting up new Position of Ghost in Ghost Posi Array
			jmp Out_Condition

	Out_Condition:
	inc esi
	mov ebx , [ebp + 12]
	cmp esi , [ebx]
	JNE MoveGhost
	Quit:
	POP ebp
	ret 32
GhostMovement ENDP

CheckPlayerFollowUp PROC
	mov edi , edx
	mov bl , "|"
	mov bh , "-"
	mov al , "X"
	mov ah , 0
	L1:
		cmp [ecx + edi] , al
		jne no_player_found
			mov ah , 1
			mov GhostMovementKey[esi * 4] , 3
			jmp out_condition
		no_player_found:

		cmp [ecx + edi ] , bl
		jne no_wall_found
			jmp out_condition
		no_wall_found:

		cmp [ecx + edi] , bh
		jne no_end_found
			jmp out_condition
		no_end_found:

		sub edi , 119

		cmp edi , 0
		ja L1


	out_condition:
	ret
CheckPlayerFollowUp ENDP

CheckPlayerFollowDown PROC
	mov edi , edx
	mov bl , "|"
	mov bh , "-"
	mov al , "X"
	mov ah , 0
	L1:
		cmp [ecx + edi] , al
		jne no_player_found
			mov ah , 1
			mov GhostMovementKey[esi * 4] , 4
			jmp out_condition
		no_player_found:

		cmp [ecx + edi ] , bl
		jne no_wall_found
			jmp out_condition
		no_wall_found:

		cmp [ecx + edi] , bh
		jne no_end_found
			jmp out_condition
		no_end_found:

		add edi , 119

	cmp edi , MaxMazeIndexSize
	jb L1


	out_condition:
	ret
CheckPlayerFollowDown ENDP

CheckPlayerFollowRight PROC
	mov edi , edx
	mov bl , "|"
	mov bh , "-"
	mov al , "X"
	mov ah , 0
	L1:
		cmp [ecx + edi] , al
		jne no_player_found
			mov ah , 1
			mov GhostMovementKey[esi * 4] , 2
			jmp out_condition
		no_player_found:

		cmp [ecx + edi ] , bl
		jne no_wall_found
			jmp out_condition
		no_wall_found:

		cmp [ecx + edi] , bh
		jne no_end_found
			jmp out_condition
		no_end_found:

		add edi , 1

	cmp edi , MaxMazeIndexSize
	jb L1


	out_condition:
	ret
CheckPlayerFollowRight ENDP

CheckPlayerFollowLeft PROC
	mov edi , edx
	mov bl , "|"
	mov bh , "-"
	mov al , "X"
	mov ah , 0
	L1:
		cmp [ecx + edi] , al
		jne no_player_found
			mov ah , 1
			mov GhostMovementKey[esi * 4] , 1
			jmp out_condition
		no_player_found:

		cmp [ecx + edi ] , bl
		jne no_wall_found
			jmp out_condition
		no_wall_found:

		cmp [ecx + edi] , bh
		jne no_end_found
			jmp out_condition
		no_end_found:

		sub edi , 1

	cmp edi , 0
	ja L1


	out_condition:
	ret
CheckPlayerFollowLeft ENDP

CheckDeadEndRight PROC

	mov bh , 0
	mov bl , "|"
	cmp [ecx + edx + 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx + 119] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx - 119] , bl
		jne do_not_add
	add bh , 1

	do_not_add:
	ret
CheckDeadEndRight ENDP

CheckDeadEndLeft PROC

	mov bh , 0
	mov bl , "|"
	cmp [ecx + edx - 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx + 119] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx - 119] , bl
		jne do_not_add
	add bh , 1

	do_not_add:
	ret
CheckDeadEndLeft ENDP

CheckDeadEndDown PROC
	mov bh , 0
	mov al , "-"
	mov bl , "|"
	cmp [ecx + edx - 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx + 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx + 119] , al
		jne check_wall
	add bh , 1
	jmp do_not_add
	check_wall:
	cmp [ecx + edx + 119] , bl
		jne do_not_add
	add bh , 1

	do_not_add:
	ret
CheckDeadEndDown ENDP

CheckDeadEndUp PROC
	mov bh , 0
	mov al , "-"
	mov bl , "|"
	cmp [ecx + edx - 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx + 1] , bl
		jne do_not_add
	add bh , 1
	cmp [ecx + edx - 119] , al
		jne check_wall
	add bh , 1
	jmp do_not_add
	check_wall:
	cmp [ecx + edx - 119] , bl
		jne do_not_add
	add bh , 1

	do_not_add:
	ret
CheckDeadEndUp ENDP

CountScore PROC
	mov dl , "."
	mov dh , "o"
	cmp [ebx + esi] , dl
	jne no_dot_found
		mov dl , 1
		add [ecx] , dl
	no_dot_found:
	cmp [ebx + esi] , dh
	jne no_fruit_found
		mov dl ,5
		add [ecx] , dl
	no_fruit_found:


	ret
CountScore ENDP

MovePlayerLeft PROC
	PUSH ebp
	mov ebp , esp

	mov esi , [ebp + 16] ;player Index
	mov ebx , [ebp + 12] ;GameMaze
	mov ecx , [ebp + 8]  ;Getting Score

	mov dl , "|"
	mov dh , "X"
	mov al , "-"

	cmp [(ebx + esi) - 1] , dl
	je obstacle_found
	cmp [(ebx + esi) - 1] , al
	je obstacle_found


	mov dl , " "
	mov [ebx+esi] , dl
	dec PlayerIndexInGameMaze
	dec esi

	mov dl , "+"
	cmp [ebx + esi] , dl
	jne count_score
		mov edx , [ebp + 20]
		mov al , 1
		mov [edx] , al          ;Making Power Up Variable True

		mov edx , [ebp + 24]
		mov eax , Timer
		add eax , 300
		mov [edx] , eax

		mov dl , 2
		mov dh , 6
		call gotoxy
		mov edx , offset PromptPoweUp
		call writeString
		jmp move_player
	count_score:
	call CountScore
	move_player:
	mov dh , "X"
	mov [ebx+esi] , dh

	obstacle_found:

	POP ebp
	ret 20
MovePlayerLeft ENDP

MovePlayerRight PROC
	PUSH ebp
	mov ebp , esp

	mov esi , [ebp + 16] ;getting player recent Position
	mov ebx , [ebp + 12] ;Getting GameMaze Array address
	mov ecx , [ebp + 8]  ;Getting Score

	mov dl , "|"
	mov dh , "X"
	mov al , "-"

	cmp [(ebx + esi) + 1] , dl
	je obstacle_found
	cmp [(ebx + esi) + 1] , al
	je obstacle_found

	mov dl , " "
	mov [ebx+esi] , dl
	inc PlayerIndexInGameMaze
	inc esi

	mov dl , "+"
	cmp [ebx + esi] , dl
	jne count_score
		mov edx , [ebp + 20]
		mov al , 1
		mov [edx] , al          ;Making Power Up Variable True

		mov edx , [ebp + 24]
		mov eax , Timer
		add eax , 300
		mov [edx] , eax

		mov dl , 2
		mov dh , 6
		call gotoxy
		mov edx , offset PromptPoweUp
		call writeString
		jmp move_player
	count_score:
	call CountScore
	move_player:
	mov dh , "X"
	mov [ebx+esi] , dh

	obstacle_found:

	POP ebp
	ret 20
MovePlayerRight ENDP
	
MovePlayerUp PROC
	PUSH ebp
	mov ebp , esp

	mov esi , [ebp + 16] ;getting player recent Position
	mov ebx , [ebp + 12] ;Getting GameMaze Array address
	mov ecx , [ebp + 8]  ;Getting Score


	mov dl , "|"
	mov dh , "X"
	mov al , "-"

	cmp [(ebx + esi) - 119] , dl
	je obstacle_found
	cmp [(ebx + esi) - 119] , al
	je obstacle_found

	mov dl , " "
	mov [ebx+esi] , dl
	sub PlayerIndexInGameMaze , 119
	sub esi ,119 

	mov dl , "+"
	cmp [ebx + esi] , dl
	jne count_score
		mov edx , [ebp + 20]
		mov al , 1
		mov [edx] , al          ;Making Power Up Variable True

		mov edx , [ebp + 24]
		mov eax , Timer
		add eax , 300
		mov [edx] , eax

		mov dl , 2
		mov dh , 6
		call gotoxy
		mov edx , offset PromptPoweUp
		call writeString

		jmp move_player
	count_score:
	call CountScore
	move_player:
	mov dh , "X"
	mov [ebx+esi] , dh

	obstacle_found:

	POP ebp
	ret 20
MovePlayerUp ENDP

MovePlayerDown PROC
	PUSH ebp
	mov ebp , esp

	mov esi , [ebp + 16] ;getting player recent Position
	mov ebx , [ebp + 12] ;Getting GameMaze Array address
	mov ecx , [ebp + 8]  ;Getting Score

	mov dl , "|"
	mov dh , "X"
	mov al , "-"

	cmp [(ebx + esi) + 119] , dl
	je obstacle_found
	cmp [(ebx + esi) + 119] , al
	je obstacle_found

	mov dl , " "
	mov [ebx+esi] , dl
	add PlayerIndexInGameMaze , 119
	add esi ,119 

	mov dl , "+"
	cmp [ebx + esi] , dl
	jne count_score
		mov edx , [ebp + 20]
		mov al , 1
		mov [edx] , al          ;Making Power Up Variable True
		mov edx , [ebp + 24]
		mov eax , Timer
		add eax , 300
		mov [edx] , eax

		mov dl , 2
		mov dh , 6
		call gotoxy
		mov edx , offset PromptPoweUp
		call writeString
		jmp move_player
	count_score:
	call CountScore
	move_player:
	mov dh , "X"
	mov [ebx+esi] , dh

	obstacle_found:

	POP ebp
	ret 20
MovePlayerDown ENDP

DrawMaze PROC
	
	mov dl,0   ;Col
	mov dh,7   ;Row
	call gotoxy

	mov eax , lightblue + (black * 16)
	call SetTextColor

	mov edx , offset GameMaze
	call WriteString
	mov dl,0   ;Col
	mov dh,7   ;Row

	mov bh , "X"
	mov bl , "G"
	mov edi , 0
	print_maze:
		mov bl , "X"
		cmp GameMaze[edi] , bl
		jne PLayer_not_found
			call gotoxy
			mov eax , white + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]

			call WriteChar
			jmp Out_condition
		Player_not_found:

		mov bh , "G"
		cmp GameMaze[edi] , bh
		jne Ghost_not_found
			call gotoxy
			mov eax , red + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]
			call WriteChar
			jmp out_condition
		Ghost_not_found:
		
		mov bh , "€"
		cmp GameMaze[edi] , bh
		jne Pinky_not_Found
			call gotoxy
			mov eax , lightcyan + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]
			call WriteChar
			jmp out_condition
		Pinky_not_Found:

		mov bh , "+"
		cmp GameMaze[edi] , bh
		jne Power_not_Found
			call gotoxy
			mov eax , Magenta + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]
			call WriteChar
			jmp out_condition
		Power_not_Found:

		mov bh , "."
		cmp GameMaze[edi] , bh
		jne no_do_found
			call gotoxy
			mov eax , LightGray + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]
			call WriteChar
			jmp out_condition
		no_do_found:

		mov bh , "o"
		cmp GameMaze[edi] , bh
		jne no_fruit_found
			call gotoxy
			mov eax , green + (black * 16)
			call SetTextColor
			mov al , GameMaze[edi]
			call WriteChar
			jmp out_condition
		no_fruit_found:



		out_condition:
			add  dl , 1
		cmp GameMaze[edi] , 0ah
		jne no_next_line
			mov dl , 0
			add dh , 1
		no_next_line:
			inc edi
		cmp GameMaze[edi] , 0
		jne print_maze
	ret
DrawMaze ENDP

END main