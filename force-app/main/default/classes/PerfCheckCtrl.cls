public class PerfCheckCtrl{

    @AuraEnabled(cacheable = false)
    public static Map < String, Object > fetchCPQSettings() {
        Map < String, Object > mapSettingsData = new Map < String, Object > ();
        String[] settings = new String[] {
            'UowMode',
            'UseAssetReferenceIdForParentAndRoot',
            'CachedQueryMode',
            'LevelBasedApproach',
            'CacheAPI.SkinnyBasket',
            'CacheAPI.TrimMode',
            'CacheEnabled',
            'DeltaPrice',
            'DeltaValidate'
        };
        
        List < %vlocity_namespace%__CpqConfigurationSetup__c > cpqConfigurationSetups = [SELECT Name, %vlocity_namespace%__SetupValue__c FROM %vlocity_namespace%__CpqConfigurationSetup__c where Name in: settings];
        for (String setting: settings) {
            if (setting.equalsIgnoreCase('CacheAPI.SkinnyBasket')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Performance gain for Asset To Basket transaction(Quantify)');
                value.put('Current', 'Not Present');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('UowMode')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'CPQ APIs  have shown up to  30% overall improvement with this mode on.');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('UseAssetReferenceIdForParentAndRoot')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Performance improvement for Add to cart up to 7%');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('CachedQueryMode')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Performance improvement for most of the Cart API as queries get response from DB');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('LevelBasedApproach')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Perform better for product bundle with Depth > 2');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('CacheAPI.TrimMode')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', ' For logged in flow average improvement percentage improvement was found around 30% and for anonymous flow it was around 28% improvement');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('CacheEnabled')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Supports platform caching.  To use context rules, including the Tightest Match service, CacheEnabled must be set to true.');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('DeltaPrice')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Better performance for larger cart (quantify)');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            } else if (setting.equalsIgnoreCase('DeltaValidate')) {
                Map < String, Object > value = new Map < String, Object > ();
                value.put('Expected', 'True');
                value.put('Description', 'Better performance for large number (>50) of items in the cart');
                value.put('Current', 'Not Preset');
                for (%vlocity_namespace%__CpqConfigurationSetup__c configurationSetup: cpqConfigurationSetups) {
                    if (configurationSetup.Name == setting)
                        value.put('Current', configurationSetup.%vlocity_namespace%__SetupValue__c);
                    mapSettingsData.put(setting, value);
                }
            }
        }

        return mapSettingsData;
    }

    // @AuraEnabled(cacheable = false)
    // public static Map < String, Object > fetchFeatureSettings() {
    //     Map < String, Object > mapSettingsData = new Map < String, Object > ();
    //     String[] features = new String[] {
    //         'EnableV2AttributeModel'
    //     };
    //     List < %vlocity_namespace%__VlocityFeature__c > featuresList = [SELECT Name, %vlocity_namespace%__SetupValue__c FROM %vlocity_namespace%__VlocityFeature__c where Name in: features];
    //     for (String f: features) {
    //         if (f.equalsIgnoreCase('EnableV2AttributeModel')) {
    //             Map < String, Object > value = new Map < String, Object > ();
    //             value.put('Expected', 'True');
    //             value.put('Description', 'DB Storage usage is lesser with V2 Json model enable');
    //             value.put('Current', 'Not Present');
    //             for (%vlocity_namespace%__VlocityFeature__c featureSetup: featuresList) {
    //                 if (featureSetup.Name == f)
    //                     value.put('Current', featureSetup.%vlocity_namespace%__SetupValue__c);
    //                 mapSettingsData.put('V2 Attribute Model', value);
    //             }
    //         }
    //     }
    //     return mapSettingsData;
    // }

    @AuraEnabled(cacheable = false)
    public static Map < String, Object > fetchIndex() {
        Map < String, Object > mapSettingsData = new Map < String, Object > ();
        String[] nameFilters = new String[]{'%vlocity_namespace%__ParentItemId__c', '%vlocity_namespace%__RootItemId__c','%vlocity_namespace%__AssetReferenceId__c'};
List<FieldDefinition> myList = [ SELECT QualifiedApiName,EntityDefinition.QualifiedApiName,IsIndexed FROM FieldDefinition WHERE EntityDefinition.QualifiedApiName in ('OpportunityLineItem', 'OrderItem', 'QuoteLineItem') and QualifiedApiName LIKE :nameFilters];

        For(FieldDefinition fd: myList){
           String objectField = fd.EntityDefinition.QualifiedApiName+'.'+fd.QualifiedApiName;
           mapSettingsData.put(objectField, fd.IsIndexed);
            system.debug(fd.EntityDefinition.QualifiedApiName+' : '+fd.QualifiedApiName+' : '+fd.IsIndexed);
            }
        return mapSettingsData;
    }
}