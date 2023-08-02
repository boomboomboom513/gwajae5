package com.trading.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradingMapper {
	public List<Map<String, Object>> SelectAllList() throws Exception;
	public List<Map<String, Object>> minlist() throws Exception;
	public List<Map<String, Object>> newsdata() throws Exception;
	public List<Map<String, Object>> daylist() throws Exception;
	public List<Map<String, Object>> stockji() throws Exception;
	public List<Map<String, Object>> Todaylist() throws Exception;
	public List<Map<String, Object>> lastlist() throws Exception;
//    List<Stock> getAllStocks();
//    List<Stock> getStocksByItemCode(String itemCode);
//    List<Stock> getStocksByItemName(String itemName);
//    List<Stock> getStocksByDate(Date date);
//    List<Stock> getStocksByTime(int time);
//    List<Stock> getStocksByOpenPrice(int openPrice);
//    List<Stock> getStocksByHighPrice(int highPrice);
//    List<Stock> getStocksByLowPrice(int lowPrice);
//    List<Stock> getStocksByClosePrice(int closePrice);
//    List<Stock> getStocksByTransactionVolume(int transactionVolume);
//    List<Stock> getStocksByTransactionVolumeCumulative(int transactionVolumeCumulative);
//    List<Stock> getStocksByContractedSellQuantity(int contractedSellQuantity);
//    List<Stock> getStocksByContractedBuyQuantity(int contractedBuyQuantity);
}
