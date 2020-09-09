package com.student.elearning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class rootcontroller {

    @RequestMapping(method = RequestMethod.GET)
    public String main() {
        return "redirect:accounts/sign_in";
    }
}

