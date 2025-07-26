public with sharing class FindCountryCode {
  public class InputWrapper {
    @InvocableVariable(label='Country Name')
    public String countryName;
  }

  public class OutputWrapper {
    @InvocableVariable(label='Country Code')
    public String countryCode;
  }

  @InvocableMethod(
    label='Find Country Code'
    description='Enter the value of a single country name. This action will look up its country code from Salesforce\'s list of countries enabled in your org.'
  )
  public static List<OutputWrapper> getCountryCode(
    List<InputWrapper> requests
  ) {
    List<OutputWrapper> responses = new List<OutputWrapper>();

    Schema.DescribeFieldResult fieldResult = User.CountryCode.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

    Map<String, String> labelToValue = new Map<String, String>();
    for (Schema.PicklistEntry entry : ple) {
      labelToValue.put(entry.getLabel(), entry.getValue());
    }

    for (InputWrapper req : requests) {
      OutputWrapper res = new OutputWrapper();
      if (labelToValue.containsKey(req.countryName)) {
        res.countryCode = labelToValue.get(req.countryName);
      } else {
        res.countryCode = null;
      }
      responses.add(res);
    }

    return responses;
  }
}