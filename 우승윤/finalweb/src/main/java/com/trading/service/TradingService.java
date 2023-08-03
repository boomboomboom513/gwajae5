package com.trading.service;

import java.util.List;
import java.util.Map;

public interface TradingService {
  
    public List<Map<String, Object>> SelectAllList() throws Exception;
    public List<Map<String, Object>> minlist() throws Exception;
    public List<Map<String, Object>> daylist() throws Exception;
    public List<Map<String, Object>> stockji() throws Exception;
    public List<Map<String, Object>> Todaylist() throws Exception;
    public List<Map<String, Object>> newsdata() throws Exception;
    public List<Map<String, Object>> lastlist() throws Exception;
}