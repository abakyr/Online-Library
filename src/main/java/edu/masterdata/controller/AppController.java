package edu.masterdata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/", "/home"})
public class AppController {

    @RequestMapping({"/"})
    public String welcome(Model model){
        return "welcome";
    }

}
