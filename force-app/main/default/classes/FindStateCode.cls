public with sharing class FindStateCode {
  public class InputWrapper {
    @InvocableVariable(label='State Name')
    public String stateName;
  }

  public class OutputWrapper {
    @InvocableVariable(label='State Code')
    public String stateCode;
  }

  @InvocableMethod(
    label='Find State Code'
    description='Enter the value of a single state name. This action will look up its state code from Salesforce\'s list of states enabled in your org.'
  )
  public static List<OutputWrapper> getStateCode(List<InputWrapper> requests) {
    List<OutputWrapper> responses = new List<OutputWrapper>();

    Schema.DescribeFieldResult fieldResult = User.StateCode.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

    Map<String, String> labelToValue = new Map<String, String>();
    for (Schema.PicklistEntry entry : ple) {
      labelToValue.put(entry.getLabel(), entry.getValue());
    }

    for (InputWrapper req : requests) {
      OutputWrapper res = new OutputWrapper();
      if (labelToValue.containsKey(req.stateName)) {
        res.stateCode = labelToValue.get(req.stateName);
      } else {
        res.stateCode = null;
      }
      responses.add(res);
    }

    return responses;
  }
}