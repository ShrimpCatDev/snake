local snake={}

function snake:init()
    self.head = {x=grid.width/2, y=grid.height/2}
    self.tail={}
    self.length = 6

    self.speed = 0.5
    self.time = 0
    self.direction=1
end

function snake:update(dt)
    self.time = self.time + dt
    if self.time > self.speed then
        self.time=0

        table.insert(self.tail,1,{x=self.head.x,y=self.head.y})

        if #self.tail>self.length then
            table.remove(self.tail,#self.tail)
        end

        if self.direction==1 then
            self.head.x=self.head.x+1
        elseif self.direction==2 then
            self.head.x=self.head.x-1
        elseif self.direction==3 then
            self.head.y=self.head.y+1
        elseif self.direction==4 then
            self.head.y=self.head.y-1
        end

        if self.head.y>=grid.height then
            self.head.y=0
        elseif self.head.y<0 then
            self.head.y=grid.height-1
        end

        if self.head.x>=grid.width then
            self.head.x=0
        elseif self.head.x<0 then
            self.head.x=grid.width-1
        end
    end

    for k,v in pairs(self.tail) do
        if v.x==self.head.x and v.y==self.head.y then
            gameover=true
        end
    end
end

function snake:draw()
    for k,v in pairs(self.tail) do
        love.graphics.setColor(0.3, 0.8, 0.2)
        love.graphics.rectangle("fill", v.x * grid.tileWidth, v.y * grid.tileHeight, grid.tileWidth, grid.tileHeight)
    end

    love.graphics.setColor(0.4, 1, 0.1)
    love.graphics.rectangle("fill", self.head.x * grid.tileWidth, self.head.y * grid.tileHeight, grid.tileWidth, grid.tileHeight)
end

function snake:key(key)
    if key=="up" then
        self.direction=4
    elseif key=="down" then
        self.direction=3
    elseif key=="left" then
        self.direction=2
    elseif key=="right" then
        self.direction=1
    end
end

return snake