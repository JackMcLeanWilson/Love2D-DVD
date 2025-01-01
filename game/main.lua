function love.load()
	x = 100
	y = 50
end

function love.update(dt)
	if x < 600 then
		x = x + 100 * dt
	end
end

function love.draw()
	love.graphics.rectangle("fill", x, y, 200, 150)
end
