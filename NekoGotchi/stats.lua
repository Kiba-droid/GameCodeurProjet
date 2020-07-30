stats = {}

stats.sleep = 100
stats.play = 100
stats.eat = 100
stats.drink = 100
stats.like = 100
stats.poop = 0

function stats.load()

end

function stats.update(dt)
  
  if stats.sleep >= 100 then
    stats.sleep = 100
  end
  if stats.sleep < 0 then
    stats.sleep = 0
  end
  
  if stats.play >= 100 then
    stats.play = 100
  end
  if stats.play < 0 then
    stats.play = 0
  end
  
  if stats.eat >= 100 then
    stats.eat = 100
  end
  if stats.eat < 0 then
    stats.eat = 0
  end
  
  if stats.drink >= 100 then
    stats.drink = 100
  end
  if stats.drink < 0 then
    stats.drink = 0
  end
  
  if stats.like >= 100 then
    stats.like = 100
  end
  if stats.like < 0 then
    stats.like = 0
  end
  
  if stats.poop >= 100 then
    stats.poop = 100
  end
  if stats.poop < 0 then
    stats.poop = 0
  end
  
  if temps[2] == 00 and temps[1] == 00 then
    stats.sleep = stats.sleep - 2
    stats.drink = stats.drink - 5
    stats.eat = stats.eat - 2
  end
  
  if temps[3] == 10 and temps[2] == 00 and temps[1] == 00 or
      temps[3] == 13 and temps[2] == 00 and temps[1] == 00 or
        temps[3] == 17 and temps[2] == 00 and temps[1] == 00 or
          temps[3] == 20 and temps[2] == 00 and temps[1] == 00 then
    stats.eat = stats.eat - 7
  end
  
  if stats.sleep <= 100 and modeNuit.drawNuit == true then
    if temps[2] == 00 and temps[1] == 00 or
        temps[2] == 30 and temps[1] == 00 then
          stats.sleep = stats.sleep + 4
    end
  end
  
end

function stats.draw()
  
end

return stats
