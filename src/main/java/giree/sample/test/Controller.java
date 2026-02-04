package giree.sample.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String root() {
        return "Spring Boot + Jenkins working fine!";
    }

}
