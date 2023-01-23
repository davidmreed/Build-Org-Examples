# Content Notes

sfdx force:package:create -n Content-Notes -t Unlocked -r content-notes
sfdx force:package:version:create -d content-notes -x -f config/basic-org.json -w 100
> ERROR running force:package:version:create:  ContentNoteAccess: Invalid type: Schema.ContentNote
sfdx force:package:version:create -d content-notes -x -f config/with-content-notes.json -w 100
> Successfully created the package version [08c1R000000XZxEQAW]. Subscriber Package Version Id: 04t1R000000kZKlQAM
> Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1R000000kZKlQAM
> As an alternative, you can use the "sfdx force:package:install" command.

# Record Types

sfdx force:package:create -n Record-Types -t Unlocked -r record-types
sfdx force:package:version:create -d record-types -x -f config/basic-org.json -w 100

```
ERROR running force:package:version:create:  RecordTypeAccess: SELECT RecordTypeId
                       ^
ERROR at Row:2:Column:24
No such column 'RecordTypeId' on entity 'Account'. If you are attempting to use a custom field, be sure to append the '__c' after the custom field name. Please reference your WSDL or the describe call for the appropriate names.
```

sfdx force:package:version:create -d record-types -x -f config/with-account-record-types.json -w 100

```
Successfully created the package version [08c5f000000PCZyAAO]. Subscriber Package Version Id: 04t5f000000Jn2AAAS
Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000Jn2AAAS
As an alternative, you can use the "sfdx force:package:install" command.
```

# Dependency Package Record Types

sfdx force:package:create -n Dependency-Package-Base -t Unlocked -r dependency-package-base
sfdx force:package:version:create -d dependency-package-base -x -f config/basic-org.json -w 100

sfdx force:package:create -n Dependency-Package-Record-Types -t Unlocked -r dependency-package-record-types
sfdx force:package:version:create -d dependency-package-record-types -x -f config/basic-org.json -w 100

```
ERROR running force:package:version:create:  PackageRecordTypeAccess: SELECT RecordTypeId
                       ^
ERROR at Row:2:Column:24
No such column 'RecordTypeId' on entity 'Sample__c'. If you are attempting to use a custom field, be sure to append the '__c' after the custom field name. Please reference your WSDL or the describe call for the appropriate names.
```

# Standard Value Sets

sfdx force:package:create -n Standard-Value-Sets -t Unlocked -r standard-value-sets
sfdx force:package:version:create -d standard-value-sets -x -f config/basic-org.json -w 100

```
ERROR running force:package:version:create:  Case.Customer Support Case: Picklist value: Evaluating not found
```