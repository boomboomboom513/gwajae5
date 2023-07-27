package com.trading.controller;
import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.trading.MyWebSocketHandler;
import com.trading.service.TradingService;

@RestController
@EnableScheduling
public class TradingController {
	
    @Resource
    private TradingService service;
    @Autowired
    private MyWebSocketHandler myWebSocketHandler;

    @GetMapping(value = "main")
    public ModelAndView main(Map<String, Object> map) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 데이터 가져오기
        List<Map<String, Object>> lastlist = service.lastlist();
        List<Map<String, Object>> daylist = service.daylist();
        List<Map<String, Object>> Todaylist = service.Todaylist();
        List<Map<String, Object>> newsdata = service.newsdata();
        List<Map<String, Object>> chartData = service.Todaylist();

        // WebSocket 핸들러에 데이터 전송
        myWebSocketHandler.sendDataToClients();

        mv.setViewName("main");
        mv.addObject("last", lastlist);
        mv.addObject("day", daylist);
        mv.addObject("today", Todaylist);
        mv.addObject("news", newsdata);
        mv.addObject("chart", chartData);

        return mv;
    }

    @RequestMapping(value = "list")
    public ModelAndView AllListView(Map<String, Object> map) throws Exception {
        ModelAndView mv = new ModelAndView();

        List<Map<String, Object>> AllList = service.Todaylist();
        mv.setViewName("list");
        mv.addObject("Alllist", AllList);

        return mv;
    }

    @RequestMapping("charts")
    public ModelAndView charts() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> chart = service.Todaylist();
        mv.addObject("chart", chart);
        mv.setViewName("charts");
        return mv;
    }

    @RequestMapping("chart")
    public ModelAndView chart(Map<String, Object> map) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> chart = service.Todaylist();
        mv.addObject("chart", chart);
        mv.setViewName("chart");

        return mv;
    }
    @RequestMapping("stock")
    public ModelAndView stock(Map<String, Object> map) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> stock = service.stockji();
        mv.addObject("stock", stock);
        mv.setViewName("stock");

        return mv;
    }

    @RequestMapping(value = "chart/data")
    public List<Map<String, Object>> chartData() throws Exception {
        // WebSocket 핸들러에 데이터 전송
        myWebSocketHandler.sendDataToClients();
//        System.out.println("들어간거야!");
        return service.Todaylist();
    }
    
    @RequestMapping(value = "stock/data")
    public List<Map<String, Object>> stockji() throws Exception {
        return service.stockji();
    }


    @RequestMapping(value = "main/data")
    public List<Map<String, Object>> daylist() throws Exception {
        // WebSocket 핸들러에 데이터 전송
        myWebSocketHandler.sendDataToClients();
        System.out.println("들어간거야!");
        return service.daylist();
    }
    // 5초마다 chartData() 메서드를 호출하여 데이터를 업데이트합니다.
    @Scheduled(fixedRate = 1000)
    public void updateChartData() {
        try {
            myWebSocketHandler.sendDataToClients();
            System.out.println("chartData 업데이트!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 5초마다 daylist() 메서드를 호출하여 데이터를 업데이트합니다.
//    @Scheduled(fixedRate = 5000)
//    public void updateDaylist() {
//        try {
//            myWebSocketHandler.sendDataToClients();
//            System.out.println("daylist 업데이트!");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }




}
