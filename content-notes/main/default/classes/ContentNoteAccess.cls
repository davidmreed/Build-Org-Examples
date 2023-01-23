public with sharing class ContentNoteAccess {
    public static void accessContentNotes() {
        System.debug(
            [
                SELECT Id
                FROM ContentNote
                LIMIT 1
            ]
        );
    }
}
