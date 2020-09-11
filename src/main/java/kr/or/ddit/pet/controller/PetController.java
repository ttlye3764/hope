package kr.or.ddit.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/pet/")
public class PetController {
	
	@RequestMapping("petMain")
	public void memberList() throws Exception {}

}
