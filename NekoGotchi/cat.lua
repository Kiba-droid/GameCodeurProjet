-- le petit chat a s'occupée 
cat = {}
cat.frame = 1
cat.images = {}
cat.x = 124
cat.y = 156



function cat.load()
  
  cat.images[1] = love.graphics.newQuad(0,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[2] = love.graphics.newQuad(84,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[3] = love.graphics.newQuad(168,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[4] = love.graphics.newQuad(252,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[5] = love.graphics.newQuad(336,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[6] = love.graphics.newQuad(420,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  cat.images[7] = love.graphics.newQuad(504,616,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
end

function cat.update(dt)
  
  cat.frame = cat.frame + 2*dt
  if cat.frame >= 3 + 1 then
    cat.frame = 1
  end
  
end

function cat.draw()
  
  local frameArrondie = math.floor(cat.frame)
  love.graphics.draw(TileSheetNG, cat.images[frameArrondie], cat.x, cat.y)
  
end

return cat