function love.load()
    grid={
        tileWidth=20,
        tileHeight=20
    }

    local w,h=love.graphics.getDimensions()
    grid.width=w/grid.tileWidth
    grid.height=h/grid.tileHeight

    snake=require("snake")
    snake:init()
end

function love.update(dt)
    snake:update(dt)
end

function love.draw()
    love.graphics.setColor(0.1,0.3,0.6,1)
    for y=0,grid.height-1 do
        for x=0,grid.width-1 do
            love.graphics.rectangle("line",x*grid.tileWidth,y*grid.tileHeight,grid.tileWidth,grid.tileHeight)
        end
    end
    snake:draw()
end