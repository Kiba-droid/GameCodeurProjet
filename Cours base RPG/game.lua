local Game = {}
Game.Map = {}
Game.Map.Grid =  {
              {1, 1, 1, 1, 1, 1, 1, 1, 1, 12, 1, 7, 1, 1, 1, 1, 1, 1, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 12, 1, 2, 5, 5, 5, 2, 1, 1, 7, 1, 1, 12, 1, 8, 1, 1, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 2, 5, 5, 5, 5, 5, 2, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 2, 5, 5, 5, 5, 5, 2, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 8, 4, 4, 4, 4, 4, 4},
              {1, 1, 12, 1, 2, 5, 5, 5, 2, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 12, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 1, 1, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1, 1, 12, 1, 1, 1, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4},
              {1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4},
              {1, 8, 1, 1, 1, 1, 1, 1, 7, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3},
              {1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
              {1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10},
              {1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 9, 9},
              {7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 9, 9, 9},
              {1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12, 1, 1, 8, 1, 1, 1, 1, 1, 10, 9, 9, 9, 9, 9},
              {1, 1, 1, 1, 7, 1, 1, 1, 1, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 10, 9, 9, 9, 9, 9, 9},
              {1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 9, 9, 9, 9, 9, 9, 9},
              {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 10, 9, 9, 9, 9, 9, 9, 9},
              {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 10, 9, 9, 9, 9, 9, 9, 9},
              {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 9, 9, 9, 9, 9, 9, 9},
              {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 9, 9, 9, 9, 9, 9},
              {6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10, 10, 9, 9, 9, 9},
              {6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10, 9, 9, 9}
            }
Game.Map.FogGrid = {}
Game.Map.MAP_WIDTH = 32
Game.Map.MAP_HEIGHT = 23
Game.Map.TILE_WIDTH = 32
Game.Map.TILE_HEIGHT = 32
Game.TileSheet = nil
Game.TileTextures = {}
Game.TileTypes = {}
Game.Hero = require("hero")
function Game.Map.isSolid(pID)
  local TileType = Game.TileTypes[pID]
    if TileType == "pommier" or 
       TileType == "obsidienne" or
       TileType == "roche" or
       TileType == "eau foncé" or
       TileType == "lave" then
      return true
    end
  return false
end
function Game.load()
  print("Game:Chargement des Texture. . .")
  Game.TileSheet = love.graphics.newImage("images/tilesheet01.png")
  local nbColumns = Game.TileSheet:getWidth() / Game.Map.TILE_WIDTH
  local nbLines = Game.TileSheet:getHeight() / Game.Map.TILE_HEIGHT
  Game.TileTextures[0] = nil
  local l,c
  local id = 1
  for l=1,nbLines do
    for c=1,nbColumns do
      Game.TileTextures[id] = love.graphics.newQuad(
        (c-1)*Game.Map.TILE_WIDTH, 
        (l-1)*Game.Map.TILE_HEIGHT,
        Game.Map.TILE_WIDTH,
        Game.Map.TILE_HEIGHT,
        Game.TileSheet:getWidth(),
        Game.TileSheet:getHeight()
        )
      id = id +1
    end
  end
  Game.TileTypes[1] = "herbe"
  Game.TileTypes[2] = "herbe foncé"
  Game.TileTypes[3] = "sable"
  Game.TileTypes[4] = "sable foncé"
  Game.TileTypes[5] = "eau"
  Game.TileTypes[6] = "eau foncé"
  Game.TileTypes[7] = "gravier"
  Game.TileTypes[8] = "roche"
  Game.TileTypes[9] = "lave"
  Game.TileTypes[10] = "obsidienne"
  Game.TileTypes[11] = "teste01"
  Game.TileTypes[12] = "pommier"
  Game.TileTypes[13] = "teste02"
  Game.TileTypes[14] = "teste03"
  print("Game:Chargement des Texture terminer. . .")
  print("creaction brouillare de guerre")
  Game.Map.FogGrid = {}
  local c,l
  for l=1,Game.Map.MAP_HEIGHT do
    Game.Map.FogGrid[l] = {}
    for c=1,Game.Map.MAP_WIDTH do
      Game.Map.FogGrid[l][c] = 1
    end
  end
  print("fin de creaction brouillare de guerre")
  Game.Map.ClearFog2(Game.Hero.line,Game.Hero.column)
end
function Game.update(dt)
  Game.Hero.update(Game.Map, dt)
end
function Game.Map.ClearFog(pLine, pCol)
  print("Clear Fog")
  local c,l
  for l=pLine-1,pLine+1 do
    for c=pCol-1,pCol+1 do
      if c>0 and c<=Game.Map.MAP_WIDTH and l>0 and l<=Game.Map.MAP_HEIGHT then
        Game.Map.FogGrid[l][c] = 0
      end
    end
  end
end
function Game.Map.ClearFog2(pLine, pCol)
  print("Clear fog ver2 !")
  local c,l
  for l=1,Game.Map.MAP_HEIGHT do
    for c=1,Game.Map.MAP_WIDTH do
      if c>0 and c<=Game.Map.MAP_WIDTH and l>0 and l<=Game.Map.MAP_HEIGHT then
        local dist = math.dist(c,l,pCol,pLine)
        if dist < 10 then
          local alpha = dist / 5
          if Game.Map.FogGrid[l][c] > alpha then
          Game.Map.FogGrid[l][c] = alpha
          end
        end
      end
    end
  end
end
function Game.draw()
  local c,l
  for l=1,Game.Map.MAP_HEIGHT do
    for c=1,Game.Map.MAP_WIDTH do
      local id = Game.Map.Grid[l][c]
      local texQuad = Game.TileTextures[id]
      if texQuad ~= nil then
        local x = (c-1)*Game.Map.TILE_WIDTH
        local y = (l-1)*Game.Map.TILE_HEIGHT
        love.graphics.draw(Game.TileSheet, texQuad, x, y)
        if Game.Map.FogGrid[l][c] > 0 then
          love.graphics.setColor(0,0,0, 255*Game.Map.FogGrid[l][c]/255)
          love.graphics.rectangle("fill", x, y, Game.Map.TILE_WIDTH, Game.Map.TILE_HEIGHT)
          love.graphics.setColor(255,255,255)
        end
      end
    end
  end
  Game.Hero.draw(Game.Map)
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    local col = math.floor(x / Game.Map.TILE_WIDTH) + 1
    local lig = math.floor(y / Game.Map.TILE_HEIGHT) + 1
  if col>0 and col<=Game.Map.MAP_WIDTH and lig>0 and lig<=Game.Map.MAP_HEIGHT then
    local id = Game.Map.Grid[lig][col]
      love.graphics.print("Type de Textures:"..tostring(Game.TileTypes[id]).."("..tostring(id)..")".. 1, 1)
  else
    love.graphics.print("ERROR404", Game.Map.MAP_WIDTH/2, Game.Map.MAP_HEIGHT/2)
  end
end
return Game