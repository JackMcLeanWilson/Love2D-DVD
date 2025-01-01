function love.load()

	--Fonts 
	Font = love.graphics.newImageFont("assets/Pixelfont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")

	love.graphics.setFont(Font)

	DisplayText = ""

	--Sprites 
	DVDSprite = love.graphics.newImage("assets/DVDlogo/LogoW.png")

	--Audio
	SoundHit = love.audio.newSource("assets/Sound/hit.wav", "static") --Loads into memory, DONT LOAD LARGE SOUNDS INTO MEMORY

	-- Position
	Xpos = 100
	Ypos = 50

	-- Velocity
	DX = 40
	DY = 60

	-- Dimensions
	Width = 173
	Height = 76

	-- Multiplier
	SpeedMult = 2

	-- Colour
	SpriteColor = {1, 1, 1, 1}
	
end

function love.update(dt)

	-- Position Update
	Xpos = Xpos  + (DX * dt * SpeedMult)
	Ypos = Ypos + (DY * dt * SpeedMult)

	-- Rectangle Bounds Check
	if (Xpos > 600 - Width) or (Xpos < 0) then
		DX = -DX
		print("New DX: " .. tostring(DX))
		RandomColor()
		love.graphics.setColor(SpriteColor)
		SoundHit:play()
	end
	if (Ypos > 600 - Height) or (Ypos < 0) then
		DY = -DY
		print("New DY: " .. tostring(DY))
		RandomColor()
		love.graphics.setColor(SpriteColor)
		SoundHit:play()
	end

	-- User Input
	if love.keyboard.isDown("up") and SpeedMult ~= 4 then --Speed Up
		SpeedMult = 4
		print("New mult: " .. tostring(SpeedMult))
		DisplayText = "Fast Speed!"
	elseif love.keyboard.isDown("down") and SpeedMult ~= 1 then  -- Speed Down
		SpeedMult = 1
		print("New mult: " .. tostring(SpeedMult))
	elseif love.keyboard.isDown("r") and SpeedMult ~= 2 then -- Reset Speed 
		SpeedMult = 2
		print("Mult Reset")
	elseif love.keyboard.isDown("q") then  --Reset Position
		Xpos = 100 
		Ypos = 100
	end
end

function love.draw()
	love.graphics.setColor(SpriteColor)
	love.graphics.draw(DVDSprite, Xpos, Ypos, 0, Width / DVDSprite:getWidth(), Height / DVDSprite:getHeight())

	if DisplayText ~= "" then
		love.graphics.printf(DisplayText, 0, 50, 600, "center")
	end
end

function RandomColor()
	SpriteColor[1] = math.random()
    SpriteColor[2] = math.random()
    SpriteColor[3] = math.random()
end
