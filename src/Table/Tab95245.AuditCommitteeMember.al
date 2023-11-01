#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95245 "Audit Committee Member"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // AuditCommittees.RESET
                // AuditCommittees.SETRANGE(AuditCommittees."Document No.", "Document No.");
                // IF AuditCommittees.FINDSET THEN
                //  "Document No.":= AuditCommittees."Document No.";
            end;
        }
        field(2;"Committee Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Committee Types"."Committee Type";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant,Board Member';
            OptionMembers = Member,Chairperson,Secretary,Consultant,"Board Member";
        }
        field(5;"Member No.";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Resource Table (This shall support definition of both staff and non-staff (e.g. Experts and Consultants) who form the committee';
            TableRelation = if (Role=const(Member)) Employee
                            else if (Role=const("Board Member")) "Responsibility Center"
                            else if (Role=const(Secretary)) Employee
                            else if (Role=const(Consultant)) Employee
                            else if (Role=const(Chairperson)) Employee;

            trigger OnValidate()
            begin
                //cc
                 Resc.Reset;
                  Resc.SetRange(Code,"Staff  No.");
                  if Resc.FindSet then begin
                     "Member Name":= Resc.Name+' '+Resc."Name 2";
                    "Member Email":=Resc."E-Mail";
                    "Telephone No.":=Resc.Contact;
                    end;




                 Emp.Get;
                 Emp.SetRange("No.","Member No.");
                 if Emp.FindSet then begin
                  "Member Name":=Emp."First Name"+' '+Emp."Middle Name" +' '+Emp."Last Name";

                  Emp.Reset;
                  Emp.SetRange("No.","Member No.");
                  if Emp.FindSet then begin
                    "Staff  No.":=Emp."No.";
                    Designation:=Emp."Job Title";
                    "ID/Passport No":=Emp."ID Number";
                    "Tax Registration (PIN) No.":=Emp."P.I.N";
                    "Member Email":=Emp."Company E-Mail";
                    "Telephone No.":=Emp."Phone No.";
                    end;

                  end;
            end;
        }
        field(6;"Member Name";Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Designation;Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"ID/Passport No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Tax Registration (PIN) No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Member Email";Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Telephone No.";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Staff  No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Role=const(Member)) Employee
                            else if (Role=const("Board Member")) Vendor where ("Vendor Type"=filter(Director))
                            else if (Role=const(Secretary)) Employee
                            else if (Role=const(Consultant)) Employee
                            else if (Role=const(Chairperson)) Employee;

            trigger OnValidate()
            begin
                //cc
                 Resc.Reset;
                  Resc.SetRange(Code,"Staff  No.");
                  if Resc.FindSet then begin
                     "Member Name":= Resc.Name+' '+Resc."Name 2";
                    "Member Email":=Resc."E-Mail";
                    "Telephone No.":=Resc.Contact;
                    end;

                //cc
                Vend.Reset;
                Vend.SetRange("No.","Staff  No.");
                if Vend.FindSet then begin
                  "Member Name":=Vend.Name;
                  "Member Email":=Vend."E-Mail";
                 "Telephone No.":=Vend."Phone No.";
                  end;



                 Emp.Reset;
                  Emp.SetRange("No.","Staff  No.");
                  if Emp.FindSet then begin
                    Emp.CalcFields("Job Title");
                    "Member Name":= Emp."First Name"+' '+Emp."Last Name";
                    Designation:=Emp."Job Title";
                    "ID/Passport No":=Emp."ID Number";
                    "Tax Registration (PIN) No.":=Emp."P.I.N";
                    "Member Email":=Emp."Company E-Mail";
                    "Telephone No.":=Emp."Phone No.";
                    end;
            end;
        }
        field(13;"IFS Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(14;"Notified on Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Date/Time Notified";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16;Destination;Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type" where (Category=filter("Project Team"));
        }
        field(17;"No. of Days";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                IfsCommitte.Reset;
                IfsCommitte.SetRange("Document No.","Document No.");
                if IfsCommitte.FindSet then begin
                  if IfsCommitte."Primary Region"<>'' then begin
                  if Destination<>IfsCommitte."Primary Region" then
                    Error(TXT002,IfsCommitte."Primary Region");
                  end;
                  end;
                  HumanResourcesSetup.Get;
                    if ResourceRec.Get("Member No.") then begin
                    ResourceRec.Reset;
                    ResourceRec.SetRange("No.","Member No.");
                    if ResourceRec.FindSet then begin
                        ResourceCost.SetRange(Code,ResourceRec."Resource Group No.");
                        ResourceCost.SetRange("Work Type Code",Destination);
                            if ResourceCost.FindSet then begin
                            "Unit Amount":=ResourceCost."Direct Unit Cost";

                            end;


                          "Total Amount":="Unit Amount"*"No. of Days";
                    end;


                 end;
                 //END

            end;
        }
        field(18;"Total Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;Type;Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where (Type=filter(Imprest));

            trigger OnValidate()
            begin
                /*IF AdvanceTypes.GET(Type) THEN
                  "G/l Account":=AdvanceTypes."G/L Account";*/

            end;
        }
        field(20;"Unit Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50000;"Active?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Committee Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Resources: Record Resource;
        Emp: Record Employee;
        HRemp: Record Employee;
        ResourceRec: Record Resource;
        ResourceCost: Record "Resource Cost";
        AdvanceTypes: Record "Receipts and Payment Types1";
        WorkType: Record "Work Type";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        IfsCommitte: Record "IFS Tender Committee";
        TXT001: label 'The training course %1,is only allowed for the job group %2';
        TXT002: label 'The destination selected is not in the training region selected,Kindly select %1';
        HumanResourcesSetup: Record "Human Resources Setup";
        ProcCommType: Record "Procurement Committee Types";
        NoOfMembers: Integer;
        AuditCommittees: Record "Audit Committees";
        Resc: Record "Responsibility Center";
        Vend: Record Vendor;
}

