-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
--love.graphics.setDefaultFilter("nearest")

function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
function math.degAngle(x) return 180 + x * 180/math.pi end

hero = {}
hero.x = 0
hero.y = 0
hero.ray = 20
hero.life = true
hero.angle = 270

enemie = {}
enemie.x = 0
enemie.y = 0
enemie.ray = 20
enemie.life = true
enemie.angle = 90

disc = {}
disc.x = 0
disc.y = 0
disc.ray = 15
disc.colle = false
disc.rebond = false
disc.rotation = 0
disc.angle = 0
disc.vx = 0
disc.vy = 0
disc.speed = 5

disc2 = {}
disc2.x = 0
disc2.y = 0
disc2.ray = 15
disc2.colle = false
disc2.rebond = false
disc2.rotation = 0
disc2.angle = 0
disc2.vx = 0
disc2.vy = 0
disc2.speed = 5

ecran_courant = "menu"
-- parametre ecran menu
chrono = false
alphaMenu = 255
DebugOn = false
menuAngle = 0

-- parametre Audio
sonMenu = love.audio.newSource("sonMenu.mp3", "stream")
volumeMenu = 0.1
sonJeu = love.audio.newSource("sonJeu.mp3", "stream")
volumeJeu = 0.1

function drawEllipse(X,Y,angle1,angle2,rayX,rayY)
  
  -- cette fonction sert à dessiné des Ellipses et des cercles de type "line"
  -- par rapport a un angle1 et un angle2 seulement ce qui ce trouve entre l'angle 1 et l'angle 2 sera retranscrit dans un sens comme dans l'autre 
  
  local x,y,xx,yy,sens
  
  sens = 1
  
  if angle1 > angle2 then
    sens = - 1 
  end
  
  for angle=angle1+sens,angle2,sens do
    x = X + rayX * math.cos(math.rad(angle))
    y = Y + rayY * math.sin(math.rad(angle))
    xx = X + rayX * math.cos(math.rad(angle-sens))
    yy = Y + rayY * math.sin(math.rad(angle-sens))
    love.graphics.line(xx,yy,x,y)
  end
  
end

function demarreJeu()
  
  -- reset joueur 1
  hero.x = 250
  hero.y = 500
  hero.life = true
  hero.angle = 269
  disc.colle = true
  disc2.rebond = false
  
  -------------------
  
  -- reset joueur 2
  enemie.x = 250
  enemie.y = 100
  enemie.life = true
  enemie.angle = 90
  disc2.colle = true
  disc2.rebond = false

end
function love.load()
  -- titre de la fenêtre
  love.window.setTitle("Tron : Disc Wars")
  -- logo de la fenêtre
  canvas = love.graphics.newCanvas(32,32)
           love.graphics.setCanvas(canvas)
           love.graphics.setLineWidth(5)
           love.graphics.setColor(0,0,0)
           drawEllipse(16, 16, 0, 360, disc.ray - 4, disc.ray - 4)
           love.graphics.setLineWidth(1)
           love.graphics.setColor(0,1,1)
           drawEllipse(16, 16, 0, 360, disc.ray, disc.ray)
           love.graphics.setLineWidth(1)
           love.graphics.translate(16,16)
           love.graphics.rotate(disc.rotation+math.pi)
           love.graphics.translate(-16, -16)
           drawEllipse(16,16, 20, 340, disc.ray - 5, disc.ray - 5)
           love.graphics.origin()
           love.graphics.setCanvas()
           love.window.setIcon(canvas:newImageData())
  -------------------------------------------------------------------
  demarreJeu()
  
end
function updateMenu(dt)
  
  if chrono == false then
    alphaMenu = alphaMenu - 100 * dt
    if alphaMenu <= 0 then
      alphaMenu = 0
    end
  end
  if chrono == true then
    if alphaMenu <= 255 then
      alphaMenu = alphaMenu + 100 * dt
      if alphaMenu >= 255 then
        alphaMenu = 255
        ecran_courant = "jeu"
        chrono = false
      end
    end
  end
  menuAngle = menuAngle - 120 * dt
  if menuAngle > 90 then
    menuAngle = 0
  end
  if menuAngle < 0 then
    menuAngle = 90 
  end
  ---------------------------
  --reglage des sons
  if volumeMenu >= 1 then
    volumeMenu = 1 
  end
  if volumeMenu <= 0 then
    volumeMenu = 0
  end
  sonJeu:stop()
  sonMenu:setVolume(volumeMenu)
  sonMenu:play()
end
function updateJeu(dt)
  if hero.life == false or enemie.life == false then
    if love.keyboard.isDown("f6") then
      demarreJeu()
    end
  end
  --collision disque/disque
  if math.dist(disc.x,disc.y,disc2.x,disc2.y) <= disc.ray*2+2 then
    -- disqueBleu/disqueRouge
    if math.dist(disc.x,disc.y,disc2.x,disc.y) >= math.dist(disc.x,disc.y,disc.x,disc2.y) then
      disc.vx = (0 - math.cos(math.angle(disc.x,disc.y ,disc2.x,disc2.y))) + math.cos(disc.angle) 
      disc.vy = math.sin(math.angle(disc.x,disc.y ,disc2.x,disc2.y)) - math.sin(disc.angle)
      disc2.vx = (0 - math.cos(math.angle(disc2.x,disc2.y ,disc.x,disc.y))) + math.cos(disc2.angle)
      disc2.vy = math.sin(math.angle(disc2.x,disc2.y ,disc.x,disc.y)) - math.sin(disc2.angle)
    end
    if math.dist(disc.x,disc.y,disc.x,disc2.y) >= math.dist(disc.x,disc.y,disc2.x,disc.y) then
      disc.vy = (0 - math.sin(math.angle(disc.x,disc.y ,disc2.x,disc2.y))) + math.sin(disc.angle)
      disc.vx = math.cos(math.angle(disc.x,disc.y ,disc2.x,disc2.y)) - math.cos(disc.angle)
      disc2.vy = (0 - math.sin(math.angle(disc2.x,disc2.y ,disc.x,disc.y))) + math.sin(disc2.angle)
      disc2.vx = math.cos(math.angle(disc2.x,disc2.y ,disc.x,disc.y)) - math.cos(disc2.angle)
    end
  end
   --------------------------------------------------------------------------------------------------
  if hero.life == true then
    -- deplacement hero
    if love.keyboard.isDown("z") then
      hero.y = hero.y - 240 * dt
    end
    if love.keyboard.isDown("s") then
      hero.y = hero.y + 240 * dt
    end
    if love.keyboard.isDown("q") then
      hero.x = hero.x - 240 * dt
    end
    if love.keyboard.isDown("d") then
      hero.x = hero.x + 240 * dt
    end
    -- diretion hero
    if love.keyboard.isDown("h") then
      hero.angle = hero.angle + 180 * dt
    end
    if love.keyboard.isDown("f") then
      hero.angle = hero.angle - 180 * dt
    end
    -- disque Bleu
    if disc.colle == true then
      disc.x = hero.x
      disc.y = hero.y
      disc.angle = hero.angle
      disc.rotation = math.rad(disc.angle)
      --commande pour tiré le disque
      if love.keyboard.isDown("t") then
        disc.colle = false
        disc.vx = math.cos(math.rad(disc.angle))
        disc.vy = math.sin(math.rad(disc.angle))
      end
    else
      disc.rotation = disc.rotation + 60 * dt
      disc.x = disc.x + disc.vx * disc.speed*dt*60
      disc.y = disc.y + disc.vy * disc.speed*dt*60
    end
    -- rappel du disque vers sois 
    if disc.colle == false then
      if love.keyboard.isDown("g") and (disc.y > 300 or disc.rebond == true) then
          disc.vx = math.cos(math.angle(disc.x,disc.y,hero.x,hero.y))
          disc.vy = math.sin(math.angle(disc.x,disc.y,hero.x,hero.y))
          if math.dist(disc.x,disc.y ,hero.x,hero.y) <= hero.ray and love.keyboard.isDown("g") then
            disc.colle = true
            disc.rebond = false
          end
      end
    end
  elseif hero.life == false then
    
  end
   --------------------------------------------------------------------------------------------------
  if enemie.life == true then
    if love.keyboard.isDown("up") then
      enemie.y = enemie.y - 240 * dt
    end
    if love.keyboard.isDown("down") then
      enemie.y = enemie.y + 240 * dt
    end
    if love.keyboard.isDown("left") then
      enemie.x = enemie.x - 240 * dt
    end
    if love.keyboard.isDown("right") then
      enemie.x = enemie.x + 240 * dt
    end
    if love.keyboard.isDown("kp4") then
      enemie.angle = enemie.angle + 180 * dt
    end
    if love.keyboard.isDown("kp6") then
      enemie.angle = enemie.angle - 180 * dt
    end
    -- disque rouge
    if disc2.colle == true then
      disc2.x = enemie.x
      disc2.y = enemie.y
      disc2.angle = enemie.angle
      disc2.rotation = math.rad(disc2.angle)
        --commande pour tiré le disque
        if love.keyboard.isDown("kp8") then
          disc2.colle = false
          disc2.vx = math.cos(math.rad(disc2.angle))
          disc2.vy = math.sin(math.rad(disc2.angle))
        end
    else
      disc2.rotation = disc2.rotation + 60 * dt
      disc2.x = disc2.x + disc2.vx * disc2.speed*dt*60
      disc2.y = disc2.y + disc2.vy * disc2.speed*dt*60
    end
    if disc2.colle == false then
      if love.keyboard.isDown("kp5") and (disc2.y < 300 or disc2.rebond == true) then
          disc2.vx = math.cos(math.angle(disc2.x,disc2.y,enemie.x,enemie.y))
          disc2.vy = math.sin(math.angle(disc2.x,disc2.y,enemie.x,enemie.y))
          if math.dist(disc2.x,disc2.y ,enemie.x,enemie.y) <= enemie.ray and love.keyboard.isDown("kp5") then
            disc2.colle = true
            disc2.rebond = false
          end
      end
    end
  elseif enemie.life == false then
    
  end
  -------------------------------------------------------------------------------------------------
  -- collision disque/mur
  --disque bleu
  if disc.y + disc.ray >= 588 then
    disc.y = 588 - disc.ray
    disc.vy = 0 - disc.vy
    disc.rebond = true
  end
  if disc.y - disc.ray <= 17 then
    disc.y = 17 + disc.ray
    disc.vy = 0 - disc.vy
    disc.rebond = true
  end
  if disc.x + disc.ray >= 398 then
    disc.x = 398 - disc.ray
    disc.vx = 0 - disc.vx
    disc.rebond = true
  end
  if disc.x - disc.ray <= 102 then
    disc.x = 102 + disc.ray
    disc.vx = 0 - disc.vx
    disc.rebond = true
  end
  ------------------------------------
  --disque rouge
  if disc2.y + disc2.ray >= 588 then
    disc2.y = 588 - disc2.ray
    disc2.vy = 0 - disc2.vy
    disc2.rebond = true
  end
  if disc2.y - disc2.ray <= 17 then
    disc2.y = 17 + disc2.ray
    disc2.vy = 0 - disc2.vy
    disc2.rebond = true
  end
  if disc2.x + disc2.ray >= 398 then
    disc2.x = 398 - disc2.ray
    disc2.vx = 0 - disc2.vx
    disc2.rebond = true
  end
  if disc2.x - disc2.ray <= 102 then
    disc2.x = 102 + disc2.ray
    disc2.vx = 0 - disc2.vx
    disc2.rebond = true
  end
  -------------------------------------
  --collision joueur murs
  if hero.y + hero.ray >= 588 then
    hero.y = 588 - hero.ray
  end
  if hero.y - hero.ray <= 364 then
    hero.y = 364 + hero.ray
  end
  if hero.x + hero.ray >= 398 then
    hero.x = 398 - hero.ray
  end
  if hero.x - hero.ray <= 102 then
    hero.x = 102 + hero.ray
  end
  -------------------------------------
  --collision enemie murs
  if enemie.y + enemie.ray >= 240 then
    enemie.y = 240 - enemie.ray
  end
  if enemie.y - enemie.ray <= 17 then
    enemie.y = 17 + enemie.ray
  end
  if enemie.x + enemie.ray >= 398 then
    enemie.x = 398 - enemie.ray
  end
  if enemie.x - enemie.ray <= 102 then
    enemie.x = 102 + enemie.ray
  end
  -------------------------------------
  -- collision disqueBleu joueurRouge
  if math.dist(disc.x,disc.y,enemie.x,enemie.y) <= enemie.ray+disc.ray+2 then
    enemie.life = false
  end
  -------------------------------------
  -- collision disqueRouge joueurBleu
  if math.dist(disc2.x,disc2.y,hero.x,hero.y) <= hero.ray+disc2.ray+2 then
    hero.life = false
  end
  -----------------------------
  -- reglage des musique
  if volumeJeu >= 1 then
    volumeJeu = 1 
  end
  if volumeJeu <= 0 then
    volumeJeu = 0
  end
  sonMenu:stop()
  sonJeu:setVolume(volumeJeu)
  sonJeu:play()
  
end
function love.update(dt)
  if ecran_courant == "jeu" then
    updateJeu(dt)
  elseif ecran_courant == "menu" then
    updateMenu(dt)
  end
end
function drawJeu()
  love.graphics.setLineWidth(2)
  --dessine le le logo de tron 
  love.graphics.setColor(0,205/255,1)
  love.graphics.printf("    L        E       G         A          C          Y", 476, 89, 251, "center")
  -- dessine TRON
  love.graphics.rectangle("line", 480, 19, 14, 14)
  love.graphics.rectangle("line", 532, 39, 14, 44)
  love.graphics.line(500, 33, 500, 83, 514, 83, 514, 40)
  love.graphics.line(514, 19, 567, 19)
  love.graphics.line(520, 33, 581, 33)
  love.graphics.line(581, 39, 552, 39, 552, 54, 566, 83, 582, 83, 567, 54)
  love.graphics.line(665, 19, 659, 19, 659, 83, 673, 83, 673, 53, 687, 53, 687, 48, 665, 19)
  love.graphics.line(715, 83, 721, 83, 721, 19, 707, 19, 707, 49, 693, 49, 693, 54, 715, 83)
  love.graphics.circle("line", 620, 51, 32)
  love.graphics.circle("line", 620, 51, 16)
  love.graphics.arc("line","open", 514, 33, 14, math.rad(180), math.rad(270))
  love.graphics.arc("line","open", 567, 33, 14, math.rad(270), math.rad(360))
  love.graphics.arc("line","open", 567, 39, 14, math.rad(0), math.rad(90))
  love.graphics.arc("line","open", 522, 41, 8, math.rad(180), math.rad(270))
  ----------------------------------------------------------------------------
  -- zone du terrain de chaque camps
  love.graphics.setColor(0,73/255,81/255)
  love.graphics.rectangle("fill",101,16,298,225)
  love.graphics.rectangle("fill",101,363,298,226)
  -- dessine la grille de jeux
  love.graphics.setColor(0,205/255,1)
  love.graphics.rectangle("line",100,15,300,575)
  drawEllipse(250,60,185,355,150,45)
  drawEllipse(250,545,175,5,150,45)
  -- desine les limite au millieux du terrain de chaque camps
  love.graphics.line(100,242,400,242)
  love.graphics.line(100,362,400,362)
  love.graphics.setColor(1,1,1)
  ----------------------------------------------------------------------------
  -- instrution coté droit de l'écran
  love.graphics.setColor(1,0,0)
  love.graphics.printf("Flèches directionnelles pour se deplacer '8' pour lancer son disque '5' pour le reprendre après un rebond '4','6'pour changer l'angle de tir", 450, 175, 300,"center")
  love.graphics.setColor(0,1,1)
  love.graphics.printf("'Z','Q','S','D' pour ce déplacer 'T' pour lancer son disque 'G' pour le reprendre après un rebond 'F','H'pour changer l'angle de tir", 450, 400, 300,"center")
  ----------------------------------------------------------------------------
  if hero.life == false then
  love.graphics.setColor(1,0,0)
  love.graphics.printf("JOUEUR 2 WIN !",200,250,100,"center")
  love.graphics.printf("APPUYEZ SUR F6 POUR RECHARGER LA PARTIE",450,295,300,"center")
  end
  if enemie.life == false then
  love.graphics.setColor(0,1,1)
  love.graphics.printf("JOUEUR 1 WIN !",200,340,100,"center")
  love.graphics.printf("APPUYEZ SUR F6 POUR RECHARGER LA PARTIE",450,295,300,"center")
  end
  ----------------------------------------------------------------------------
  --dessine le hero
  love.graphics.setLineWidth(5)
  love.graphics.setColor(0,0,0)
  drawEllipse(hero.x, hero.y, 0, 360, hero.ray - 4, hero.ray - 4)
  -- parti bleu
  love.graphics.setLineWidth(1)
  love.graphics.setColor(0,1,1)
  -- disque exterieur 
  love.graphics.translate(hero.x, hero.y)
  love.graphics.rotate(math.rad(hero.angle))
  love.graphics.translate(-hero.x, -hero.y)
  love.graphics.setColor(0,0,0)
  drawEllipse(hero.x, hero.y, 0, 360, hero.ray, hero.ray)
  love.graphics.setColor(0,1,1)
  drawEllipse(hero.x, hero.y, 20, 340, hero.ray, hero.ray)
  love.graphics.origin()
  -- disque interieur
  love.graphics.setLineWidth(1)
  drawEllipse(hero.x,hero.y, 0, 360, hero.ray - 5, hero.ray - 5)
  
  ----------------------------------------------------------------------------
  -- dessine enemie
  love.graphics.setLineWidth(5)
  love.graphics.setColor(0,0,0)
  drawEllipse(enemie.x, enemie.y, 0, 360, enemie.ray - 4, enemie.ray - 4)
  -- parti bleu
  love.graphics.setLineWidth(1)
  love.graphics.setColor(1,0,0)
  -- disque exterieur 
  love.graphics.translate(enemie.x, enemie.y)
  love.graphics.rotate(math.rad(enemie.angle))
  love.graphics.translate(-enemie.x, -enemie.y)
  love.graphics.setColor(0,0,0)
  drawEllipse(enemie.x, enemie.y, 0, 360, enemie.ray, enemie.ray)
  love.graphics.setColor(1,0,0)
  drawEllipse(enemie.x, enemie.y, 20, 340, enemie.ray, enemie.ray)
  love.graphics.origin()
  -- disque interieur
  love.graphics.setLineWidth(1)
  drawEllipse(enemie.x,enemie.y, 0, 360, enemie.ray - 5, enemie.ray - 5)
  ----------------------------------------------------------------------------
  -- dessine disc joueur
  love.graphics.setLineWidth(5)
  love.graphics.setColor(0,0,0)
  drawEllipse(disc.x, disc.y, 0, 360, disc.ray - 4, disc.ray - 4)
  -- parti bleu
  love.graphics.setLineWidth(1)
  love.graphics.setColor(0,1,1)
  -- disque exterieur 
  drawEllipse(disc.x, disc.y, 0, 360, disc.ray, disc.ray)
  -- disque interieur
  love.graphics.setLineWidth(1)
  love.graphics.translate(disc.x, disc.y)
  love.graphics.rotate(disc.rotation+math.pi)
  love.graphics.translate(-disc.x, -disc.y)
  drawEllipse(disc.x,disc.y, 20, 340, disc.ray - 5, disc.ray - 5)
  love.graphics.origin()
  -----------------------------------------------------------------------------
  -- dessine disc 2
  love.graphics.setLineWidth(5)
  love.graphics.setColor(0,0,0)
  drawEllipse(disc2.x, disc2.y, 0, 360, disc2.ray - 4, disc2.ray - 4)
  -- parti rouge
  love.graphics.setLineWidth(1)
  love.graphics.setColor(1,0,0)
  -- disque exterieur 
  drawEllipse(disc2.x, disc2.y, 0, 360, disc2.ray, disc2.ray)
  -- disque interieur
  love.graphics.setLineWidth(1)
  love.graphics.translate(disc2.x, disc2.y)
  love.graphics.rotate(disc2.rotation+math.pi)
  love.graphics.translate(-disc2.x, -disc2.y)
  drawEllipse(disc2.x,disc2.y, 20, 340, disc2.ray - 5, disc2.ray - 5)
  love.graphics.origin()
  love.graphics.setColor(0,1,1)
  love.graphics.printf("FG002, 2nd Edition Ver.2.31",599,586,200,"right")
  love.graphics.setColor(1,1,1)
end
function drawMenu()
  love.graphics.setLineWidth(2)
  love.graphics.setColor(0,205/255,1)
  --dessine le le logo de tron 
  love.graphics.printf("    L        E       G         A          C          Y", 276, 214, 251, "center")
  love.graphics.rectangle("line", 280-(alphaMenu*2), 144+(alphaMenu/4), 14, 14)
  love.graphics.rectangle("line", 332+alphaMenu, 164-alphaMenu, 14, 44)
  love.graphics.line(300, 33+125-(alphaMenu*2), 300, 83+125-(alphaMenu*2), 314, 83+125-(alphaMenu*2), 314, 40+125-(alphaMenu*2))
  love.graphics.line(314, 19+125-(alphaMenu*2), 367, 19+125-(alphaMenu*2))
  love.graphics.line(320, 33+125-(alphaMenu*2), 381, 33+125-(alphaMenu*2))
  love.graphics.line(381-(alphaMenu/3), 39+125+(alphaMenu*3), 352-(alphaMenu/3), 39+125+(alphaMenu*3),
    352-(alphaMenu/3), 54+125+(alphaMenu*3), 366-(alphaMenu/3), 83+125+(alphaMenu*3), 382-(alphaMenu/3),
    83+125+(alphaMenu*3), 367-(alphaMenu/3), 54+125+(alphaMenu*3))
  
  love.graphics.line(465, 19+125-alphaMenu, 459, 19+125-alphaMenu, 459, 83+125-alphaMenu, 473, 83+125-alphaMenu, 473, 
    53+125-alphaMenu, 487, 53+125-alphaMenu, 487, 48+125-alphaMenu, 465, 19+125-alphaMenu)
  
  love.graphics.line(515+(alphaMenu*2), 83+125, 521+(alphaMenu*2), 83+125, 521+(alphaMenu*2), 19+125, 507+(alphaMenu*2), 19+125, 
    507+(alphaMenu*2), 49+125, 693-200+(alphaMenu*2), 49+125, 693-200+(alphaMenu*2), 54+125, 715-200+(alphaMenu*2), 83+125)
  
  love.graphics.circle("line", 420+(alphaMenu*3), 51+125+(alphaMenu*3), 32)
  love.graphics.circle("line", 420-(alphaMenu*3), 51+125-(alphaMenu*3), 16)
  love.graphics.arc("line","open", 314, 158-(alphaMenu*2), 14, math.rad(180), math.rad(270))
  love.graphics.arc("line","open", 367, 158-(alphaMenu*2), 14, math.rad(270), math.rad(360))
  love.graphics.arc("line","open", 367-(alphaMenu/3), 164+(alphaMenu*3), 14, math.rad(0), math.rad(90))
  love.graphics.arc("line","open", 322, 166-(alphaMenu*2), 8, math.rad(180), math.rad(270))
  love.graphics.printf("APPUYEZ SUR ESPACE", 276, 300+(alphaMenu*2), 251, "center")
  
  drawEllipse(400,love.graphics.getHeight(),0,360,0,200)
  drawEllipse(100,love.graphics.getHeight(),90,270,60,173)
  drawEllipse(700,love.graphics.getHeight(),-90,90,60,173)
  drawEllipse(200,love.graphics.getHeight(),90,270,50,188)
  drawEllipse(600,love.graphics.getHeight(),-90,90,50,188)
  drawEllipse(300,love.graphics.getHeight(),90,270,30,197)
  drawEllipse(500,love.graphics.getHeight(),-90,90,30,197)
  drawEllipse(love.graphics.getWidth()/2,love.graphics.getHeight(),0,360,600,200)
  drawEllipse(love.graphics.getWidth()/2,love.graphics.getHeight(),180,360,600,math.sin(math.rad(menuAngle))*200)
  love.graphics.setColor(0,0,0,alphaMenu/255)
  love.graphics.rectangle("fill",0,0,800,600)
  love.graphics.setColor(1,1,1)
end
function love.draw()
  if ecran_courant == "jeu" then
    drawJeu()
  elseif ecran_courant == "menu" then
    drawMenu()
  end
  -- debug
  if DebugOn then
    love.graphics.print("Debug", 0, 0)
    love.graphics.setColor(0,0,1)
    love.graphics.print("Hero X: "..math.floor(hero.x).."/  Y : "..math.floor(hero.y), 0, 15)
    love.graphics.print("Position disc bleu X: "..math.floor(disc.x).."/  Y : "..math.floor(disc.y), 0, 30)
    love.graphics.print("Angle Disc1/2 : "..math.floor(math.degAngle(math.angle(disc.x,disc.y ,disc2.x,disc2.y))), 0, 45)
    love.graphics.setColor(1,0,0)
    love.graphics.print("X : "..tostring(math.floor(disc.x+math.cos(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2)))..
      "/ Y : "..tostring(math.floor(disc.y+math.sin(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2))), 0, 60)
    love.graphics.line(disc.x,disc.y,disc.x+disc.vx*(disc.ray*2),disc.y+disc.vy*(disc.ray*2))
    love.graphics.print("Distance/2 : "..math.floor(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2),0,75)
    love.graphics.line(disc.x,disc.y,
      disc.x+math.cos(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2),
      disc.y+math.sin(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2))
    love.graphics.setColor(1,1,1)
    
    love.graphics.setColor(1,0,0)
    love.graphics.line(disc.x,disc.y,disc.x,disc2.y)
    love.graphics.print("SIN : "..math.floor(math.dist(disc.x,disc.y,disc.x,disc2.y)),0,90)
    love.graphics.setColor(0,0,1)
    love.graphics.line(disc.x,disc.y,disc2.x,disc.y)
    love.graphics.print("COS : "..math.floor(math.dist(disc.x,disc.y,disc2.x,disc.y)),0,105)
    love.graphics.setColor(1,1,1)
    
    love.graphics.line(disc.x,disc.y,disc.x+(math.cos(disc.vx)*disc.ray),disc.y)
    love.graphics.line(disc.x,disc.y,disc.x,disc.y+(math.sin(disc.vy)*disc.ray))
    
    love.graphics.translate(disc.x+math.cos(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2)
      ,disc.y+math.sin(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2))
    love.graphics.rotate(math.angle(disc.x,disc.y ,disc2.x,disc2.y))
    love.graphics.line(0,10,0,-10)
    love.graphics.translate(-disc.x+math.cos(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2)
      ,-disc.y+math.sin(math.angle(disc.x,disc.y,disc2.x,disc2.y))*(math.dist(disc.x,disc.y,disc2.x,disc2.y)/2))
    love.graphics.origin()
    
    love.graphics.print("VX : "..math.cos(disc.vx).." / VY : "..math.sin(disc.vy), 0, 120)
  end
end

function love.keypressed(pKey)
  if ecran_courant == "menu" then
    if pKey == "escape" then
      love.event.quit()
    elseif pKey == "space" then
      demarreJeu()
      chrono = true
      else
        chrono = false
    end 
    if pKey == "f8" then
      volumeMenu = volumeMenu + 0.1
    elseif pKey == "f7" then
      volumeMenu = volumeMenu - 0.1
    end
  elseif ecran_courant == "jeu" then
    if pKey == "escape" then
      ecran_courant = "menu"
    elseif pKey == "f8" then
      volumeJeu = volumeJeu + 0.1
    elseif pKey == "f7" then
      volumeJeu = volumeJeu - 0.1
    end
  end
  if pKey == "f12" and DebugOn == false then
    DebugOn = true
  elseif pKey == "f12" and DebugOn == true then
    DebugOn = false
  end
  print(pKey)
end

function love.mousepressed(x,y,bouton)
  if ecran_courant == "jeu" then
  print(x,y,bouton)
  end
end
