@isTest
private class FindStateCodeTest {
    @isTest
    static void testGetStateCode() {
        
        FindStateCode.InputWrapper input = new FindStateCode.InputWrapper();
        input.stateName = 'New South Wales';

        List<FindStateCode.InputWrapper> inputs = new List<FindStateCode.InputWrapper>{ input };

        List<FindStateCode.OutputWrapper> results = FindStateCode.getStateCode(inputs);

        System.assertEquals(1, results.size(), 'Expected 1 result');
        System.assertNotEquals(null, results[0].stateCode, 'Expected a state code to be returned.');
        System.assertEquals('NSW', results[0].stateCode, 'Expected State Code NSW for input of New South Wales');
    }

    @isTest
    static void testGetStateCodeWithInvalidValue() {
        FindStateCode.InputWrapper input = new FindStateCode.InputWrapper();
        input.stateName = 'InvalidStateName';

        List<FindStateCode.InputWrapper> inputs = new List<FindStateCode.InputWrapper>{ input };

        List<FindStateCode.OutputWrapper> results = FindStateCode.getStateCode(inputs);

        System.assertEquals(1, results.size(), 'Expected 1 result');
        System.assertEquals(null, results[0].stateCode, 'Expected result to be null when provided with InvalidStateName.');
    }
}