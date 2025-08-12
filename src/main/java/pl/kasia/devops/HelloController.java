package pl.kasia.devops;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class HelloController {

    @GetMapping("/status")
    public String status() {
        return "App is running 🚀 " + LocalDateTime.now();
    }
}

