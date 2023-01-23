public with sharing class PackageRecordTypeAccess {
    public static void accessAccountRecordTypes() {
        System.debug(
            [
                SELECT RecordTypeId
                FROM Sample__c
                LIMIT 1
            ]
        );
    }
}
