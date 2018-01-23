# -*- coding: UTF-8 -*-

from math import radians, cos, sin, asin, sqrt

# Python计算地图上两点经纬度间的距离
def haversine(lon1, lat1, lon2, lat2):  # 经度1，纬度1，经度2，纬度2 （十进制度数）
    """
    Calculate the great circle distance between two points
    on the earth (specified in decimal degrees)
    """
    # 将十进制度数转化为弧度
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])

    # haversine公式
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
    c = 2 * asin(sqrt(a))
    r = 6371  # 地球平均半径，单位为公里
    return c * r * 1000



# 判断一个指定的经纬坐标是否落在一个多边形区域内？
def IsPtInPoly(aLon, aLat, pointList):
    '''''
    :param aLon: double 经度
    :param aLat: double 纬度
    :param pointList: list [(lon, lat)...] 多边形点的顺序需根据顺时针或逆时针，不能乱
    '''

    iSum = 0
    iCount = len(pointList)

    if (iCount < 3):
        return False

    for i in range(iCount):

        pLon1 = pointList[i][0]
        pLat1 = pointList[i][1]

        if (i == iCount - 1):

            pLon2 = pointList[0][0]
            pLat2 = pointList[0][1]
        else:
            pLon2 = pointList[i + 1][0]
            pLat2 = pointList[i + 1][1]

        if ((aLat >= pLat1) and (aLat < pLat2)) or ((aLat >= pLat2) and (aLat < pLat1)):

            if (abs(pLat1 - pLat2) > 0):

                pLon = pLon1 - ((pLon1 - pLon2) * (pLat1 - aLat)) / (pLat1 - pLat2);

                if (pLon < aLon):
                    iSum += 1

    if (iSum % 2 != 0):
        return True
    else:
        return False


def main():
    list = [(121.016375,14.564234),(121.011890,14.559935),(121.015473,14.558689)]

    print IsPtInPoly(121.016096,14.561409,list)
    # print haversine(121.016000,14.560553,121.019519,14.561488)

if __name__ =='__main__':
    main()