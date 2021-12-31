package com.codegym.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.TimeZone;

@Controller
public class TimeController {
    @GetMapping("/world-clock")
    public String getTimeByTimezone(ModelMap model, @RequestParam(name = "city", required = false, defaultValue = "Asia/Ho_Chi_Minh") String city) {
        Date date = new Date();
        TimeZone local = TimeZone.getDefault();
        TimeZone localTimeZone = TimeZone.getTimeZone(city);
        long local_time = date.getTime() + (localTimeZone.getRawOffset() - local.getRawOffset());
        date.setTime(local_time);

        model.addAttribute("city", city);
        model.addAttribute("date", date);
        return "index";
    }
}