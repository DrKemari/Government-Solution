#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57102 "Employee Handover Header"
{
    DataCaptionFields = "Document No","Employee No","Employee Name";
    DrillDownPageID = "Employee Handover List";
    LookupPageID = "Employee Handover List";

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then
                  "Employee Name":=Employee.FullName;
                EmployeeHandoverLines.Reset;
                EmployeeHandoverLines.SetRange("Document No","Document No");
                if EmployeeHandoverLines.FindFirst then
                  EmployeeHandoverLines.DeleteAll;
                MiscArticleInformation.Reset;
                MiscArticleInformation.SetRange("Employee No.","Employee No");
                MiscArticleInformation.SetRange("In Use",true);
                if MiscArticleInformation.FindSet then begin
                  repeat
                    EmployeeHandoverLines.Init;
                    EmployeeHandoverLines."Document No":="Document No";
                    EmployeeHandoverLines."Line No":=MiscArticleInformation."Line No.";
                    EmployeeHandoverLines.Code:=MiscArticleInformation."Misc. Article Code";
                    EmployeeHandoverLines.Description:=MiscArticleInformation.Description;
                    EmployeeHandoverLines."Serial No":=MiscArticleInformation."Serial No.";
                    EmployeeHandoverLines.Insert;
                  until MiscArticleInformation.Next = 0;
                end;
            end;
        }
        field(3;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Handover Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup";
        }
        field(6;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'New,Approval Pending,Approved';
            OptionMembers = New,"Approval Pending",Approved;
        }
        field(8;Processed;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Handover Nos.");
        "Document No":=NoSeriesManagement.GetNextNo(HumanResourcesSetup."Employee Nos.",Today,true);
        "Created By":=UserId;
        "Created On":=CreateDatetime(Today,Time);
        "Handover Date":=Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        MiscArticleInformation: Record "Misc. Article Information";
        EmployeeHandoverLines: Record "Employee Handover Lines";
}

