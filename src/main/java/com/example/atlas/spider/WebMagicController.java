package com.example.atlas.spider;

import com.alibaba.fastjson.JSON;
import com.example.atlas.util.FileWriteUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import us.codecraft.webmagic.Spider;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * /magic/spider
 */
@Controller
@RequestMapping("/magic")
public class WebMagicController {

    @Resource
    private CropPageProcessor cropPageProcessor;

    @RequestMapping(value = "/spider/wheat", method = RequestMethod.GET)
    public String wheat(String num) throws IOException {
        int number = Integer.parseInt(num);
        if (number < 1) {
            number = 100;
        }
        Spider.create(cropPageProcessor).addUrl("http://crop.agridata.cn/show.asp?%B7%D6%C0%E0=%D0%A1%C2%F3%CF%B5%C6%D7%CA%FD%BE%DD%BF%E2&%D7%F7%CE%EF=%D0%A1%C2%F3").thread(1).run();
        cropPageProcessor.setSiteCooick(cropPageProcessor.key, cropPageProcessor.value);
        for (int i = 2; i < number; i++) {
            Spider.create(cropPageProcessor).addUrl("http://crop.agridata.cn/show.asp?page=" + i).thread(1).run();
        }
//        FileWriteUtil.getFileWrite().colseIO();
        return "/index";
    }

    @RequestMapping(value = "/spider/rice", method = RequestMethod.GET)
    public String rice(String num) throws IOException {
        int number = Integer.parseInt(num);
        if (number < 1) {
            number = 100;
        }
        Spider.create(cropPageProcessor).addUrl("http://crop.agridata.cn/show.asp?%B7%D6%C0%E0=%D3%FD%B3%C9%C6%B7%D6%D6%BC%B0%CF%B5%C6%D7%CA%FD%BE%DD%BF%E2&%D7%F7%CE%EF=%CB%AE%B5%BE").thread(1).run();
        cropPageProcessor.setSiteCooick(cropPageProcessor.key, cropPageProcessor.value);
        for (int i = 2; i < number; i++) {
            Spider.create(cropPageProcessor).addUrl("http://crop.agridata.cn/show.asp?page=" + i).thread(1).run();
        }
//        FileWriteUtil.getFileWrite().colseIO();
        return "/index";
    }
}
