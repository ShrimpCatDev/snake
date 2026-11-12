local apple={}

function apple:init()
    self.x=math.random(0,grid.width-1)
    self.y=math.random(0,grid.height-1)
end

function apple:update(dt)
    if apple.x==snake.head.x and apple.y==snake.head.y then
        self.x=math.random(0,grid.width-1)
        self.y=math.random(0,grid.height-1)
        snake.length=snake.length+1
        score=score+1
    end
end

function apple:draw()
    love.graphics.setColor(1, 0.2, 0.4)
    love.graphics.rectangle("fill", self.x * grid.tileWidth, self.y * grid.tileHeight, grid.tileWidth, grid.tileHeight)
end

return apple