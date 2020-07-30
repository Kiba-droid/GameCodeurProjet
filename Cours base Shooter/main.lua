-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-degub" then require("mobdebug").start() end

  heros = {}

math.randomseed(love.timer.getTime())



-- niveau 10x30
niveau = {}
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 1,1,1,1,3,3,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1})
table.insert(niveau, { 2,2,2,2,2,2,2,2,2,2})
table.insert(niveau, { 0,0,1,1,1,1,1,1,0,0})
table.insert(niveau, { 0,3,1,1,3,3,1,1,3,0})
table.insert(niveau, { 1,1,1,3,2,2,3,1,1,1})
table.insert(niveau, { 1,1,3,2,3,3,2,3,1,1})
table.insert(niveau, { 1,3,2,3,3,3,3,2,3,1})
table.insert(niveau, { 2,2,3,3,3,3,3,3,2,2}) 

-- camera
camera = {}
camera.y = 0
camera.vitesse = 1

-- ecrant courant

ecran_courant = "menu"

function love.load()
  
  love.window.setMode(300, 900)
  love.window.setTitle("Shooter Game")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  DemarreJeu()
  
  
  
end

function DemarreJeu()
  
  -- Listes d'éléments
  liste_sprites = {}
  liste_tirs = {}
  liste_aliens = {}
  
  heros = CreeSprite("Ship1", largeur/2, hauteur/2)
  heros.x = largeur/2
  heros.y = hauteur - ( heros.h*2)
  
  -- creation aliens
  
  local ligne = 4
  
  CreeAlien(1, largeur/2, -(30/2)-(30*(ligne-1)))
  
  ligne = 10
  
  CreeAlien(2, largeur/2, -(30/2)-(30*(ligne-1)))
  
  ligne = 5
  
  CreeAlien(3, largeur/2, -(30/2)-(30*(ligne-1)))
  
  ligne = 9
  
  CreeAlien(3, largeur/2, -(30/2)-(30*(ligne-1)))
  
  ligne = 1
    CreeAlien(10, largeur/2, -(30/2)-(30*(ligne-1)))

  
  -- RAZ caméra
  camera.y = 0
  
end
-- image des tuiles
imgTuiles = {}
local n
for n=1,3 do
imgTuiles[n] = love.graphics.newImage("images/tuile_"..n..".png")
end

-- Images d'explosions

imgExplosion = {}
for n=1,3 do
imgExplosion[n] = love.graphics.newImage("images/explode_"..n..".png")
end

imgMenu = love.graphics.newImage("images/menu.png")
imgGameover = love.graphics.newImage("images/gameover.png")

sonShoot = love.audio.newSource("sons/LaserShoot.wav","static")
sonboom = love.audio.newSource("sons/explode_touch.wav","static")

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

function collide(a1, a2)
  if (a1==a2) then return false end
  local dx = a1.x - a2.x
  local dy = a1.y - a2.y
  if (math.abs(dx) < a1.image:getWidth()/2+a2.image:getWidth()/2) then
    if (math.abs(dy) < a1.image:getHeight()/2+a2.image:getHeight()/2) then
      return true
    end
  end
  return false
end

function CreeTir(pType, pNomImage, pX, pY, pVitesseX, pVitesseY)
    local tir = CreeSprite(pNomImage, pX, pY)
    tir.type = pType
    tir.vx = pVitesseX
    tir.vy = pVitesseY
    table.insert(liste_tirs, tir)
  
    print("fire")
  
    sonShoot:play()
  
end


function CreeAlien(pType, pX, pY)
  
  local nomImage = ""
  if pType == 1 then
    nomImage = "enemy1"

  elseif pType == 2 then
    nomImage = "enemy2"
  
  elseif pType == 3 then
    nomImage = "enemy3"
    
  elseif pType == 10 then
    nomImage = "boss"
    
  end
  
  local alien = CreeSprite(nomImage, pX, pY)
  
  alien.type = pType
  
  alien.endormi = true
  alien.chronotir = 0
  
  if pType == 1 then
    alien.vy = 2
    alien.vx = 0
    alien.energie = 1

  elseif pType == 2 then
    alien.vy = 2
    local direction = math.random(1,100)
    if direction <= 33 then
      alien.vx = 1
    else
      alien.vx = -1
    end
    alien.energie = 2
  if alien.x > largeur then
    alien.vx = 0 - alien.vx
    alien.x = largeur
  end
  if alien.x < 0 then
    alien.vx = 0 - alien.vx
    alien.x = 0
  end
  
  elseif pType == 3 then
    alien.vy = camera.vitesse
    alien.vx = 0
    alien.energie = 5
    
  elseif pType == 10 then
    alien.vx = 0
    alien.vy = camera.vitesse * 2
    alien.energie = 10
    alien.angle = 0
    
  end
  
  table.insert(liste_aliens, alien)

end

function CreeSprite(pNomImage, pX, pY)
  
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprime = false
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.l = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()
  
  sprite.frame = 1 
  sprite.listeFrames = {}
  sprite.maxFrame = 1

  table.insert(liste_sprites, sprite)
  
  return sprite
  
end

function CreeExplosion(pX,pY)
  
  local nouvExplosion = CreeSprite("explode_1",pX,pY)
  nouvExplosion.listeFrames = imgExplosion
  nouvExplosion.maxFrame = 3

end




function updateJeu()
  -- avencer caméra
  camera.y = camera.y + camera.vitesse
  -- deplacement du hero sur axe X de la souris
  heros.x = love.mouse.getX()
  -- traitement des tirs
  local n
  for n=#liste_tirs,1,-1 do
    local tir = liste_tirs[n]
    tir.x = tir.x + tir.vx    
    tir.y = tir.y + tir.vy
    -- vérifie si on touche le heros
    if tir.type == "alien" then
      if collide(heros,tir) then
        print("boom je suis toucher")
        tir.supprime = true
        table.remove(liste_tirs, n)
        ecran_courant = "gameover"
        sonboom:play()
      end
    end
    -- vérifie si on touche l'alien
    if tir.type == "heros" then
      local nAlien
      for nAlien=#liste_aliens,1,-1 do
        local alien = liste_aliens[nAlien]
        if alien.endormi == false then
          if collide(alien,tir) then
            CreeExplosion(tir.x,tir.y)
            alien.energie = alien.energie - 1
            tir.supprime = true
            table.remove(liste_tirs, n)
            sonboom:play()
            if alien.energie <= 0 then
              local nExplosion
              for nExplosion=1,3 do
                CreeExplosion(alien.x + math.random(-20,20), alien.y + math.random(-20,20))
              end
              alien.supprime = true
              table.remove(liste_aliens, nAlien)
            end
          end
        end
      end
    end
    -- vérifier si le tir n'est pas sorti de l'écran
    if (tir.y < 0 or tir.y > hauteur) and tir.supprime == false then
    -- marque le sprite pour le supprimer plus tard
      tir.supprime = true
      table.remove(liste_tirs, n)
    end
  end
  
  -- traitement des aliens
  for n=#liste_aliens,1,-1 do
    local alien = liste_aliens[n]
    if alien.y > 0 then
      alien.endormi = false
    end
    if alien.endormi == false then
      alien.x = alien.x + alien.vx
      alien.y = alien.y + alien.vy
      if alien.type == 1 then
        alien.chronotir = alien.chronotir - 1
        if alien.chronotir <= 0 then
          alien.chronotir = math.random(60,100)
          CreeTir("alien","Elaser1", alien.x, alien.y, 0, 10)
        end
      elseif alien.type == 2 then
        alien.chronotir = alien.chronotir - 1
          if alien.x > largeur then
            alien.vx = 0 - alien.vx
            alien.x = largeur
          end
            if alien.x < 0 then
              alien.vx = 0 - alien.vx
              alien.x = 0
            end
          if alien.chronotir <= 0 then
            alien.chronotir = math.random(60,100)
            CreeTir("alien","Elaser2", alien.x, alien.y, 0, 10)
          end
        elseif alien.type == 3 then
          alien.chronotir = alien.chronotir - 1
          if alien.chronotir <= 0 then
            alien.chronotir = math.random(20,30)
            local vx,vy
            local angle
            angle = math.angle(alien.x,alien.y,heros.x,heros.y)
            vx = 10 * math.cos(angle)
            vy = 10 * math.sin(angle)
            CreeTir("alien","Elaser3", alien.x, alien.y, vx, vy)
          end
        end
    else
      alien.y = alien.y + 1
    end
    if alien.y > hauteur then
      alien.supprime = true
      table.remove(liste_aliens, n)
    end
  end
  
  -- traitement et purge des sprites à supprimer
  for n=#liste_sprites,1,-1 do
    local sprite = liste_sprites[n]
    -- le sprite est il animé ?
    if sprite.maxFrame > 1 then
      sprite.frame = sprite.frame + 0.2
      if math.floor(sprite.frame) > sprite.maxFrame then
        sprite.supprime = true
      else
        sprite.image = sprite.listeFrames[math.floor(sprite.frame)]
      end
    end
    if sprite.supprime == true then
      table.remove(liste_sprites, n)
    end
  end
  
  if love.keyboard.isDown("up") and heros.y >= 0 then
    heros.y = heros.y - 4
  end
  if love.keyboard.isDown("right") and heros.x <= largeur then
    heros.x = heros.x + 4
  end
  if love.keyboard.isDown("down") and heros.y <= hauteur then
    heros.y = heros.y + 4
  end
  if love.keyboard.isDown("left") and heros.x >= 0 then
    heros.x = heros.x - 4
  end
  
end

function updateMenu()
  
end
function love.update(dt)
  
  if ecran_courant == "jeu" then
    updateJeu()
  elseif ecran_courant == "menu" then
    updateMenu()
  end

end
function drawJeu()
   
  love.graphics.line(largeur/2,0,largeur/2,hauteur)
  love.graphics.line(0,hauteur/2,largeur,hauteur/2)
  
  -- dessin du niveau
  
  local nbLignes = #niveau
  local ligne,colonne
  local x,y
  
  x = 0 
  y = ( 0 - 30 ) + camera.y
  
  for ligne=nbLignes,1,-1 do
    for colonne=1,10 do
      -- dessine la tuile
      local tuile = niveau[ligne][colonne]
      if tuile > 0 then
        love.graphics.draw(imgTuiles[tuile], x, y)
      end
      x = x + 30
    end
    x = 0
    y = y - 30
  end
  
  -----------
  
  local n 
  for n=1,#liste_sprites do
    local s = liste_sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end
  
  love.graphics.print("heros.x "..tostring(heros.x).." heros.y "..tostring(heros.y), 1, 1)
  love.graphics.print("heros.l "..tostring(heros.l).." heros.h "..tostring(heros.h), 1, 15)
  love.graphics.print("largeur "..tostring(largeur).." hauteur "..tostring(hauteur), 1, 30)
  love.graphics.print("Nombre de tir "..#liste_tirs.." Nombre de sprite "..#liste_sprites, 1, 45)
  love.graphics.print("Nombre d'aliens "..#liste_aliens, 1, 60)

end
function drawMenu()
  love.graphics.draw(imgMenu,0,0)
end
function drawGameover()
  love.graphics.draw(imgGameover,0,0)
end
function love.draw()
  
  if ecran_courant == "jeu" then
    drawJeu()
  elseif ecran_courant == "menu" then
    drawMenu()
  elseif ecran_courant == "gameover" then
    drawGameover()
  end
  
end

function love.mousepressed( x, y, button, istouch, presses)
  
  print(button)
  if ecran_courant == "jeu" then
    if button == 1 then
      CreeTir("heros","Hlaser1",heros.x, heros.y - (heros.h*2)/2, 0, -10)
    end
  elseif ecran_courant == "menu" then
    if button == 1 then
      ecran_courant = "jeu"
      DemarreJeu()
    end
  elseif ecran_courant == "gameover" then
    if button == 1 then
      ecran_courant = "menu"
    end
  end
end

function love.keypressed(key)
  print(key)
  if ecran_courant == "jeu" then
    DemarreJeu()
    if key == "space" then
      CreeTir("heros","Hlaser1",heros.x, heros.y - (heros.h*2)/2, 0, -10)
    end
  elseif ecran_courant == "menu" then
    if key == "space" then
      ecran_courant = "jeu"
      DemarreJeu()
    end
  elseif ecran_courant == "gameover" then
    if key == "space" then
      ecran_courant = "menu"
    end
  end
  if key == "escape" then
    love.event.quit()
  end
  if key == "p" then
  love.event.clear()
  end
end
