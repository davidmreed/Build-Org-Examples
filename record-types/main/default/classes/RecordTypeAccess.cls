public with sharing class RecordTypeAccess {
    public static void accessAccountRecordTypes() {
        System.debug(
            [
                SELECT RecordTypeId
                FROM Account
                LIMIT 1
            ]
        );
    }
}
