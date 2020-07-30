-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")
-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-degub" then require("mobdebug").start() end
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
local myGame = require("game")
function love.load()
  love.window.setMode(1024,736)
  love.window.setTitle("Atelier : Tilemaps, déplacements et collisions + Bonus : Brouillard de guerre !")
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  myGame.load()
end
function love.update(dt)
  myGame.update(dt)
end
function love.draw()
  myGame.draw()
end
function love.keypressed(key)
  print(key)
  if (key == "escape") then love.event.push('quit') end
end