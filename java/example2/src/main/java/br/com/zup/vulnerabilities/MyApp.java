package br.com.zup.vulnerabilities;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;

public class MyApp {

    private static final Logger logger = LogManager.getLogger();

    public static void main(String[] args) {
        logger.info("MyApp is getting started");
        logger.info("args passed to the program: " + Arrays.stream(args)
                                    .filter(Objects::nonNull)
                                    .collect(Collectors.joining(", ")));
        logger.info("Shutdown my MyApp");
    }
}
