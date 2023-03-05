# Nodemcu-8266-Starter

## Description

This is my personal starter template to get into fresh 8266 module.
Firmware binary is acquired from http://nodemcu-build.com/, use it with your own risk.

## Usage

1- Prerequisites

- [NodeMCU ESP8266](https://en.wikipedia.org/wiki/NodeMCU)
- [Esptool.py](https://docs.espressif.com/projects/esptool/en/latest/esp8266/index.html)
- [NodeJS](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- Firmware (Optional)

2- Clone

```
git clone https://github.com/dorukolcmener/Nodemcu-8266-Starter.git
```

3- Open with your favourite IDE

```
code Nodemcu-8266-Starter
```

4- Intall npm package

```
npm install
```

5- Connect the board to your computer via USB port and intall the firmware to the board

```
npm run flash-fw
```

4- Compile and run the code on the IoT card.

```
npm run uc
```

## License

[MIT](LICENSE)
