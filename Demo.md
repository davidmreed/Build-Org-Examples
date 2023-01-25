# Settings Dependency: Enhanced Notes

sfdx force:package:create -n Content-Notes -t Unlocked -r content-notes
sfdx force:package:version:create -d content-notes -x -f config/basic-org.json -w 100
```
ERROR running force:package:version:create:  ContentNoteAccess: Invalid type: Schema.ContentNote
sfdx force:package:version:create -d content-notes -x -f config/with-content-notes.json -w 100
Successfully created the package version [08c1R000000XZxEQAW]. Subscriber Package Version Id: 04t1R000000kZKlQAM
Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1R000000kZKlQAM
As an alternative, you can use the "sfdx force:package:install" command.
```

# Schema Dependency: Record Types

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

sfdx force:package:version:create -d dependency-package-record-types -x -f config/with-dependency-record-type.json -w 100

```
ERROR running force:package:version:create:  Sample__c: Must specify a non-empty label for the CustomObject
```

This indicates that the custom object doesn't exist at deployment time. Demonstrates order of operations - settings.zip is deployed before dependencies.

sfdx force:package:install --package 04t5f000000Jn2FAAS -u snapshot-org -w 100
Create Record Type in snapshot-org

sfdx force:org:snapshot:create -n DependencyTest --sourceorg snapshot-org

```
ERROR running force:package:version:create:  An error occurred while trying to install a package dependency, ID 04t4p000001zyjg: package.xml: Cannot add component of type:CustomObject named:Sample__c subjectId:01I8H000000m392 to another package because it is an installed component.
```

Whoa. Maybe it's because the object isn't namespaced? Or that same 2GP bug as with Workflow Rules?

# Standard Value Sets

sfdx force:package:create -n Standard-Value-Sets -t Unlocked -r standard-value-sets
sfdx force:package:version:create -d standard-value-sets -x -f config/basic-org.json -w 100

```
ERROR running force:package:version:create:  Case.Customer Support Case: Picklist value: Evaluating not found
```

# Feature Dependency: Action Plans
sfdx force:package:create -n Action-Plans -t Unlocked -r action-plans
sfdx force:package:version:create -d action-plans -x -w 100
ERROR running force:package:version:create:  Contact-Contact Layout: Invalid field:Name in related list:ActionPlan

sfdx force:package:version:create -d action-plans -x -w 100 -f config/with-action-plans.json

Successfully created the package version [08c4p00000008cIAAQ]. Subscriber Package Version Id: 04t4p000001zyp0AAA
Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4p000001zyp0AAA
As an alternative, you can use the "sfdx force:package:install" command.


# Feature Dependency Requiring Org Shape
