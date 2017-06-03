package com.kalian.cas.authentication.yanzhengma;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.jasig.cas.authentication.UsernamePasswordCredential;

public class UsernamePasswordCaptchaCredential extends UsernamePasswordCredential  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8997403977917163501L;
	
	@NotNull
    @Size(min=1,message = "请您输入验证码")
    private String captcha;

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}
	
	
}
