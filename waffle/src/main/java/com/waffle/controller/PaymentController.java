package com.waffle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	//private static final Logger logger = LoggerFactory.getLogger(PaymentContoller.class);
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String paymentMove() throws Exception{					
		return "payment/pay";
	}
	
	
	@RequestMapping(value="/complete")
	public String payCompleteMove() throws Exception{					
		return "payment/complete";
	}
}
