/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OTP;

import java.util.Random;

/**
 *
 * @author Admin
 */
public class Otp {
    public String generateOTP(){
        String numbers = "0123456789"; 
  
        Random rndm_method = new Random(); 
        int len = 4;
        char[] otp = new char[len]; 
  
        for (int i = 0; i < len; i++) 
        { 
            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length())); 
        } 
        System.out.println(new String(otp));
    return new String(otp);
    }

}
