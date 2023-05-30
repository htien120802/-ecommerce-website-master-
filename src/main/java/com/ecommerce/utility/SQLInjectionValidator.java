package com.ecommerce.utility;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SQLInjectionValidator {
    private static final String SQL_INJECTION_REGEX = ".*[;\\\\\\',\"].*";

    public static boolean isInputValid(String... paramters) {
        Pattern pattern = Pattern.compile(SQL_INJECTION_REGEX);
        Matcher matcher;
        for (String paramter : paramters){
            matcher = pattern.matcher(paramter);
            if (matcher.matches())
                return false;
        }
        return true;
    }
}
