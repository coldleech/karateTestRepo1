package com.karate;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("karate","responseMatcher","validateJSONarray","validateXMLarray").relativeTo(getClass());
}
}