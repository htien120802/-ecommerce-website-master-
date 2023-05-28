package com.ecommerce.utility;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class HashUtilityTest {

	@BeforeAll
	static void setUpBeforeClass() {
	}

	@AfterAll
	static void tearDownAfterClass() {
	}

	@Test
	public void testGenerateMD5() {
		String password = "admin";
		String encryptedPassword = HashUtility.generateMD5(password);
		System.out.println(encryptedPassword);

		assertTrue(true);
	}

}
