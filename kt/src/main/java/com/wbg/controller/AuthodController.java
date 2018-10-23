package com.wbg.controller;

import com.wbg.dao.AuthodMapper;
import com.wbg.entity.Authod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/authod")
public class AuthodController {
    @Autowired
    private AuthodMapper authodMapper;

    @RequestMapping(method = RequestMethod.GET)
    public String index (@RequestParam(defaultValue = "1") int page, Model model) {

        List<Authod> authod = authodMapper.selectAll();
        model.addAttribute("authod", authod);
        return "authod";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String create (Authod authod) {
        System.out.println(authod);
        authodMapper.insert(authod);
        System.out.println(authod);
        return "redirect:/authod";
    }
    @RequestMapping(value = "/del/{aid}",method = RequestMethod.GET)
    public String delete(@PathVariable("aid") int aid){
        authodMapper.deleteByPrimaryKey(aid);
        return "redirect:/authod";
    }
}
