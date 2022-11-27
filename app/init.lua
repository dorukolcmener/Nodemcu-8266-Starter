pin = 0
pin2 = 8

gpio.mode(pin,gpio.OUTPUT)
gpio.mode(pin2,gpio.OUTPUT)

tobj = tmr.create()
tobj2 = tmr.create()

tobj:alarm(1000,tmr.ALARM_AUTO,function() 
    -- print("alarm 1")
    if gpio.read(pin) == 0 then
        gpio.write(pin,1)
    else
        gpio.write(pin,0)
    end
end)

tobj2:alarm(200,tmr.ALARM_AUTO,function() 
    -- print("alarm 2")
    if gpio.read(pin2) == 0 then
        gpio.write(pin2,1)
    else
        gpio.write(pin2,0)
    end
end)