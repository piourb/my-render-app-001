package org.pu.simpleweb.SimpleWeb;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleRequest {

    @GetMapping("/")
    public String index() {
        return "<html><body>Greetings from Spring Boot! - Sample SSL configuration</body></html>";
    }

}