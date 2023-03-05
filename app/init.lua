-- ******************************************                            Initialize GPIO
pin = 0
gpio.mode(pin,gpio.OUTPUT)
gpio.write(pin,1)

-- ******************************************                            Helper Functions
function toggleLed()
    if (gpio.read(pin) == 1) then
        gpio.write(pin,0)
    else
        gpio.write(pin,1)
    end
end

function sendResponse(res, code, body)
    res:send(nil, code)
    res:send_header("Connection", "close")
    res:send("<html><head><title>ESP8266</title></head><body><h1>ESP8266</h1>")
    res:send(body)
    res:send("</body></html>")
    res:finish()
end

-- ******************************************                            Connect to wifi
-- Connect to wifi named Rivendell
wifi.setmode(wifi.STATION)
-- Sta wifi config
station_cfg={}
station_cfg.ssid="Secret Wifi"
station_cfg.pwd="Secret Password"
station_cfg.save=false
station_cfg.auto=true
wifi.sta.config(station_cfg)
-- Set hostname
if (wifi.sta.sethostname("esp8266") == true) then
    print("hostname was successfully changed")
else
    print("hostname was not changed")
end
-- Light led on connect
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
    gpio.write(pin,0)
end)

-- ******************************************                            Create httpserver
require("httpserver").createServer(80, function(req, res)
    -- If request url is / then send index.html
    if req.url == "/" then
        body = "<p>Hostname: " .. wifi.sta.gethostname() .. "</p><p>IP: " .. wifi.sta.getip() .. "</p>"
        sendResponse(res, 200, body)
    
    -- If request url is /toggle then toggle led
    elseif req.url == "/toggle" then
        toggleLed()
        sendResponse(res, 200, "<p>Toggled led.</p>")
    
    -- Send 404
    else
        sendResponse(res, 404, "<p>404 Not Found</p>")
    end
end)