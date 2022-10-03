from configparser import ConfigParser
import csv
import math

ini_obj = ConfigParser()
ini_obj.read('cameras.ini')

# camList = []

# for i in ini_obj:
#     if i != 'DEFAULT':
#         current_cam = ini_obj[i]
        
#         print("{0}            = {1}".format(i, '{}'))
#         print("{0}.name       = '{1}'".format(i, current_cam['Name']))
#         print("{0}.color      = Color.fromHexString('{1}')".format(i, current_cam['MainColor']))
#         print("{0}.background = Color.fromHexString('{1}')".format(i, current_cam['BGColor']))
#         print("{0}.bus        = {1}".format(i, current_cam['Bus']))
#         print()

#         camList.append(i)

# print("local cameraData = {}")
# for i in camList:
#     print("table.insert(cameraData, {0})".format(i))

ini_obj.read('config.ini')
resize_text = ini_obj['Buttons']['AutoResizeText'].lower() == 'true'
if resize_text:
    print("Auto Resize Text enabled")
else:
    print("Auto Resize Text disabled")

# 3-4 chars     16
# 5             14
# 6             12
# 7             9
# y = - 0.175 x^2 + 18
def calculateFontSize(charLen):
    return math.floor(-.175 * math.pow(charLen, 2) + 18.5)

# AddChannel('Host',      buttonColors.Magenta,   1,   14, 1, 17)
channelsFile = open('channels.csv', newline='')
channels = csv.reader(channelsFile, delimiter=',', skipinitialspace=True)
curChannel = next(channels, -1)
fontSize = 0
while curChannel != -1:
    if channels.line_num > 1:
        if resize_text:
            fontSize = calculateFontSize(len(curChannel[0]))
        else:
            fontSize = 10
        print("AddChannel('{0}', buttonColors.{1}, {2}, {3}, {4}, {5})".format(curChannel[0], curChannel[1], curChannel[2], str(fontSize), curChannel[3], curChannel[4]))
    curChannel = next(channels, -1)