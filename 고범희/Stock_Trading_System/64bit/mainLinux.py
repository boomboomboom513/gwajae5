import pandas as pd
import numpy as np
import datetime as dt
import time
import argparse
import warnings
warnings.filterwarnings('ignore')

import timeCh
import databased
import subpub64bit
import jipyo
import newslabel
import datahap
import reinforcementLearning
import data_manager

stockNameList = ['루닛']
stockCodeList = ['328130']
database = ['34.64.50.135','root','P@ssw0rd6388','stockdata']

jong = []
actions = []
lock = False

# parser = argparse.ArgumentParser()
# args = parser.parse_args()

# if args.rl_method == 'a3c':
#     learner = A3CLearner(**{
#         **common_params, 
#         'list_stock_code': list_stock_code, 
#         'list_chart_data': list_chart_data, 
#         'list_training_data': list_training_data,
#         'list_min_trading_price': list_min_trading_price, 
#         'list_max_trading_price': list_max_trading_price,
#         'value_network_path': value_network_path, 
#         'policy_network_path': policy_network_path})

# assert learner is not None

# if args.mode in ['train', 'test', 'update']:
#     learner.run(learning=learning)
#     if args.mode in ['train', 'update']:
#         learner.save_models()
# elif args.mode == 'predict':
#     learner.predict()




while True:
    timeNow = dt.datetime.now()
    # timeNow = dt.datetime(2023,7,5,14,55)
    if 1520 >= timeNow.hour * 100 + timeNow.minute >= 900:
        lock = False
        
        subpub64bit.dataSubPub().sub()
        
        getStockData = databased.database(stockCodeList, stockNameList, database, timeNow).download()

        jipyoDf = jipyo.jipyoCreate(getStockData[1], timeNow).create()
        newsScore = newslabel.newslabel(getStockData[2]).labeling()
        hapDf = datahap.dataHap(getStockData[0], jipyoDf, newsScore).hap()
        hapDf.drop(['종목코드','종목명','날짜'], axis=1, inplace=True)

        actionResult = reinforcementLearning.rl(hapDf).dp()
        subpub64bit.dataSubPub().pub(actionResult)

        timeNow = dt.datetime.now()
        print('[시스템]:'+str(timeNow.hour)+'시 '+str(timeNow.minute + 1)+'분이 되기 기다리는 중...')
        secondLeft = 60 - int(timeNow.second)
        time.sleep(secondLeft)
    else:
        if lock == False:
            reward = reinforcementLearning.rl(hapDf).reinforce()

            getAllStockData = databased.database(stockCodeList, stockNameList, database, timeNow).allDataGet()

            jipyoDf = jipyo.jipyoCreate(getAllStockData[1], timeNow).create()
            newsScore = newslabel.newslabel(getAllStockData[2]).labeling()
            hapDf = datahap.dataHap(getAllStockData[0], jipyoDf, newsScore).hap()
            hapDf.drop(['종목코드','종목명','날짜'], axis=1, inplace=True)

            reinforcementLearning.rl(hapDf).training(reward)
            lock = True

        print('[시스템]:현재 주식 거래 가능한 시간이 아닙니다. 현재시간 : '+str(timeNow.hour)+'시 '+str(timeNow.minute)+'분')
        time.sleep(1)
        continue
