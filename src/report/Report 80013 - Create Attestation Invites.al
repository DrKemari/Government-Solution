report 80013 "Create Attestation Invites"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Create Attestation Invites.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = WHERE(Status=CONST(Active));
            RequestFilterFields = "No.","Directorate Code","Department Code";

            trigger OnAfterGetRecord()
            begin

                PolicyDetails.Reset;
                PolicyDetails.SetRange(Code,Policy);
                if PolicyDetails.FindFirst then begin
                   DueDate:=PolicyDetails."Employee Attestation Due Date";
                end;

                PolicyAttestationInvitation.Init;
                PolicyAttestationInvitation."Policy ID":=Policy;
                PolicyAttestationInvitation."Employee No":=Employee."No.";
                PolicyAttestationInvitation.Name:=Employee.FullName;
                PolicyAttestationInvitation."Email address":=Employee."Company E-Mail";
                PolicyAttestationInvitation."Policy Name":=PolicyDetails."Policy Name";
                PolicyAttestationInvitation."External Ref No":=PolicyDetails."External Ref No";
                PolicyAttestationInvitation."Policy Goal":=PolicyDetails."Policy Goal";
                PolicyAttestationInvitation."Due Date":=DueDate;
                PolicyAttestationInvitation."Employee Signing Status":=PolicyAttestationInvitation."Employee Signing Status"::Pending;
                PolicyAttestationInvitation.Insert;
            end;

            trigger OnPostDataItem()
            begin
                Message('Policy Attestation Invites for Policy %1 has been Created,Proceed to Policy Attestation List to send Invites',Policy);
            end;

            trigger OnPreDataItem()
            begin
                if Policy='' then
                  Error('Policy Must have a Value');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Policy;Policy)
                {
                    TableRelation = Policy.Code;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Policy: Code[30];
        PolicyDetails: Record Policy;
        PolicyAttestationInvitation: Record "Policy Attestation Invitation";
        DueDate: Date;
}

