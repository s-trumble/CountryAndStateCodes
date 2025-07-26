@isTest
private class FindCountryCodeTest {
    @isTest
    static void testGetCountryCode() {
        
        FindCountryCode.InputWrapper input = new FindCountryCode.InputWrapper();
        input.countryName = 'Australia';

        List<FindCountryCode.InputWrapper> inputs = new List<FindCountryCode.InputWrapper>{ input };

        List<FindCountryCode.OutputWrapper> results = FindCountryCode.getCountryCode(inputs);

        System.assertEquals(1, results.size(), 'Expected 1 result');
        System.assertNotEquals(null, results[0].countryCode, 'Expected a country code to be returned.');
        System.assertEquals('AU', results[0].countryCode, 'Expected Country Code AU for input of Australia');
    }

    @isTest
    static void testGetCountryCodeWithInvalidValue() {
        FindCountryCode.InputWrapper input = new FindCountryCode.InputWrapper();
        input.countryName = 'InvalidCountryName';

        List<FindCountryCode.InputWrapper> inputs = new List<FindCountryCode.InputWrapper>{ input };

        List<FindCountryCode.OutputWrapper> results = FindCountryCode.getCountryCode(inputs);

        System.assertEquals(1, results.size(), 'Expected 1 result.');
        System.assertEquals(null, results[0].countryCode, 'Expected result to be null when provided with InvalidCountryName');
    }
}