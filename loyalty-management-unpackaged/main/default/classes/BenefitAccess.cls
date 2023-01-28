public with sharing class BenefitAccess {
    public static void accessBenefits() {
        System.debug(
            [
                SELECT Id
                FROM Benefit
                LIMIT 1
            ]
        );
    }
}
