package com.wbg.controller;

import com.wbg.dao.AuthodMapper;
import com.wbg.dao.PostMapper;
import com.wbg.entity.Authod;
import com.wbg.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private AuthodMapper authodMapper;
    @RequestMapping(method = RequestMethod.GET)
    public String index (@RequestParam(defaultValue = "1") int page, Model model) {
        List<Post> post = postMapper.selectJoin();
        List<Authod> authods = authodMapper.selectAll();
        model.addAttribute("post", post);
        model.addAttribute("authod", authods);
        return "post";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String create (Post post) {
        System.out.println(post);
        postMapper.insert(post);
        return "redirect:/post";
    }
    @RequestMapping(value = "/del/{pId}",method = RequestMethod.GET)
    public String delete(@PathVariable("pId") int pId){
        postMapper.deleteByPrimaryKey(pId);
        return "redirect:/post";
    }
}
