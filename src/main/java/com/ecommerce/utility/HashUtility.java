package com.ecommerce.utility;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtility {
	private HashUtility() {

	}

	public static String generateMD5(String message) throws HashException {
		return hashString(message, "MD5");
	}

	private static String hashString(String message, String algorithm) throws HashException {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
			byte[] hashedBytes = messageDigest.digest(message.getBytes(StandardCharsets.UTF_8));
			return convertByteArrayToHexString(hashedBytes);
		} catch (NoSuchAlgorithmException exception) {
			throw new HashException("Could not generate hash from string.", exception);
		}
	}

	private static String convertByteArrayToHexString(byte[] arrayBytes) {
		StringBuilder stringBuilder = new StringBuilder();
		for (byte arrayByte : arrayBytes) {
			stringBuilder.append(Integer.toString((arrayByte & 0xff) + 0x100, 16).substring(1));
		}
		return stringBuilder.toString();
	}
}
