package com.trading.service;
 
import java.util.List;
import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.trading.mapper.TradingMapper;
 
@Service
public class TradingServiceImpl implements TradingService{
 
    @Autowired
    TradingMapper mapper;
    
    @Override
    public List<Map<String, Object>> SelectAllList() throws Exception {
        return mapper.SelectAllList();
    }
    @Override
    public List<Map<String, Object>> minlist() throws Exception {
        return mapper.minlist();
    }
    @Override
    public List<Map<String, Object>> daylist() throws Exception {
        return mapper.daylist();
    }
    @Override
    public List<Map<String, Object>> stockji() throws Exception {
        return mapper.stockji();
    }
    @Override
    public List<Map<String, Object>> newsdata() throws Exception {
        return mapper.newsdata();
    }
    @Override
    public List<Map<String, Object>> Todaylist() throws Exception {
        return mapper.Todaylist();
    }
    @Override
    public List<Map<String, Object>> lastlist() throws Exception {
        return mapper.lastlist();
    }
}